{{config(materialized = 'table',  schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select 
ss.orderid,
ss.lineno,
sh.companyname,
ss.shipmentdate,
ss.Status
 from 
{{ref("shipments_snapshot")}} ss left outer join {{ref("lkp_shippers")}} sh 
on ss.ShipperID = sh.ShipperID
where ss.dbt_valid_to is null