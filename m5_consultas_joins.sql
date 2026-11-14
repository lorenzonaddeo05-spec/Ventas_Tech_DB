USE Ventas_Tech_DB
GO

-- =========================================================================
-- Consulta 1: Detalle completo de ventas con dimensiones
-- Sirve para unificar en una sola fila las transacciones de ventas con la 
-- información descriptiva de sus clientes, productos y categorías mediante INNER JOIN.
-- =========================================================================
SELECT 
    v.fecha_venta AS Fecha,
    c.id_cliente AS ID_Cliente,
    c.nombre AS Nombre_Cliente,
    c.ciudad AS Ciudad_Cliente,
    p.nombre_producto AS Descripcion_Producto,
    cat.nombre_categoria AS Categoria_Producto,
    v.cantidad AS Cantidad,
    v.precio_unitario AS Precio_Unitario,
    (v.cantidad * v.precio_unitario) AS Total_Venta
FROM Ventas v
INNER JOIN Cliente c ON v.id_cliente = c.id_cliente
INNER JOIN Producto p ON v.id_producto = p.id_producto
INNER JOIN Categoria cat ON p.id_categoria = cat.id_categoria;
GO
-- Hallazgo: Muestra la trazabilidad operativa completa de cada venta, permitiendo analizar qué categorías, productos y ciudades generan mayor volumen de ingresos individuales.

-- =========================================================================
-- Consulta 2: Clientes registrados sin compras (Inactivos)
-- Sirve para identificar a aquellos usuarios que se registraron en la base 
-- pero nunca concretaron ninguna compra, usando LEFT JOIN y la condición IS NULL.
-- =========================================================================

SELECT 
    c.nombre AS Nombre_Cliente,
    c.email AS Email,
    c.fecha_registro AS Fecha_Registro
FROM Cliente c
LEFT JOIN Ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_ventas IS NULL;
-- Hallazgo: Arrojó 0 registros. Para el área de CRM, esto implica una tasa de conversión inicial del 100%; no hay clientes inactivos o sin compras que deban ser reactivados, por lo que los esfuerzos deben centrarse en estrategias de fidelización y retención de la base actual.
-- =========================================================================
-- Consulta 3: Productos del catálogo sin ventas
-- Sirve para aislar los artículos publicados que no tienen ninguna venta 
-- registrada combinando un INNER JOIN con categoría y un LEFT JOIN con ventas.
-- =========================================================================
-SELECT 
    p.nombre_producto AS Nombre_Producto,
    cat.nombre_categoria AS Categoria,
    p.precio AS Precio
FROM Producto p
INNER JOIN Categoria cat ON p.id_categoria = cat.id_categoria
LEFT JOIN Ventas v ON p.id_producto = v.id_producto
WHERE v.id_ventas IS NULL;
GO
-- Hallazgo: Arrojó 0 registros. Para el área de Producto, esto demuestra que el 100% del catálogo tiene rotación comercial; no existen artículos estancados u obsoletos que requieran planes de liquidación, baja de inventario o revisión de precios.
-- =========================================================================
-- Consulta 4: Consolidado de ventas por canal o modalidad (UNION ALL)
-- Sirve para unificar dos conjuntos de datos etiquetados con columnas de texto 
-- virtuales ('Venta Mayorista' y 'Venta Minorista') y calcular la facturación total de cada uno.
-- =========================================================================
USE Ventas_Tech_DB;
GO

SELECT 
    canal, 
    SUM(total) AS total_canal
FROM (
    -- Primer subquery: Ventas con más de 1 unidad (Mayorista)
    SELECT 
        fecha_venta, 
        (cantidad * precio_unitario) AS total, 
        'Venta Mayorista' AS canal
    FROM Ventas 
    WHERE cantidad > 1
    
    UNION ALL
    
    -- Segundo subquery: Ventas de exactamente 1 unidad (Minorista)
    SELECT 
        fecha_venta, 
        (cantidad * precio_unitario) AS total, 
        'Venta Minorista' AS canal
    FROM Ventas 
    WHERE cantidad = 1
) AS consolidado
GROUP BY canal;
GO
-- Hallazgo: Revela qué modalidad comercial (la venta unitaria o por volumen) aporta mayor facturación global y sustento financiero al negocio.
