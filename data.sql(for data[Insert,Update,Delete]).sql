
-- Add users in user table
INSERT INTO users (name, email, password) VALUES
('Umer Mansuri', 'umer@example.com', 'pass123'),
('Ali Khan', 'ali@example.com', 'pass456'),
('Amaan Malek', 'Amaan@2006.com', 'pass785'),
('Aamir Shaikh', 'ali@2005.com', 'pass786'),
('Husain Mulla', 'hm@mulla.com', 'pass420'),
('Assad Shaikh', 'AS@2006ab.com', 'pass520'),
('null', 'Meet@abc2005.com', 'pass789'),
('Shaikh Athasam', 'null', 'pass321'),
('Faizan Khan', 'Fk@khan2004.com', 'null');

UPDATE users      -- Update Multiple Column Using UPDATE Statement
SET name = 'Mahera Shaikh', 
    email = 'MH@gmail.com', 
    password = '1234' 
WHERE user_id = 2;

update users set   -- Update Single Column Using UPDATE Statement
email = 'MT@gamil.com'
where user_id = 7 ;

delete from users where user_id ='66';

SELECT * FROM users;

-- add categories
INSERT INTO categories (name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Coding Books'),
('Gym Equipment');

update categories set name = 'abcd' where category_id= 3; -- Update Single Column Using UPDATE Statement

SELECT * FROM categories;


-- add products details
INSERT INTO products (name, description, price, category_id) VALUES
('Laptop', 'Dell i5 Laptop', 55000.00, 1),
('T-Shirt', 'Cotton T-shirt', 500.00, 2),
('Java Book', 'Learn Java Programming', 799.00, 3),
('Hoodie', 'Cotton denim material', 1500.00, 5);

update products set  -- Update Single Column Using UPDATE Statement
name = 'T-shirt'
where product_id = 4 ;

update products set  --  Update Multiple Column Using UPDATE Statement
name = 'PC',
description = 'Core intal i 5',
price = 70000.00
where product_id = 1;

SELECT * FROM products;

-- add or receive order for the customer
INSERT INTO orders (user_id, status) VALUES
(1, 'Shipped'),
(2, 'Pending'),
(3, 'Shipped'),
(4, DEFAULT),   -- if 'status' column has a default value
(5, NULL);      -- if you want to explicitly set status to NULL

update orders set  -- Update Single Column Using UPDATE Statement
status = 'shipped'
where user_id = 2;

SELECT * FROM orders; -- dispaly the all record

delete from order_items where user_id='3'; -- Deleting Single Record


INSERT INTO order_items (order_id, product_id, quantity) VALUES   -- insert the values in order_items
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 2, 4),
(3, 3, 3);



update order_items --  Update Multiple Column Using UPDATE Statement
set product_id = 2,
quantity =5
where order_id = 2;

delete from order_items where order_id in(   -- Deleting Single Record
select order_id from orders where user_id = 3);

SELECT * FROM order_items;

INSERT INTO payments (order_id, amount, payment_method) VALUES
(1, 56598.00, 'Credit Card'),
(2, 500.00, 'Cash on Delivery');


update payments set -- Update Single Column Using UPDATE Statement
amount = 70000.00
where order_id =1 ;

delete FROM payments where order_id in (   -- Deleting Single Record
select order_id from orders where user_id = 3);
-- display the all added rows from diff tables



SELECT * FROM payments;


-- delete the some specific id in the table
DELETE FROM order_items WHERE order_id = 1; -- Deleting Single Record

SET SQL_SAFE_UPDATES = 0;

-- STEP 1: Delete from deepest child table
DELETE FROM order_items;

-- STEP 2: Delete from dependent tables
DELETE FROM payments;
DELETE FROM orders;

-- STEP 3: Delete from parent tables
DELETE FROM products;
DELETE FROM categories;
DELETE FROM users;


