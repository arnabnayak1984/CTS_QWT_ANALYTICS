{{config(materialized = 'view', schema = 'reporting_dev')}}

select  
    c.companyname as companyname,
    c.contactname  as contactname,
    min(f.orderdate) as  firstorderdate,
    min(d.day_of_week_name) as first_order_day,
    max(orderdate) as lastorderdate,
    max(d.day_of_week_name) as recent_order_day,
    sum(f.quantity) as totalquantity,
    sum(f.linesalesamount) as totalamount
 from {{ref("fct_orders")}} f left join {{ref("dim_customers")}} c on f.customerid = c.customerid
 left join {{ref("dim_date")}} d on f.orderdate=d.date_day
 group by c.companyname,c.contactname