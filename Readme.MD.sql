USE Ventas_Tech_DB

# RetailPro — Analítica Comercial y Gestión de Datos (`Ventas_Tech_DB`)

Proyecto integral de Business Intelligence y análisis de datos para **RetailPro**, desarrollado sobre la base de datos relacional `Ventas_Tech_DB`. El repositorio centraliza las consultas SQL utilizadas para auditar la operación comercial, evaluar el rendimiento del catálogo y dar soporte a la toma de decisiones de las áreas de Ventas, CRM y Producto.

## Descripción del proyecto

**RetailPro** es una solución analítica diseñada para transformar datos transaccionales de ventas en indicadores accionables para el negocio. A partir del modelo relacional compuesto por las tablas `Ventas`, `Cliente`, `Producto` y `Categoria`[cite: 1], el proyecto permite:

- **Monitoreo comercial mensual:** Seguimiento de facturación total, volumen de pedidos y ticket promedio para evaluar la evolución del negocio[cite: 2].
- **Gestión de catálogo y productos:** Identificación de productos líderes en ingresos y rotación por unidades, comparación frente al promedio de facturación y detección de artículos sin movimiento[cite: 1, 2].
- **Análisis de clientes y canales:** Evaluación de recurrencia de compra, detección de clientes registrados sin transacciones y segmentación de ingresos por canal (`Venta Mayorista` vs. `Venta Minorista`)[cite: 1, 2].
- **Trazabilidad operativa:** Integración de transacciones con sus dimensiones descriptivas (cliente, ciudad, producto y categoría) como base para reportes ejecutivos[cite: 1].

## Herramientas y tecnologías utilizadas

- **SQL Server / T-SQL (SSMS):** Diseño y ejecución de consultas analíticas mediante agregaciones (`SUM`, `COUNT`, `AVG`), agrupación y filtrado (`GROUP BY`, `HAVING`), expresiones de tabla comunes (`WITH` / CTE), cruces relacionales (`INNER JOIN`, `LEFT JOIN`) y consolidación de conjuntos (`UNION ALL`)[cite: 1, 2].
- **Ecosistema BI y Hoja de Cálculo (Excel / Power BI):** Preparación de tablas analíticas, modelado de indicadores comerciales y visualización ejecutiva de KPIs.
- **Git & GitHub:** Control de versiones, documentación técnica y publicación del código del proyecto.

## Estructura del repositorio

- `m4_consultas_negocio.sql..sql`: Consultas de indicadores comerciales clave de RetailPro (resumen ejecutivo mensual, ranking Top 5 de productos, recurrencia de clientes y benchmarking frente al promedio de ventas)[cite: 2].
- `m5_consultas_joins.sql`: Consultas relacionales avanzadas para trazabilidad completa de ventas, auditoría de clientes inactivos, control de rotación de catálogo y facturación por canal[cite: 1].

## Cómo ejecutar los scripts SQL

1. Asegurate de contar con una instancia activa de **SQL Server** y tener creada y cargada la base de datos `Ventas_Tech_DB` con sus tablas (`Ventas`, `Cliente`, `Producto`, `Categoria`)[cite: 1, 2].
2. Cloná este repositorio en tu equipo local:
   ```bash
   git clone [https://github.com/lorenzonaddeo05-spec/Ventas_Tech_DB.git](https://github.com/lorenzonaddeo05-spec/Ventas_Tech_DB.git)

   ---

### 2. Sección para tu documento de entrega (Tarea 3)


| # | Qué decía la versión inicial de la IA | Cómo quedó en mi `README.md` | Por qué lo cambié |
| :--- | :--- | :--- | :--- |
| **1** | Describía el repositorio de forma acotada como un conjunto puntual de consultas de ventas. | Se reescribió con enfoque integral del **proyecto RetailPro**, detallando sus 4 ejes de negocio (monitoreo mensual, catálogo, clientes/canales y trazabilidad operativa) y las tablas del modelo (`Ventas`, `Cliente`, `Producto`, `Categoria`)[cite: 1, 2]. | Para contextualizar el propósito global del proyecto RetailPro y no limitarlo únicamente a un par de consultas aisladas. |
| **2** | Mencionaba solo SQL Server y GitHub con funciones básicas. | Se incorporó todo el stack técnico del proyecto (SQL Server/T-SQL con `JOIN`, `UNION ALL`, herramientas de BI/Excel para reporte ejecutivo y Git/GitHub). | Para reflejar fielmente las herramientas y técnicas utilizadas a lo largo del desarrollo completo de RetailPro. |
| **3** | Daba instrucciones breves y genéricas para correr un único archivo SQL. | Se detallaron los prerrequisitos de esquema en `Ventas_Tech_DB`, la estructura completa de scripts del repositorio y la ejecución controlada por bloques (`F5`) en SSMS. | Para garantizar que cualquier usuario o evaluador pueda reproducir el entorno completo de RetailPro sin errores de ejecución. |