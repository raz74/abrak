package main

import (
	"fmt"
	"github.com/labstack/echo/v4"
	"net/http"
)

func main() {
	fmt.Println("init abrak")
	e := echo.New()
	e.GET("/", GetAbrak)
	e.Logger.Fatal(e.Start(":3001"))

}

func GetAbrak(c echo.Context) error {
	return c.JSON(http.StatusOK, "hello abri kochooloo")
}
