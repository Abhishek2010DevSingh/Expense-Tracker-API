-- +goose Up
-- +goose StatementBegin
CREATE TYPE expense_category AS ENUM ('Groceries', 'Leisure', 'Electronics', 'Utilities', 'Clothing', 'Health', 'Others');

CREATE TABLE IF NOT EXISTS expense (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    category expense_category NOT NULL
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS expense;
DROP TYPE IF EXISTS expense_category;
-- +goose StatementEnd

