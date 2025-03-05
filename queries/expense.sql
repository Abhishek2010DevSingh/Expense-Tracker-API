-- name: CreateExpense :one
INSERT INTO expense (description, amount, created_date, user_id, category)
VALUES ($1, $2, $3, $4, $5)
RETURNING *;

-- name: GetExpenseByID :one
SELECT * FROM expense WHERE id = $1 AND user_id = $2;

-- name: GetExpensesByUserID :many
SELECT * FROM expense WHERE user_id = $1;

-- name: GetExpensesByCategory :many
SELECT * FROM expense WHERE user_id = $1 AND category = $2;

-- name: UpdateExpense :one
UPDATE expense
SET description = $2, amount = $3, created_date = $4, category = $5
WHERE id = $1 AND user_id = $6
RETURNING *;

-- name: DeleteExpense :exec
DELETE FROM expense WHERE id = $1 AND user_id = $2;
