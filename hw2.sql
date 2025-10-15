CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name, country) VALUES
(1, 'Alice', 'India'),
(2, 'Aaron', 'UAE'),
(3, 'George', 'USA'),
(4, 'Carol', 'Canada'),
(5, 'Andrew', 'Germany'),
(6, 'Morris', 'France');

INSERT INTO products (product_id, product_name, customer_id) VALUES
(101, 'Phone', 1),
(102, 'Laptop', 2),
(103, 'Tablet', 3),
(104, 'Speaker', 4),
(105, 'Headphones', 5),
(106, 'Camera', 6);


SELECT DISTINCT
    c.customer_id,
    c.customer_name,
    c.country,
    p.product_name
FROM 
    customers c
JOIN 
    products p ON c.customer_id = p.customer_id
WHERE 
    c.customer_name LIKE 'A%' 
    OR c.customer_name LIKE '%or%'
ORDER BY 
    c.customer_name ASC;
