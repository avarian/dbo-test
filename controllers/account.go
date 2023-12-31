package controllers

import (
	"errors"
	"net/http"
	"time"

	"github.com/avarian/dbo-test/model"
	"github.com/avarian/dbo-test/util"
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"github.com/golang-jwt/jwt"
	log "github.com/sirupsen/logrus"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type PostRegisterRequest struct {
	Name        string `json:"name"  validate:"required"`
	Email       string `json:"email"  validate:"required,email"`
	PhoneNumber string `json:"phone_number"  validate:"required"`
	Password    string `json:"password"  validate:"required"`
	Address     string `json:"address"  validate:"required"`
	Type        string `json:"type"`
}

type PostLoginRequest struct {
	Email    string `json:"email"  validate:"required,email"`
	Password string `json:"password"  validate:"required"`
}

type JWTClaim struct {
	Username string `json:"username"`
	Email    string `json:"email"`
	Type     string `json:"type"`
	jwt.StandardClaims
}

type AccountController struct {
	db        *gorm.DB
	validator *util.Validator
	jwtSecret string
}

func NewAccountController(db *gorm.DB, validator *util.Validator, jwtSecret string) *AccountController {
	return &AccountController{
		db:        db,
		validator: validator,
		jwtSecret: jwtSecret,
	}
}

func (s *AccountController) PostRegister(c *gin.Context) {
	// bind data
	var req PostRegisterRequest
	if err := c.ShouldBind(&req); err != nil {
		log.WithField("reason", err).Error("error Binding")
		c.AbortWithStatusJSON(http.StatusUnprocessableEntity, gin.H{"error": err.Error()})
		return
	}
	// validate
	if err := s.validator.Validate.Struct(&req); err != nil {
		log.WithField("reason", err).Error("invalid Request")
		errs := err.(validator.ValidationErrors)
		c.AbortWithStatusJSON(http.StatusUnprocessableEntity, gin.H{"error": errs.Translate(s.validator.Trans)})
		return
	}

	// log
	logCtx := log.WithFields(log.Fields{
		"email": req.Email,
		"api":   "PostRegister",
	})

	typeAccount := "CUSTOMER"
	if req.Type != "" {
		typeAccount = req.Type
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(req.Password), 5)
	if err != nil {
		logCtx.WithField("reason", err).Error("error hash password")
		c.AbortWithStatusJSON(http.StatusUnprocessableEntity, gin.H{"error": err.Error()})
		return
	}

	account := model.Account{
		Address:     req.Address,
		Email:       req.Email,
		Name:        req.Name,
		PhoneNumber: req.PhoneNumber,
		Password:    string(hashedPassword),
		Type:        typeAccount,
	}
	if err := s.db.Create(&account).Error; err != nil {
		logCtx.WithField("reason", err).Error("error create account")
		c.AbortWithStatusJSON(http.StatusUnprocessableEntity, gin.H{"error": err.Error()})
		return
	}

	c.JSON(200, gin.H{
		"message": "Sucess!",
	})
}

func (s *AccountController) PostLogin(c *gin.Context) {
	// bind data
	var req PostLoginRequest
	if err := c.ShouldBind(&req); err != nil {
		log.WithField("reason", err).Error("error Binding")
		c.AbortWithStatusJSON(http.StatusUnprocessableEntity, gin.H{"error": err.Error()})
		return
	}
	// validate
	if err := s.validator.Validate.Struct(&req); err != nil {
		log.WithField("reason", err).Error("invalid Request")
		errs := err.(validator.ValidationErrors)
		c.AbortWithStatusJSON(http.StatusUnprocessableEntity, gin.H{"error": errs.Translate(s.validator.Trans)})
		return
	}

	// log
	logCtx := log.WithFields(log.Fields{
		"email": req.Email,
		"api":   "PostLogin",
	})

	var account model.Account
	if result := s.db.Where("email = ?", req.Email).Find(&account); result.Error != nil || result.RowsAffected == 0 {
		err := errors.New("not found")
		if result.Error != nil {
			err = result.Error
		}
		logCtx.WithField("reason", err).Error("error find account")
		c.AbortWithStatusJSON(http.StatusUnauthorized, nil)
		return
	}

	if err := bcrypt.CompareHashAndPassword([]byte(account.Password), []byte(req.Password)); err != nil {
		// If the two passwords don't match, return a 401 status
		logCtx.WithField("reason", err).Error("error compare password")
		c.AbortWithStatusJSON(http.StatusUnauthorized, nil)
		return
	}

	expirationTime := time.Now().Add(24 * time.Hour)
	claims := &JWTClaim{
		Email:    account.Email,
		Username: account.Email,
		Type:     account.Type,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: expirationTime.Unix(),
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenString, err := token.SignedString([]byte(s.jwtSecret))
	if err != nil {
		logCtx.WithField("reason", err).Error("error generate jwt")
		c.AbortWithStatusJSON(http.StatusUnauthorized, nil)
		return
	}

	c.JSON(200, gin.H{
		"token": tokenString,
	})
}
