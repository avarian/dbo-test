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

type PostCreateCategoryRequest struct {
	Name        string `json:"name"  validate:"required"`
	Description string `json:"description"  validate:"required"`
}

type PutEditCategoryRequest struct {
	Name        string `json:"name"  validate:"required"`
	Description string `json:"description"  validate:"required"`
}

type CategoryController struct {
	db        *gorm.DB
	validator *util.Validator
}

func NewCategoryController(db *gorm.DB, validator *util.Validator) *CategoryController {
	return &CategoryController{
		db:        db,
		validator: validator,
	}
}

func (s *CategoryController) GetCategory(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "GetCategory",
	})

	id := c.Param("id")

	var category model.Category

	if err := s.db.Where("id = ?", id).Find(&category).Error; err != nil {
		logCtx.WithField("reason", err).Error("error find category")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"data":    category,
		"message": "Sucess!",
	})
}

func (s *CategoryController) GetCategories(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "GetCategories",
	})

	name := c.Query("name")

	var category []model.Category
	base := s.db

	if name != "" {
		base = base.Where("LOWER(name) LIKE LOWER(?)", "%"+name+"%")
	}

	if err := base.Find(&category).Error; err != nil {
		logCtx.WithField("reason", err).Error("error find category")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"data":    category,
		"message": "Sucess!",
	})
}

func (s *CategoryController) PostCreateCategory(c *gin.Context) {
	// bind data
	var req PostCreateCategoryRequest
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
		"api": "PostCreateCategory",
	})

	category := model.Category{
		Name:        req.Name,
		Description: req.Description,
	}

	if err := s.db.Create(&category).Error; err != nil {
		logCtx.WithField("reason", err).Error("error create category")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"message": "Sucess!",
	})
}

func (s *CategoryController) PutEditCategory(c *gin.Context) {
	// bind data
	var req PostCreateCategoryRequest
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
		"api": "PutEditCategory",
	})

	id := c.Param("id")

	var category model.Category
	if result := s.db.Where("id = ?", id).Find(&category); result.Error != nil || result.RowsAffected == 0 {
		err := errors.New("not found")
		if result.Error != nil {
			err = result.Error
		}
		logCtx.WithField("reason", err).Error("error find account")
		c.AbortWithStatusJSON(http.StatusUnauthorized, nil)
		return
	}

	category.Name = req.Name
	category.Description = req.Description

	if err := s.db.Save(&category).Error; err != nil {
		logCtx.WithField("reason", err).Error("error create category")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"message": "Sucess!",
	})
}

func (s *CategoryController) DeleteCategory(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "PutEditCategory",
	})

	id := c.Param("id")

	var category model.Category
	if result := s.db.Where("id = ?", id).Delete(&category); result.Error != nil || result.RowsAffected == 0 {
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
