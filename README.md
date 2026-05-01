# Dashboard de Rentabilidad Bancaria 2023-2024

## Descripción
Análisis de rentabilidad de productos financieros de un banco comercial ficticio.
Proyecto con flujo 100% profesional — conexión directa MySQL a Power BI sin intermediarios.

## Herramientas utilizadas
- **MySQL** — Base de datos, tablas y consultas de análisis
- **Power BI** — Conexión directa a MySQL, modelo de datos y dashboard ejecutivo
- **DAX** — Medidas de Ingreso, Costo, Margen y Total Clientes

## Análisis realizados
- Clientes y ingreso promedio por segmento (Retail, Premium, Empresas, Jóvenes)
- Rentabilidad por producto financiero (préstamos, tarjetas, hipotecas, seguros)
- Productos más contratados por segmento de cliente
- Sucursales con mayor margen generado

## Estructura del proyecto
- `clientes.csv` — 400 clientes con segmento, scoring crediticio e ingresos
- `productos.csv` — 12 productos financieros con tasas de interés
- `contratos.csv` — 959 contratos activos y cancelados
- `transacciones.csv` — 19,915 transacciones mensuales 2023-2024
- `sucursales.csv` — 8 sucursales en España
- `consultas.sql` — 4 requerimientos resueltos en SQL

## Resultados clave
- Ingreso total: €2,04M | Margen total: €1,50M | Margen %: 73%
- Los Préstamos lideran en margen absoluto
- Segmento Premium: solo 71 clientes pero generan €421K de margen
- Bilbao es la sucursal más rentable con €240K de margen
