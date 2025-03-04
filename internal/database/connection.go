package database

import (
	"fmt"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

func GetDatabase(databaseUrl string) (*sqlx.DB, error) {
	db, err := sqlx.Connect("postgres", databaseUrl)
	if err != nil {
		return nil, fmt.Errorf("error connecting to database: %w", err)
	}
	return db, nil
}
