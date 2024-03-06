-- EJERCICIO 1: 
-- Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
-- Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.
SELECT *
	FROM `customers`; 

SELECT `company_name`, `customer_id`
	FROM `customers`; 

WITH `custID` AS (SELECT `company_name`, `customer_id`
					FROM `customers`)

SELECT  `customer_id`, `company_name`
	FROM `custID`; 

-- EJERCICIO 2: 
-- Selecciona solo los de que vengan de "Germany"
-- Ampliemos un poco la query anterior. En este caso, queremos un resultado similar al anterior, pero solo queremos los que pertezcan a "Germany".
SELECT `company_name`, `customer_id`
	FROM `customers`; 

WITH `custID` AS (SELECT `company_name`, `customer_id`
					FROM `customers`
                    WHERE `country` = 'Germany')

SELECT  `customer_id`, `company_name`
	FROM `custID`; 

-- EJERCICIO 3: 
-- Extraed el id de las facturas y su fecha de cada cliente.
-- En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
-- 📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).

WITH `custID` AS (SELECT `customer_id`, `company_name`
						FROM `customers`)
SELECT `c`.`customer_id`,`c`. `company_name`,`o`.`order_id`,`o`.`order_date`
	FROM `orders`AS `o`
    INNER JOIN`custID` AS `c`
    ON `o`. `customer_id` = `c`.`customer_id`; 

-- EJERCICIO 4:
-- Contad el número de facturas por cliente
-- Mejoremos la query anterior. En este caso queremos saber el número de facturas emitidas por cada cliente.
WITH `custID` AS (SELECT `customer_id`, `company_name`
						FROM `customers`)
SELECT `c`.`customer_id`,`c`. `company_name`,COUNT(`o`.`order_id`)
	FROM `orders`AS `o`
    INNER JOIN`custID` AS `c`
    ON `o`. `customer_id` = `c`.`customer_id`
    GROUP BY `customer_id`; 
    
-- EJERCICIO 5: 
-- Cuál la cantidad media pedida de todos los productos ProductID.
-- Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.

WITH `custP` AS (SELECT `product_id`, SUM(`quantity`)/ COUNT(`product_id`) AS `suma_productos`
					FROM `order_details` 
                    GROUP BY `product_id`)

SELECT `product_name`, `suma_productos`
FROM `custP` AS `c`
INNER JOIN `products` AS `p`
ON `c`.`product_id` = `p`.`product_id`
GROUP BY `c`.`product_id`; 

-- BONUS: 
-- 6. Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo.
-- 7. La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada uno de ellos.
-- 8. Modifica la consulta anterior para obtener los mismos resultados pero con los pedidos por año que ha hecho cada cliente.
-- 9. Modifica la cte del ejercicio anterior, úsala en una subconsulta para saber el nombre del cliente y su teléfono, para aquellos clientes que hayan hecho más de 6 pedidos en el año 1998.
-- 10. Nos piden que obtengamos el importe total (teniendo en cuenta los descuentos) de cada pedido de la tabla orders y el customer_id asociado a cada pedido.