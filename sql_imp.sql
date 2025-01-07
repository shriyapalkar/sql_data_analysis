create database DB1;
use DB1;

create table student(
firstname varchar(20),
lastname varchar(20));

insert into student()
values
('BOB','Dsoza'),
('Mary','KOM');

select * from student;

-- Concatenate Strings in MySQL
select concat(firstname,'',lastname,'') as name from student;

-- The concat function allows various parameters. 
-- One disadvantage of using the concat function is a null value in any of the parameters being used will result in a null value.
select concat('BOB',null,'Dsoza') as result;


