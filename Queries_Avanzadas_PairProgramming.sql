-- EJERCICIO 1
SELECT MAX(`unit_price`) AS `highestPrice`, MIN(`unit_price`) AS `lowestPrice`
FROM `products`;

-- EJERCICIO 2
SELECT COUNT(`product_name`), AVG(`unit_price`)
FROM `products`;

-- EJERCICIO 3
SELECT MAX(`freight`), MIN(`freight`)
FROM `orders`
WHERE `ship_country` = 'UK';

-- EJERCICIO 4
SELECT AVG(`unit_price`)
FROM `products`;

SELECT `product_name`, `unit_price`
FROM `products`
WHERE `unit_price` > 28.87
ORDER BY `unit_price` DESC;

-- EJERCICIO 5
SELECT `product_name`
FROM `products`
WHERE `discontinued` = 1;

-- EJERCICIO 6
SELECT `product_id`, `product_name`
FROM `products`
WHERE `discontinued` = 0 AND `product_id` IS NOT NULL
ORDER BY `product_id` DESC
LIMIT 10;

-- EJERCICIO 7
SELECT COUNT(`order_id`), MAX(`freight`), `employee_id`
FROM `orders`
GROUP BY `employee_id`;

-- EJERCICIO 8
SELECT COUNT(`order_id`), MAX(`freight`), `employee_id`
FROM `orders`
WHERE `shipped_date` <> '0000-00-00 00:00:00'
GROUP BY `employee_id`;

-- EJERCICIO 9
SELECT COUNT(`order_id`), DAY(`order_date`), MONTH(`order_date`), YEAR(`order_date`)
FROM `orders`
GROUP BY `order_date`;

-- EJERCICIO 10
SELECT COUNT(`order_id`), MONTH(`order_date`), YEAR(`order_date`)
FROM `orders`
GROUP BY MONTH(`order_date`);

-- EJERCICIO 11
SELECT `city`, COUNT(`employee_id`)
FROM `employees`
GROUP BY `city`
HAVING COUNT(`employee_id`) >= 4;

-- EJERCICIO 12
SELECT `order_id`, 
	CASE
		WHEN SUM(`unit_price` * `quantity`) > 2000 THEN "Alto"
        ELSE "Bajo"
        END AS `Segmentacion`
	FROM `order_details`
    GROUP BY `order_id`;
        
