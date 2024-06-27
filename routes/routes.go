package routes

import (
	gotest "olin/go_test"

	"github.com/labstack/echo/v4"
)

func RouteInit(e *echo.Group) {
	e.POST("/find-two-sum", gotest.HandleTwoSum)
	e.POST("/find-three-sum", gotest.HandleThreeSum)
	e.POST("/find-substring", gotest.HandleFindSubstring)
}
