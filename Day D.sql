# CTE: COMMON TABLE EXPRESSION

USE college;


-- Create Customer Table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address_id INT
);

-- Create Payment Table
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Insert Data into Customer Table
INSERT INTO customer VALUES
(1, 'John', 'Smith', 101),
(2, 'Mary', 'Johnson', 102),
(3, 'David', 'Brown', 103),
(4, 'Emma', 'Wilson', 104),
(5, 'James', 'Taylor', 105);

-- Insert Data into Payment Table
INSERT INTO payment VALUES
(1, 1, 1000),
(2, 2, 1500),
(3, 3, 2000),
(4, 4, 2500),
(5, 5, 3000);

-- Common Table Expression (CTE)
WITH my_cte AS
(
    SELECT
        p.payment_id,
        p.customer_id,
        p.amount,
        c.first_name,
        c.last_name,
        c.address_id,
        AVG(amount) OVER (ORDER BY p.customer_id) AS average_price,
        COUNT(address_id) OVER (ORDER BY c.customer_id) AS address_count
    FROM payment p
    INNER JOIN customer c
    ON p.customer_id = c.customer_id
)

SELECT
    first_name,
    last_name,
    amount,
    average_price,
    address_count
FROM my_cte;