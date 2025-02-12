
{{config(materialized = 'view', schema = 'reporting_dev')}}


select 
concat(e.firstname,' ',e.lastname) as empname,
count(c.customerid) as customerid,
count(p.productid) as productid,
sum(f.linesalesamount) as salesamount
from {{ref("fct_orders")}} f left outer join {{ref("dim_customers")}} c on f.customerid = c.customerid
left outer join {{ref("dim_employees")}} e on f.employeeid = e.empid
left outer join {{ref("dim_products")}} p on f.productid = p.productid
group by concat(e.firstname,' ',e.lastname)
order by sum(f.linesalesamount) desc