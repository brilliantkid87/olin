package gotest

import (
	"log"
	"net/http"

	"github.com/labstack/echo/v4"
)

type Request struct {
	Nums   []int `json:"nums"`
	Target int   `json:"target"`
}

type Response struct {
	Indices []int `json:"indices"`
}

func getSum(nums []int, target int) []int {
	numMap := make(map[int]int)
	for i, num := range nums {
		complement := target - num
		if index, found := numMap[complement]; found {
			return []int{index, i}
		}
		numMap[num] = i
	}
	return nil
}

func HandleTwoSum(c echo.Context) error {
	req := new(Request)
	if err := c.Bind(req); err != nil {
		return err
	}

	indices := getSum(req.Nums, req.Target)
	if indices == nil {
		log.Println("indices: ", Response{Indices: nil})
		return c.JSON(http.StatusNotFound, Response{Indices: nil})
	}

	log.Println("indices: ", Response{Indices: indices})
	return c.JSON(http.StatusOK, Response{Indices: indices})
}
