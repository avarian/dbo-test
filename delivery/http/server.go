package http

import (
	"context"
	"net/http"
	"time"

	"github.com/avarian/dbo-test/controllers"
	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
)

type Server struct {
	listenAddress string
	http          *http.Server
}

func NewServer(listenAddress string,
	home *controllers.HomeController,
	account *controllers.AccountController,
	brand *controllers.BrandController,
	category *controllers.CategoryController,
	item *controllers.ItemController,
) *Server {

	router := gin.Default()
	//
	// Http Routings
	//
	router.GET("/", home.GetHome)

	api := router.Group("/api")
	{
		api.POST("/login", account.PostLogin)
		api.POST("/account/register", account.PostRegister)
		brandApi := api.Group("/brand").Use(Auth())
		{
			brandApi.GET("/all", brand.GetBrands)
			brandApi.GET("/:id", brand.GetBrand)
			brandApi.POST("/", brand.PostCreateBrand)
			brandApi.PUT("/:id", brand.PutEditBrand)
			brandApi.DELETE("/:id", brand.DeleteBrand)
		}
		categoryApi := api.Group("/category").Use(Auth())
		{
			categoryApi.GET("/all", category.GetCategories)
			categoryApi.GET("/:id", category.GetCategory)
			categoryApi.POST("/", category.PostCreateCategory)
			categoryApi.PUT("/:id", category.PutEditCategory)
			categoryApi.DELETE("/:id", category.DeleteCategory)
		}
		itemApi := api.Group("/item").Use(Auth())
		{
			itemApi.GET("/all", item.GetItems)
			itemApi.GET("/:id", item.GetItem)
			itemApi.POST("/", item.PostCreateItem)
			itemApi.PUT("/:id", item.PutEditItem)
			itemApi.DELETE("/:id", item.DeleteItem)
		}

		secured := api.Use(Auth())
		{
			secured.GET("/brand", brand.GetBrand)
		}
	}

	httpServer := &http.Server{
		Addr:              listenAddress,
		ReadHeaderTimeout: 10 * time.Second,
		ReadTimeout:       30 * time.Second,
		WriteTimeout:      30 * time.Second,
		Handler:           router,
	}
	httpServer.SetKeepAlivesEnabled(true)

	srv := &Server{
		listenAddress: listenAddress,
		http:          httpServer,
	}
	return srv
}

func (s *Server) StartStopByContext(ctx context.Context) error {
	logCtx := log.WithField("listen", s.listenAddress)

	go func() {
		if err := s.http.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			logCtx.Fatal(err)
		}
	}()

	logCtx.Info("server ready")
	<-ctx.Done()

	ctxDown, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer func() {
		cancel()
	}()

	if err := s.http.Shutdown(ctxDown); err != nil {
		logCtx.WithError(err).Error("http server shutdown failed")
		return err
	}

	logCtx.Info("http server shutdown gracefully")
	return nil

}

func (s *Server) Start() error {
	return s.http.ListenAndServe()
}

func (s *Server) Stop() error {
	logCtx := log.WithField("listen", s.listenAddress)

	ctxDown, cancel := context.WithTimeout(context.Background(), 60*time.Second)
	defer cancel()

	if err := s.http.Shutdown(ctxDown); err != nil {
		logCtx.WithError(err).Error("http server shutdown failed")
		return err
	}

	logCtx.Info("http server shutdown gracefully")
	return nil
}
