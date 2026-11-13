USE Ventas_Tech_DB
SELECT 
    MONTH(fecha_venta) AS Mes,
    SUM(cantidad * precio_unitario) AS Total_Facturado,
    COUNT(id_ventas) AS Cantidad_Pedidos,
    AVG(cantidad * precio_unitario) AS Ticket_Promedio
FROM Ventas
GROUP BY MONTH(fecha_venta);

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS Unidades_Vendidas,
    SUM(cantidad * precio_unitario) AS Total_Generado
FROM Ventas
GROUP BY id_producto
ORDER BY Total_Generado DESC;

SELECT
    id_cliente,
    COUNT(*) AS Cantidad_Pedidos,
    SUM(cantidad * precio_unitario) AS Total_Gastado
FROM Ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY Total_Gastado DESC;


WITH total_por_producto AS (
    SELECT 
        id_producto,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM Ventas
    GROUP BY id_producto
)
SELECT 
    id_producto,
    total_facturado,
    CASE 
        WHEN total_facturado > (SELECT AVG(total_facturado) FROM total_por_producto) 
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS estado_promedio
FROM total_por_producto
ORDER BY total_facturado DESC;

--Concentración de ingresos: El producto 1 (Laptop Pro 15) lidera el ranking  generando $3.600, lo que representa más del 55% de la facturación total.
-- 2. Volumen vs. Facturación: El producto 2 (Mouse Inalámbrico) es el más 
--    vendido en unidades (13 unidades), pero ocupa el 5° lugar en ingresos ($364).
-- 3. Recurrencia total de clientes: El 100% de los clientes registrados (5 de 5)
--    realizaron exactamente 2 pedidos durante el mes de marzo, destacando los
--    clientes 1 y 5 como los de mayor gasto acumulado.