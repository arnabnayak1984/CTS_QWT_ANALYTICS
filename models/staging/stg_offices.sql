{{config (materialized = 'table')}}

select 
office as officeid,
officeaddress  as address,
officepostalcode as postalcode,
officecity as city,
officestateprovince as stateprovince,
officephone  as phone,
officefax as fax,
officeCountry as country 
from 
{{source('raw_qwt','raw_offices')}}