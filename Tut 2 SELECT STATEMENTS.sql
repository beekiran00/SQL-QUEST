/*

2. SELECT STATEMENTS
   -- Filter and sorting
   -- Basic Operators and Functions

-- additional comments

* - it means all

select all(*) from table_name

*/

select * from carrental.customer;

select * from carrental.equipment;

select * from carrental.vehicle order by model_year desc;
 
-- select */ column_names, from schema.table_name where column_name =/> / </ != /LIKE condition_to_filter;

select brand,model,model_year
from carrental.vehicle
where model_year like '%7'
order by model_year;

-- + - / % < > >= <= !=

select 10+10;
select 10-10;
select 10/10;
select 10%10;

select brand,model,model_year
from carrental.vehicle
where model_year > 2016
order by model_year;





