USE base;

SET @varMarca = 'DELL';

SELECT * FROM produtos
WHERE Marca_Produto = @varMarca;