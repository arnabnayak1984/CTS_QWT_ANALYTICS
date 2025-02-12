{{config(materialized = 'view', schema = 'reporting_dev')}}

select  e.country,c.companyname,c.contactname,count(f.orderid) as total_orders,count(f.quantity) as total_quantity,
sum(f.linesalesamount) as linesalesamount,avg(f.margin) as margin
 from {{ref("fct_orders")}} f left outer join {{ref("dim_customers")}} c on f.customerid = c.customerid
left outer join {{ref("dim_employees")}} e on f.employeeid = e.empid
where e.country = '{{var('v_country','France')}}'
group by e.country,c.companyname,c.contactname