package main

import (
	"olin/routes"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()

	routes.RouteInit(e.Group("/api/v1"))

	e.Logger.Fatal(e.Start(":7777"))
}
