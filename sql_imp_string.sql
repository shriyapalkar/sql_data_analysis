create database DB2;
use DB2;

create table student(
firstname varchar(20),
lastname varchar(20)
);

insert into student()
values
('Mary','LOBO'),
('Vanessa','Fezz');

select * from student;

-- Convert the Case of a String
SELECT lower('Mary'), upper('Mary');


create table fruits(
fruitname varchar(20));

insert into fruits()
values('Grape'),("Apple"),('Orange'),('Peach');

select * from fruits;

-- replace a Substring in a String
select replace(fruitname,'ap','AP') from fruits;
select replace(fruitname,'ge','GE') from fruits;

-- Trim a String
-- In order to trim spaces MySQL provides the function trim which removes spaces from the start 
-- and/or the end of any string. By default trim removes the specified character (not only space) 
-- from both sides of the string, however you can add the keywords leading or trailing to specify just one side of the string.
select trim('A' from 'Apple') as trim_result;

-- use group_concat()
-- MySQL provides an aggregate function called group_concat, which can be used to concat several strings, 
-- from different rows separated by a specified separator. Due group_concat is an aggregate function 
-- you must use the group by clause in the query.

create table teams (team_name text, team_member text);
insert into teams()
values('Barcelona','Messi'),('Barcelona','Piquet'),('Barcelona','Xavi');
insert into teams values ('Real Madrid','Ronaldo'), ('Real Madrid','Benzema'),('Real Madrid','Ramos');

select * from teams;

select team_name,group_concat(team_member) from teams group by team_name;


create table mydata(
data varchar(20)
);

insert into mydata()
values('hello how are you');

select * from mydata;

-- Use a substring()
select substring('hello how are you',7,3) as substring,
substr('hello how are you',7,3) as substr;
-- The second parameter specifies the position where the substring starts and the third parameter is the length of the substring to extract.

-- Use substring() with Regular Expressions
-- To extract a substring using a regular expression, MySQL provides the function regexp_substr, which
-- receives a source string and a pattern with the regular expression. 
-- The function regexp_substr returns a substring matching the regular expression.

select regexp_substr('hello how are you', 'h[a-z]* ') as a_word_starting_with_h;
-- MySQL provides another interesting function called regexp_like which returns a 0/1 flag indicating 
-- if the provided string matches the regular expression specified by the pattern in the second parameter.
select regexp_like('yellow', 'y[a-z]*w');

create table employee(
emp_id int,
last_name varchar(20),
first_name varchar(20),
starting_date varchar(20),
salary varchar(20));

insert into employee(emp_id, last_name, first_name, starting_date, salary)
values  (101,'Smith','John','6/1/2021',78000.00);

select * from employee;

create table candidates(
firstname varchar(20),
lastname varchar(20),
status varchar(20)
);

insert into candidates()
values('Jhon','Smith','to be hired');

drop table candidates;

select * from candidates;


insert into employee(last_name,first_name,starting_date) select lastname,firstname,'06/01/2021' from candidates where status = "to be hired";