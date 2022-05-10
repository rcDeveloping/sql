CREATE OR REPLACE VIEW vw_Products AS
SELECT
	product_id,
	product_name,
	unit_price
FROM products;

SELECT * FROM vw_Products;