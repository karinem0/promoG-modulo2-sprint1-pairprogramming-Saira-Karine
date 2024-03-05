-- EJERCICIO 1: 
-- Extraed los pedidos con el máximo "order_date" para cada empleado.
-- Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Query correlacionada.
SELECT `order_id`, `customer_id`, `employee_id`, `order_date`, `required_date`
	FROM `orders` AS `o1`
	WHERE `order_date` IN (SELECT MAX(`order_date`) 
								FROM `orders` AS `o2`
								WHERE `o1`.`employee_id` = `o2`.`employee_id`); 
							 
-- EJERCICIO 2: 
-- Extraed el precio unitario máximo (unit_price) de cada producto vendido.
-- Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. Query correlacionada.
SELECT `product_id`, `unit_price` 
	FROM `products` AS `od1`
    WHERE `unit_price` IN (SELECT MAX(`unit_price`)
								FROM `products` AS `od2`
								WHERE `od1`.`product_id` = `od2`.`product_id`);

-- EJERCICIO 3:
-- Extraed información de los productos "Beverages"
-- En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
-- En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría.
SELECT `product_id`, `product_name`, `category_id`
	FROM `products`
	WHERE `category_id` IN (SELECT `category_id`
								FROM `categories`
								WHERE `category_name` = 'Beverages'); 

-- EJERCICIO 4:
-- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
-- Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.
SELECT DISTINCT `country`
	FROM `customers`
    WHERE `country` NOT IN (SELECT `country`
								FROM `suppliers`); 

-- EJERCICIO 5:
-- Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
-- Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.
SELECT `order_id`, `customer_id`
	FROM `orders`
    WHERE `order_id` IN (SELECT `order_id`
							FROM `order_details` AS `od`
								INNER JOIN `products` AS `p`
									ON `od`.`product_id` = `p`.`product_id`
									WHERE `product_name` = "Grandma's Boysenberry Spread" AND `quantity` > 20);
								
-- EJERCICIO 6:
-- Extraed los 10 productos más caros
-- Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.
SELECT `product_name`, `unit_price`
FROM `products` AS `p1`
WHERE `unit_price` IN (SELECT MAX(`unit_price`)
						FROM `products` AS `p2`
                        WHERE `p1`.`unit_price` = `p2`.`unit_price`)
                        ORDER BY `unit_price` DESC
						LIMIT 10; 

-- EJERCICIO 7: BONUS
-- Qué producto es más popular
-- Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.
SELECT `product_name`, `product_id`
FROM `products`
WHERE `product_id` IN (SELECT SUM(`quantity`)
							FROM `order_details`
							GROUP BY `product_id`
							HAVING SUM(`quantity`))
                            ; 


SELECT SUM(`quantity`)
	FROM `order_details`
	GROUP BY `product_id`
	HAVING SUM(`quantity`))
	; 
