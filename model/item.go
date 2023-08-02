package model

import (
	"time"

	"gorm.io/gorm"
)

type Item struct {
	ID          uint            `json:"id" gorm:"not null"`
	AccountID   uint            `json:"account_id" gorm:"not null"`
	BrandID     uint            `json:"brand_id" gorm:"not null"`
	CategoryID  uint            `json:"category_id" gorm:"not null"`
	Name        string          `json:"name" gorm:"not null;size:255"`
	Description string          `json:"description"`
	Price       string          `json:"price"  gorm:"not null;size:255"`
	Qty         int             `json:"qty"  gorm:"not null"`
	CreatedBy   string          `json:"created_by" gorm:"size:255;default:SYSTEM"`
	UpdatedBy   *string         `json:"updated_by" gorm:"size:255;default:SYSTEM"`
	DeletedBy   *string         `json:"deleted_by" gorm:"size:255"`
	CreatedAt   *time.Time      `json:"created_at" gorm:"default:current_timestamp"`
	UpdatedAt   *time.Time      `json:"updated_at" gorm:"default:current_timestamp"`
	DeletedAt   *gorm.DeletedAt `json:"deleted_at"`

	Account  *Account  `json:"account,omitempty" gorm:"constraint:OnUpdate:CASCADE,OnDelete:RESTRICT;foreignKey:AccountID;references:ID"`
	Brand    *Brand    `json:"brand,omitempty" gorm:"constraint:OnUpdate:CASCADE,OnDelete:RESTRICT;foreignKey:BrandID;references:ID"`
	Category *Category `json:"category,omitempty" gorm:"constraint:OnUpdate:CASCADE,OnDelete:RESTRICT;foreignKey:CategoryID;references:ID"`
}
