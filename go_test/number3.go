package gotest

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func findSubstring(s string, words []string) []int {
	if len(words) == 0 {
		return []int{}
	}

	wordCount := make(map[string]int)
	for _, word := range words {
		wordCount[word]++
	}

	wordLen := len(words[0])
	totalLen := wordLen * len(words)
	var result []int

	for i := 0; i <= len(s)-totalLen; i++ {
		substr := s[i : i+totalLen]
		found := true
		currentCount := make(map[string]int)

		for j := 0; j < totalLen; j += wordLen {
			word := substr[j : j+wordLen]
			if count, exists := wordCount[word]; exists {
				currentCount[word]++
				if currentCount[word] > count {
					found = false
					break
				}
			} else {
				found = false
				break
			}
		}

		if found {
			result = append(result, i)
		}
	}

	return result
}

func HandleFindSubstring(c echo.Context) error {
	type Request struct {
		S     string   `json:"s"`
		Words []string `json:"words"`
	}

	req := new(Request)
	if err := c.Bind(req); err != nil {
		return err
	}

	indices := findSubstring(req.S, req.Words)
	return c.JSON(http.StatusOK, indices)
}
