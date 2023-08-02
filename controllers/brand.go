package controllers

import (
	"errors"
	"net/http"

	"github.com/avarian/dbo-test/model"
	"github.com/avarian/dbo-test/util"
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	log "github.com/sirupsen/logrus"
	"gorm.io/gorm"
)

type PostCreateBrandRequest struct {
	Name        string `json:"name"  validate:"required"`
	Description string `json:"description"  validate:"required"`
}

type PutEditBrandRequest struct {
	Name        string `json:"name"  validate:"required"`
	Description string `json:"description"  validate:"required"`
}

type BrandController struct {
	db        *gorm.DB
	validator *util.Validator
}

func NewBrandController(db *gorm.DB, validator *util.Validator) *BrandController {
	return &BrandController{
		db:        db,
		validator: validator,
	}
}

func (s *BrandController) GetBrand(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "GetBrand",
	})

	id := c.Param("id")

	var brand model.Brand

	if err := s.db.Where("id = ?", id).Find(&brand).Error; err != nil {
		logCtx.WithField("reason", err).Error("error find brand")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"data":    brand,
		"message": "Sucess!",
	})
}

func (s *BrandController) GetBrands(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "GetBrands",
	})

	name := c.Query("name")

	var brand []model.Brand
	base := s.db

	if name != "" {
		base = base.Where("LOWER(name) LIKE LOWER(?)", "%"+name+"%")
	}

	if err := base.Find(&brand).Error; err != nil {
		logCtx.WithField("reason", err).Error("error find brand")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"data":    brand,
		"message": "Sucess!",
	})
}

func (s *BrandController) PostCreateBrand(c *gin.Context) {
	// bind data
	var req PostCreateBrandRequest
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
		"api": "PostCreateBrand",
	})

	brand := model.Brand{
		Name:        req.Name,
		Description: req.Description,
	}

	if err := s.db.Create(&brand).Error; err != nil {
		logCtx.WithField("reason", err).Error("error create brand")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"message": "Sucess!",
	})
}

func (s *BrandController) PutEditBrand(c *gin.Context) {
	// bind data
	var req PostCreateBrandRequest
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
		"api": "PutEditBrand",
	})

	id := c.Param("id")

	var brand model.Brand
	if result := s.db.Where("id = ?", id).Find(&brand); result.Error != nil || result.RowsAffected == 0 {
		err := errors.New("not found")
		if result.Error != nil {
			err = result.Error
		}
		logCtx.WithField("reason", err).Error("error find account")
		c.AbortWithStatusJSON(http.StatusUnauthorized, nil)
		return
	}

	brand.Name = req.Name
	brand.Description = req.Description

	if err := s.db.Save(&brand).Error; err != nil {
		logCtx.WithField("reason", err).Error("error create brand")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"message": "Sucess!",
	})
}

func (s *BrandController) DeleteBrand(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "PutEditBrand",
	})

	id := c.Param("id")

	var brand model.Brand
	if result := s.db.Where("id = ?", id).Unscoped().Delete(&brand); result.Error != nil || result.RowsAffected == 0 {
		err := errors.New("not found")
		if result.Error != nil {
			err = result.Error
		}
		logCtx.WithField("reason", err).Error("error find account")
		c.AbortWithStatusJSON(http.StatusUnauthorized, nil)
		return
	}

	c.JSON(200, gin.H{
		"message": "Sucess!",
	})
}
