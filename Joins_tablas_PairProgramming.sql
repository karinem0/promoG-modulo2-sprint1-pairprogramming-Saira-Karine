-- 1.Pedidos por empresa en UK:

SELECT `c`.`customer_id`, `c`.`company_name`, COUNT(`o`.`order_id`) AS `numero_pedidos`
	FROM `customers` AS `c`
		INNER JOIN `orders` AS `o`
			ON `c`.`customer_id` = `o`.`customer_id`
            WHERE `c`.`country` = 'UK'
            GROUP BY `c`.`customer_id`, `c`.`company_name`; 

-- 2.Productos pedidos por empresa en UK por año:

SELECT `c`.`company_name`, YEAR(`o`.`order_date`) AS `año`, SUM(`od`.`quantity`) AS `numero_objeto`
	FROM `customers` AS `c`
		INNER JOIN `orders` AS `o`
			ON `c`.`customer_id` = `o`.`customer_id`
				INNER JOIN 	`order_details` AS `od`
                ON `o`.`order_id`= `od`.`order_id`
            WHERE `c`.`country` = 'UK'
            GROUP BY `c`.`company_name`, YEAR(`o`.`order_date`); 


-- 3.Mejorad la query anterior:

SELECT `c`.`company_name`, YEAR(`o`.`order_date`) AS `año`, SUM(`od`.`quantity`) AS `numero_objeto`, SUM((`od`.`unit_price`- (`od`.`discount`* `od`.`unit_price`)) * `od`.`quantity`) AS `DineroTotal`
	FROM `customers` AS `c`
		INNER JOIN `orders` AS `o`
			ON `c`.`customer_id` = `o`.`customer_id`
				INNER JOIN 	`order_details` AS `od`
                ON `o`.`order_id`= `od`.`order_id`
            WHERE `c`.`country` = 'UK'
            GROUP BY `c`.`company_name`, YEAR(`o`.`order_date`); 


-- 4.BONUS: Pedidos que han realizado cada compañía y su fecha:

SELECT `o`.`order_id`, `o`.`order_date`, `c`.`company_name`
	FROM `orders` AS `o`
		INNER JOIN `customers` AS `c`
			ON `c`.`customer_id` = `o`.`customer_id`
            ;

-- 5.BONUS: Tipos de producto vendidos:

SELECT `c`.`category_id`,`c`.`category_name`, `p`.`product_name`,  SUM((`od`.`unit_price`- (`od`.`discount`* `od`.`unit_price`)) * `od`.`quantity`) AS `ProductSales`
		FROM `categories` AS `c`
		INNER JOIN `products` AS `p`
			ON `c`.`category_id` = `p`.`category_id`
            INNER JOIN `order_details` AS `od`
            ON `p`.`product_id` = `od`.`product_id`
            GROUP BY `p`.`product_id`
			;
            
-- 6. Qué empresas tenemos en la BBDD Northwind:

SELECT `o`.`order_id`, `o`.`order_date`, `c`.`company_name`
	FROM `orders` AS `o`
		INNER JOIN `customers` AS `c`
			ON `c`.`customer_id` = `o`.`customer_id`
            ;
            
-- 7. Pedidos por cliente de UK:

SELECT `c`.`company_name` AS `nombre_empresa`, COUNT(`o`.`order_id`) AS `numero_pedidos`
	FROM `customers` AS `c`
		INNER JOIN `orders` AS `o`
			ON `c`.`customer_id` = `o`.`customer_id`
            WHERE `c`.`country` = 'UK'
            GROUP BY `c`.`company_name`; 

-- 8.Empresas de UK y sus pedidos:

SELECT `o`.`order_id`,`o`.`order_date`, `c`.`company_name`
	FROM `orders` AS `o`
		RIGHT JOIN `customers` AS `c`
			ON `c`.`customer_id` = `o`.`customer_id`
             WHERE `c`.`country` = 'UK'
            ;

-- 9.Empleadas que sean de la misma ciudad:

SELECT `e`.`city` AS `ciudad_empleado`, `e`.`first_name` AS `nombre_empleado`, `e`.`last_name` AS `apellido_empleado`, `j`.`city` AS `ciudad_jefe`, `j`.`first_name` AS `nombre_jefe`, `j`.`last_name` AS `apellido_jefe`
	FROM `employees` AS `e`, `employees` AS `j`
	WHERE `e`.`employee_id` <> `j`.`employee_id`
    AND `e`.`reports_to`=  `j`.`employee_id`;
    
-- Ejercicio 10. BONUS: FULL OUTER JOIN

SELECT `o`.`order_id`, `o`.`order_date`, `c`.`company_name`
		FROM `orders` AS `o`
			LEFT JOIN `customers` AS `c`
				ON `o`.`customer_id` = `c`.`customer_id` 
UNION 
SELECT `o`.`order_id`, `o`.`order_date`, `c`.`company_name`
		FROM `orders` AS `o`
			RIGHT JOIN `customers` AS `c`
				ON `o`.`customer_id` = `c`.`customer_id` 
                ;

