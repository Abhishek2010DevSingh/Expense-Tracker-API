package config

import (
	"os"
)

type EnvProvider interface {
	GetPort() string
	GetDatabase() string
}

type envProvider struct{}

func NewEnvProvider() EnvProvider {
	return &envProvider{}
}

func (e *envProvider) GetPort() string {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	return port
}

func (e *envProvider) GetDatabase() string {
	db := os.Getenv("DATABASE_URL")
	if db == "" {
		db = "postgres://user:password@localhost:5432/dbname"
	}
	return db
}
