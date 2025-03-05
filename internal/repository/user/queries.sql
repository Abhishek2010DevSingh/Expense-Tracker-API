-- name: CreateUser :one
INSERT INTO users (name, email, password)
VALUES ($1, $2, $3)
RETURNING id, name, email, password;

-- name: GetUserByID :one
SELECT id, name, email, password
FROM users
WHERE id = $1;

-- name: CheckUserExists :one
SELECT EXISTS (
    SELECT 1
    FROM users
    WHERE email = $1
) AS exists;
