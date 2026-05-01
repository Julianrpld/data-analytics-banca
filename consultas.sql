USE banca;

SELECT *
FROM clientes;

SELECT *
FROM contratos;

SELECT *
FROM productos;

SELECT *
FROM sucursales;

SELECT *
FROM transacciones;


-- Requerimiento 1: Necesito saber cuántos clientes tenemos por segmento y cual es el ingreso anual de cada uno --

SELECT 
		segmento,
		COUNT(*) AS numero_clientes,
        AVG(ingresos_anuales) AS ingreso_promedio
FROM clientes 
GROUP BY segmento
ORDER BY ingresos_anuales DESC;


-- Requerimiento 2: Necesito ver la rentabilidad por producto — 
-- cuánto ingresa cada producto, cuánto nos cuesta y cuál es el margen. Ordénalo de mayor a menor margen -- 

SELECT 
		t.id_producto,
		p.nombre_producto,
        ROUND(SUM(t.ingreso),2) AS ingreso_total,
        ROUND(SUM(t.costo),2) AS costo_total,
        ROUND(SUM(t.margen),2) AS ganancia_total,
        ROUND((SUM(t.margen) / SUM(t.ingreso)) * 100,2 ) AS rentabilidad
FROM transacciones t
JOIN productos p ON p.id_producto = t.id_producto 
GROUP BY id_producto
ORDER BY ganancia_total DESC;


-- "¿Cuántos productos tiene contratados cada segmento de clientes en promedio y cuáles son los más populares por segmento?" --

SELECT 
		p.nombre_producto,
		c.segmento,
		t.id_producto,
        COUNT(*) AS numero_productos
FROM contratos t
JOIN clientes c ON t.id_cliente = c.id_cliente
JOIN productos p ON t.id_producto = p.id_producto
GROUP BY c.segmento, t.id_producto
ORDER BY numero_productos DESC;

-- Sucursales por clientes y margen generado --

SELECT 
		s.nombre_sucursal,
        COUNT(*) AS clientes_x_sucursal       
FROM clientes c 
JOIN sucursales s ON c.id_sucursal = s.id_sucursal
GROUP BY s.nombre_sucursal;
		
SELECT 
		s.nombre_sucursal,
        COUNT(DISTINCT(t.id_cliente)) AS clientes_x_sucursal,
        ROUND(SUM(t.margen),2) AS margen_generado
FROM clientes c 
JOIN sucursales s ON c.id_sucursal = s.id_sucursal
JOIN transacciones t ON t.id_cliente = c.id_cliente
GROUP BY s.nombre_sucursal
ORDER BY margen_generado DESC; 