

-- Запрос для вывода всех клиентов и их заказов
SELECT 
    Customers.customer_name, 
    Products.product_name, 
    Orders.order_date, 
    Orders.quantity
FROM 
    Orders
JOIN 
    Customers ON Orders.customer_id = Customers.customer_id
JOIN 
    Products ON Orders.product_id = Products.product_id;


-- Запрос для подсчета общей суммы заказов для каждого клиента
SELECT 
    Customers.customer_name, 
    SUM(Products.price * Orders.quantity) AS total_spent
FROM 
    Orders
JOIN 
    Customers ON Orders.customer_id = Customers.customer_id
JOIN 
    Products ON Orders.product_id = Products.product_id
GROUP BY 
    Customers.customer_name;


-- Запрос для получения самых популярных продуктов (по количеству проданных единиц)
SELECT 
    Products.product_name, 
    SUM(Orders.quantity) AS total_quantity_sold
FROM 
    Orders
JOIN 
    Products ON Orders.product_id = Products.product_id
GROUP BY 
    Products.product_name
ORDER BY 
    total_quantity_sold DESC; -- Сортируем результаты по убыванию (DESC) общего количества проданных единиц. Позволяет увидеть самые популярные продукты сверху.


-- Запрос для поиска клиентов, которые сделали покупки в определённом городе (например, в Москве)
SELECT 
    customer_name, 
    city
FROM 
    Customers
WHERE 
    city = 'Москва';
