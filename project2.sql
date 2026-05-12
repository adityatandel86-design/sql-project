create database data_transformer;
use data_transformer;


create Table customers (
	customer_id int primary key,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(50),
	registration_date date  
	); 


insert into customers (customer_id, first_name, last_name, email, registration_date)
values (1, 'Prince', 'Mali', 'prince@email.com', '2022-03-15'),
(2, 'Ashish', 'Mali', 'ashish.mali@email.com', '2021-11-02'),
(3, 'Akansha', 'Sharma', 'akansha.sharma@email.com', '2023-01-10'),
(4, 'Vaibhav', 'Gupta', 'vaibhav.gupta@email.com', '2022-05-18'),
(5, 'Neha', 'Verma', 'neha.verma@email.com', '2021-07-25'),
(6, 'Karan', 'Mehta', 'karan.mehta@email.com', '2023-02-14'),
(7, 'Pooja',' Singh', 'pooja.singh@email.com', '2022-08-30'),
(8, 'Rohit', 'Yadav', 'rohit.yadav@email.com', '2021-12-11'),
(9, 'Sneha',' Joshi', 'sneha.joshi@email.com', '2023-03-01'),
(10, 'Vikas', 'Chauhan', 'vikas.chauhan@email.com', '2022-09-09'),
(11, 'Ankit', 'Mishra', 'ankit.mishra@email.com', '2021-06-20'),
(12, 'Priya', 'Kapoor', 'priya.kapoor@email.com', '2023-04-05'),
(13, 'Arjun', 'Reddy', 'arjun.reddy@email.com', '2022-10-22'),
(14, 'Simran', 'Kaur', 'simran.kaur@email.com', '2021-08-15'),
(15, 'Deepak', 'Jain', 'deepak.jain@email.com', '2023-02-28'),
(16, 'Meena', 'Iyer', 'meena.iyer@email.com', '2022-11-19'),
(17, 'Suresh', 'Naidu', 'suresh.naidu@email.com',' 2021-09-27'),
(18, 'Riya', 'Das', 'riya.das@email.com', '2023-03-18'),
(19, 'Manish', 'Agarwal', 'manish.agarwal@email.com', '2022-06-12'),
(20, 'Kavita', 'Shah', 'kavita.shah@email.com', '2021-10-03');

select * from customers;


create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2)
);
    
insert into Orders (order_id, customer_id, order_date, total_amount) 
values (101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-02', 220.00),
(103, 3, '2023-07-03', 320.75),
(104, 4, '2023-07-04', 450.00),
(105, 5, '2023-07-05', 99.99),
(106, 6, '2023-07-06', 700.50),
(107, 7, '2023-07-07', 85.00),
(108, 8, '2023-07-08', 920.00),
(109, 9, '2023-07-09', 1500.00),
(110, 10, '2023-07-10', 250.00),
(111, 11, '2023-07-11', 310.00),
(112, 12, '2023-07-12', 410.25),
(113, 13, '2023-07-13', 600.00),
(114, 14, '2023-07-14', 75.00),
(115, 15, '2023-07-15', 780.00),
(116, 16, '2023-07-16', 920.50),
(117, 17, '2023-07-17', 110.00),
(118, 18, '2023-07-18', 220.00),
(119, 19, '2023-07-19', 330.00),
(120, 20, '2023-07-20', 440.00);

select * from orders;


create table employees (
    employee_id int primary key,
    first_name varchar(20),
    last_name varchar(20),
    department varchar(30),
    hire_date date,
    salary decimal(10,2)
);

insert into employees (employee_id, first_name, last_name, department, hire_date, salary) 
values (1, 'Raj', 'Kumar', 'IT', '2019-07-10', 60000),
(2, 'Anita', 'Desai', 'Finance', '2020-11-05', 52000),
(3, 'Vijay', 'Malhotra', 'Sales', '2018-06-25', 48000),
(4, 'Sunita', 'Sharma', 'HR', '2021-08-14', 53000),
(5, 'Ramesh', 'Gupta', 'IT', '2019-09-30', 62000),
(6, 'Kiran', 'Patel', 'Finance', '2020-02-17', 51000),
(7, 'Alok', 'Verma', 'Sales', '2017-12-01', 47000),
(8, 'Divya', 'Nair', 'HR', '2022-01-10', 56000),
(9, 'Sanjay', 'Singh', 'IT', '2018-04-22', 63000),
(10, 'Neelam', 'Joshi', 'Finance', '2021-06-18', 54000),
(11, 'Pankaj', 'Yadav', 'Sales', '2019-10-09', 49000),
(12, 'Rekha', 'Iyer', 'HR', '2020-03-11', 52000),
(13, 'Mohit', 'Agarwal', 'IT', '2017-08-29', 64000),
(14, 'Shalini', 'Kapoor', 'Finance', '2022-02-15', 55000),
(15, 'Aakash', 'Reddy', 'Sales', '2018-05-05', 50000),
(16, 'Nisha', 'Kaur', 'HR', '2021-09-21', 57000),
(17, 'Tarun', 'Das', 'IT', '2019-11-13', 61000),
(18, 'Pooja', 'Mehta', 'Finance', '2020-07-27', 53000),
(19, 'Manoj', 'Chauhan', 'Sales', '2018-10-19', 48000),
(20, 'Kavita', 'Shah', 'HR', '2021-04-08', 56000);
select * from employees;


select o.order_id, c.first_name, c.last_name, o.total_amount from orders o inner join customers c on o.customer_id=c.customer_id;


select c.first_name, c.last_name, o.order_id from customers c left join orders o on c.customer_id = o.customer_id;


select o.order_id, c.first_name from orders o right join customers c on o.customer_id = c.customer_id;


select c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, o.total_amount from customers c left join orders o on c.customer_id=o.customer_id
union
select c.customer_id, c.first_name, c.last_name, o.order_id, order_date, total_amount from customers c right join orders o on c . customer_id=o.customer_id

select * from customers where customer_id in (select customer_id from orders 
where total_amount > (select avg(total_amount) from orders));


select first_name, salary from employees where salary > (select avg(salary) from employees);


select order_id,year(order_date) as year,month(order_date) as month from orders;


select order_id,date_format(order_date, '%d-%b-%y') as date_order from orders;


select concat(first_name, ' ', last_name) as full_name from customers;


update customers
set first_name = replace(first_name, 'Prince', 'jonathan');


select upper(first_name), lower(last_name) from customers;


select trim(email) from customers;


select order_id, total_amount,sum(total_amount) over (order by order_date) as total from orders;


select order_id, total_amount, rank() over (order by total_amount desc) as rankno from orders;


select order_id, total_amount,
case 
    when total_amount > 1000 then '10% discount'
    when total_amount > 500 then '5% discount'
    else 'no discount'
end as discount
from orders;


select first_name, salary,
case 
    when salary >= 55000 then 'high'
    when salary >= 50000 then 'medium'
    else 'low'
end as category
from employees;