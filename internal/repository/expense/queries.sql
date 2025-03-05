-- name: CreateExpense :one
INSERT INTO expenses (user_id, description, amount)
VALUES ($1, $2, $3)
RETURNING id, user_id, description, amount, created_date;

-- name: GetExpenseByID :one
SELECT id, user_id, description, amount, created_date
FROM expenses
WHERE id = $1;

-- name: ListExpensesByUserID :many
SELECT id, user_id, description, amount, created_date
FROM expenses
WHERE user_id = $1
ORDER BY created_date DESC;

-- name: UpdateExpense :one
UPDATE expenses
SET description = $2, amount = $3
WHERE id = $1
RETURNING id, user_id, description, amount, created_date;

-- name: DeleteExpense :exec
DELETE FROM expenses
WHERE id = $1;
