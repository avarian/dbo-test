package controllers

import (
	"errors"
	"net/http"

	"github.com/avarian/dbo-test/model"
	"github.com/avarian/dbo-test/model/scopes"
	"github.com/avarian/dbo-test/util"
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	log "github.com/sirupsen/logrus"
	"gorm.io/gorm"
)

type PostCreateItemRequest struct {
	BrandID     int     `json:"item_id" validate:"required"`
	CategoryID  int     `json:"category_id" validate:"required"`
	Name        string  `json:"name" validate:"required"`
	Description string  `json:"description" validate:"required"`
	Price       float64 `json:"price"  validate:"required"`
	Qty         int     `json:"qty"  validate:"required"`
}

type PutEditItemRequest struct {
	BrandID     int     `json:"item_id" validate:"required"`
	CategoryID  int     `json:"category_id" validate:"required"`
	Name        string  `json:"name" validate:"required"`
	Description string  `json:"description" validate:"required"`
	Price       float64 `json:"price"  validate:"required"`
	Qty         int     `json:"qty"  validate:"required"`
}

type ItemController struct {
	db        *gorm.DB
	validator *util.Validator
}

func NewItemController(db *gorm.DB, validator *util.Validator) *ItemController {
	return &ItemController{
		db:        db,
		validator: validator,
	}
}

func (s *ItemController) GetItem(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "GetItem",
	})

	id := c.Param("id")

	var item model.Item

	if err := s.db.Where("id = ?", id).Find(&item).Error; err != nil {
		logCtx.WithField("reason", err).Error("error find item")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"data":    item,
		"message": "Sucess!",
	})
}

func (s *ItemController) GetItems(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "GetItems",
	})

	name := c.Query("name")
	brandId := c.Query("brandId")
	categoryId := c.Query("categoryId")

	var item []model.Item
	base := s.db.Scopes(scopes.Paginate(c)).Preload("Brand").Preload("Category")

	if name != "" {
		base = base.Where("LOWER(name) LIKE LOWER(?)", "%"+name+"%")
	}
	if brandId != "" {
		base = base.Where("brand_id = ?", brandId)
	}
	if categoryId != "" {
		base = base.Where("category_id = ?", categoryId)
	}

	if err := base.Find(&item).Error; err != nil {
		logCtx.WithField("reason", err).Error("error find item")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"data":    item,
		"message": "Sucess!",
	})
}

func (s *ItemController) PostCreateItem(c *gin.Context) {
	// bind data
	var req PostCreateItemRequest
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
		"api": "PostCreateItem",
	})

	username := c.GetString("username")
	var account model.Account
	s.db.Where("email = ?", username).Find(&account)

	item := model.Item{
		AccountID:   account.ID,
		BrandID:     uint(req.BrandID),
		CategoryID:  uint(req.CategoryID),
		Name:        req.Name,
		Description: req.Description,
		Price:       req.Price,
		Qty:         req.Qty,
	}

	if err := s.db.Create(&item).Error; err != nil {
		logCtx.WithField("reason", err).Error("error create item")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"message": "Sucess!",
	})
}

func (s *ItemController) PutEditItem(c *gin.Context) {
	// bind data
	var req PostCreateItemRequest
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
		"api": "PutEditItem",
	})

	id := c.Param("id")
	username := c.GetString("username")
	var account model.Account
	s.db.Where("email = ?", username).Find(&account)

	var item model.Item
	if result := s.db.Where("id = ? AND account_id = ?", id, account.ID).Find(&item); result.Error != nil || result.RowsAffected == 0 {
		err := errors.New("not found")
		if result.Error != nil {
			err = result.Error
		}
		logCtx.WithField("reason", err).Error("error find account")
		c.AbortWithStatusJSON(http.StatusUnauthorized, nil)
		return
	}

	item.BrandID = uint(req.BrandID)
	item.CategoryID = uint(req.CategoryID)
	item.Name = req.Name
	item.Description = req.Description
	item.Price = req.Price
	item.Qty = req.Qty

	if err := s.db.Save(&item).Error; err != nil {
		logCtx.WithField("reason", err).Error("error create item")
		c.AbortWithStatusJSON(http.StatusNotFound, nil)
		return
	}

	c.JSON(200, gin.H{
		"message": "Sucess!",
	})
}

func (s *ItemController) DeleteItem(c *gin.Context) {
	// log
	logCtx := log.WithFields(log.Fields{
		"api": "PutEditItem",
	})

	id := c.Param("id")

	username := c.GetString("username")
	var account model.Account
	s.db.Where("email = ?", username).Find(&account)

	var item model.Item
	if result := s.db.Where("id = ? AND account_id", id, account.ID).Unscoped().Delete(&item); result.Error != nil || result.RowsAffected == 0 {
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
