/* PAIR PROGRAMMING Queries Básicas */

/* EJERCICIO 2 */
CREATE SCHEMA `northwindMySQL`; 
USE `northwindMySQL`; 

/* EJERCICIO 4 */
SELECT `employee_id`, `last_name`, `first_name`
FROM `employees`;

/* EJERCICIO 5 */
SELECT `product_name`
FROM `products`
WHERE `unit_price` BETWEEN 0 AND 5; 

/* EJERCICIO 6 */
SELECT `product_name`
FROM `products`
WHERE `unit_price` IS NULL;

/* EJERCICIO 7 */
SELECT `product_name`, `product_id`
FROM `products`
WHERE `unit_price` < 15 AND `product_id` < 10; 

/* EJERCICIO 8 */
SELECT `product_name`, `product_id`
FROM `products`
WHERE `unit_price` > 15 AND `product_id` > 10; 

/* EJERCICIO 9 */
SELECT DISTINCT `ship_country` 
FROM `orders`;

/* EJERCICIO 10 */
SELECT `product_name`, `unit_price`, `product_id`
FROM `products`
ORDER BY `product_id` ASC
LIMIT 10; 

/* EJERCICIO 11 */
SELECT `product_name`, `unit_price`, `product_id`
FROM `products`
ORDER BY `product_id` DESC
LIMIT 10; 

/* EJERCICIO 12 */
SELECT DISTINCT `order_id`
FROM `order_details`;

/* EJERCICIO 13 */
SELECT `order_id`, `unit_price` * `quantity` AS `ImporteTotal`
FROM  `order_details` 
ORDER BY `ImporteTotal` DESC
LIMIT 3; 

/* EJERCICIO 14 */
SELECT `order_id`, `unit_price` * `quantity` AS `ImporteTotal`
FROM  `order_details` 
ORDER BY `ImporteTotal` DESC
LIMIT 5 OFFSET 5; 

/* EJERCICIO 15 */
SELECT `category_name` AS `NombreDeCategoria`
FROM `categories`; 

/* EJERCICIO 16 */
SELECT `ship_name`, DATE_ADD(`shipped_date`, INTERVAL 5 DAY) AS `FechaRetrasa`, `shipped_date`
FROM `orders`;

/* EJERCICIO 17 */
SELECT `product_name`
FROM `products`
WHERE `unit_price` BETWEEN 15 AND 50; 

/* EJERCICIO 18 */
SELECT `product_name`, `product_id`, `unit_price`
FROM `products`
WHERE `unit_price` IN (18,19,20)

