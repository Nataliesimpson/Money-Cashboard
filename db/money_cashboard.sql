DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants (
  id SERIAL4 primary key,
  merchant_name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL4 primary key,
  tag_name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4 primary key,
  merchant_id INT4 references merchants(id) ON DELETE CASCADE,
  tag_id INT4 references tags(id) ON DELETE CASCADE,
  transaction_name VARCHAR(255),
  amount INT4,
  debit_credit VARCHAR(255),
  transaction_date DATE, 
  transaction_time TIME
);

