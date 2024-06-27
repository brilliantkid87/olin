package gotest

import (
	"log"
	"net/http"
	"sort"

	"github.com/labstack/echo/v4"
)

func getSum2(nums []int) [][]int {
	var results [][]int
	sort.Ints(nums)

	for i := 0; i < len(nums)-2; i++ {
		if i > 0 && nums[i] == nums[i-1] {
			log.Println("lewat sini ga")
			continue
		}
		left, right := i+1, len(nums)-1
		for left < right {
			sum := nums[i] + nums[left] + nums[right]
			if sum == 0 {
				results = append(results, []int{nums[i], nums[left], nums[right]})
				left++
				right--
				for left < right && nums[left] == nums[left-1] {
					left++
				}
				for left < right && nums[right] == nums[right+1] {
					right--
				}
			} else if sum < 0 {
				left++
			} else {
				right--
			}
		}
	}

	return results
}

func HandleThreeSum(c echo.Context) error {
	type Request struct {
		Nums []int `json:"nums"`
	}

	type Response struct {
		Triplets [][]int `json:"triplets"`
	}

	req := new(Request)
	if err := c.Bind(req); err != nil {
		return err
	}

	triplets := getSum2(req.Nums)

	response := Response{
		Triplets: triplets,
	}

	return c.JSON(http.StatusOK, response)
}
