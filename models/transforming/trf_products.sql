{{config(materialized = 'table',  schema = env_var('DBT_TRANSFORMSCHEMA', 'TRANSFORMING_DEV'))}}

select p.productid,
p.productname,
s.companyname,
s.ContactName,
s.Address,
s.City,
s.Country,
c.categoryname,
p.quantityperunit,
p.UnitCost,
p.unitprice,
p.unitsinstock,
p.unitsonorder,
to_decimal((p.unitprice-p.unitcost),9,2) as ProductMargin,
IFF(p.unitsinstock-p.unitsonorder< 0 ,'Not avilable','Available') as productavailability
 from 
{{ref("stg_products")}} p 
left join {{ref("trf_suppliers")}} s on p.SupplierID=s.SupplierID
left join {{ref("lkp_catagories")}} c on p.categoryid=c.categoryid

