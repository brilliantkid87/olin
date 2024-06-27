package routes

import (
	gotest "olin/go_test"

	"github.com/labstack/echo/v4"
)

func Number1(e *echo.Group) {
	e.POST("/find-two-sum", gotest.HandleTwoSum)
}
