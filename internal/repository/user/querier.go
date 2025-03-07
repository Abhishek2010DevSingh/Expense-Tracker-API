// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.28.0

package user

import (
	"context"
)

type Querier interface {
	CheckUserExists(ctx context.Context, email string) (bool, error)
	CreateUser(ctx context.Context, arg CreateUserParams) (User, error)
	GetUserByID(ctx context.Context, id int32) (User, error)
}

var _ Querier = (*Queries)(nil)
