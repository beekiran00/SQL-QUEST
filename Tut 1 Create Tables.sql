
/*

1. CREATING TABLES & INSERTING VALUES INTO TABLES

SQL is very comprehensive. It's as easy as the following 2 lines of code down below.

To create a table:
a.create table table_name(column1 dtype1,...., columnN dtypeN);

To insert values into the table:
b.insert into table_name(column1,....columnN) values (value1,..., valueN)

-- ZOO

a.ticket counter
b.animals
c.employees
d.sections of zoo

*/

create table zoo.ticket_counter(

ticket_type int,
cust_name varchar(100),
cust_id int

);

create table zoo.animals(

animal_id int, 
animal_type varchar(100),
animal_section int

);

create table zoo.eomployee(

emp_id int,
emp_name varchar(100),
emp_salary int

);

create table zoo.section(

section_id int,
section_name varchar(100)

);


-- select * from zoo.ticket_counter;

insert into zoo.section(section_id, section_name)
values(1, 'ice');

select * from zoo.section;

insert into zoo.eomployee(emp_id,emp_name,emp_salary)
values(101,'Sam',10000);

select * from zoo.eomployee;

insert into zoo.animals(animal_id,animal_type, animal_section)
 values (1000, 'pengu', 1);
 
 insert into zoo.ticket_counter(ticket_type, cust_name, cust_id)
values(1, 'Allen', 01);



select * from zoo.animals;
select * from zoo.eomployee;
select * from zoo.section;
select * from zoo.ticket_counter;






