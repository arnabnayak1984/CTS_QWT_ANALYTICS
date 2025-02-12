{{config (materialized = 'table')}}

select
s.orderid,
s.lineno,
s.ShipperID,
s.CustomerID,
s.ProductID,
s.EmployeeID,
TO_DATE(replace(SHIPMENTDATE,'0:00','')) as ShipmentDate,
s.Status
from 
{{source('raw_qwt','raw_shipments')}} s 