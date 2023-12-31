package http

import (
	"errors"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt"
	"github.com/spf13/viper"
)

type JWTClaim struct {
	Username string `json:"username"`
	Email    string `json:"email"`
	Type     string `json:"type"`
	jwt.StandardClaims
}

func Auth() gin.HandlerFunc {
	return func(context *gin.Context) {
		authorization := context.GetHeader("Authorization")
		if authorization == "" {
			context.JSON(401, gin.H{"error": "request does not contain an access token"})
			context.Abort()
			return
		}
		_, tokenString, _ := strings.Cut(authorization, " ")
		username, err := validateToken(tokenString)
		if err != nil {
			context.JSON(401, gin.H{"error": err.Error()})
			context.Abort()
			return
		}

		context.Set("username", username)
		context.Next()
	}
}

func validateToken(signedToken string) (username string, err error) {
	token, err := jwt.ParseWithClaims(
		signedToken,
		&JWTClaim{},
		func(token *jwt.Token) (interface{}, error) {
			return []byte(viper.GetString("jwt_secret")), nil
		},
	)
	if err != nil {
		return
	}
	claims, ok := token.Claims.(*JWTClaim)
	if !ok {
		err = errors.New("couldn't parse claims")
		return
	}
	if claims.ExpiresAt < time.Now().Local().Unix() {
		err = errors.New("token expired")
		return
	}
	username = claims.Username
	return
}
