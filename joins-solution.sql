-- Get all customers and their addresses.
    SELECT customers.first_name, customers.last_name, addresses.* FROM customers
    JOIN addresses ON addresses.customer_id=customers.id
    
-- Get all orders and thier line items (orders, quantity and product).
    SELECT orders.*, line_items.quantity, products.description FROM line_items
    JOIN products ON line_items.product_id=products.id
    JOIN orders ON orders.id=line_items.order_id;

-- Which warehouses have cheetos?
    SELECT warehouse.warehouse, products.description FROM warehouse
    JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
    JOIN products ON warehouse_product.product_id=products.id
    WHERE products.description = 'cheetos';
    
-- Which warehouses have diet pepsi?
    SELECT warehouse.warehouse, products.description FROM warehouse
    JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id
    JOIN products ON warehouse_product.product_id=products.id
    WHERE products.description = 'diet pepsi';
    
-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
    SELECT customers.*, orders.order_date, orders.address_id FROM customers
    JOIN addresses ON addresses.customer_id=customers.id
    JOIN orders ON addresses.id=orders.address_id;
    
-- How many customers do we have?
    SELECT count(customers) FROM customers;
    
-- How many products do we carry?
    SELECT count(products) FROM products;
    
-- What is the total available on-hand quantity of diet pepsi?
    SELECT products.description, SUM(warehouse_product.on_hand) FROM products
    JOIN warehouse_product ON warehouse_product.product_id=products.id
    WHERE products.description = 'diet pepsi'
    GROUP BY products.description;
