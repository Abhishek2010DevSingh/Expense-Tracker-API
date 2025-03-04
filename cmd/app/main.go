package main

import (
	"github.com/Abhishek2010DevSingh/Expense-Tracker-API/config"
	"github.com/gin-gonic/gin"
)

func main() {
	envProvider := config.NewEnvProvider()
	r := gin.Default()
	r.Run(envProvider.GetPort())
}
