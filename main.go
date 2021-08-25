package main

import "github.com/gin-gonic/gin"

func getVersion() string {
	return "0.0.1"
}

func main() {
	r := gin.Default()
	r.GET("/version", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"version": getVersion(),
		})
	})
	r.Run()
}
