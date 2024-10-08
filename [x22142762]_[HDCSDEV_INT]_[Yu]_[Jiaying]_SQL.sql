#part 2
#Q1
drop database if exists hansung;
create database hansung;
use hansung;
SET FOREIGN_KEY_CHECKS=0;

#Q2
create table customer(
	c_id int primary key,
    Lname varchar(60),
    Fname varchar(60)
);

create table employees(
	e_id int primary key,
    Fname varchar(60),
    gender varchar(60),
	salary decimal(60,10),
    address varchar(60)
);

create table item(
	i_id int primary key,
    item_name varchar(60),
    quantity varchar(60),
    price decimal(60,6)
);

create table t_order(
	o_id int primary key,
    total decimal(60,6),
    o_date varchar(60),
    price decimal(60,6),
    i_id int,
    e_id int,
    c_id int,
foreign key(i_id)
references item(i_id),
foreign key(e_id)
references employees(e_id),
foreign key(c_id)
references customer(c_id)
);

create table t_orderd(
	od_id int primary key,
    o_date varchar(60),
    o_id int,
    price decimal(10,2),
    total decimal(10,2),
foreign key(o_id)
references t_order(o_id)
);

set foreign_key_checks=1;

#Q3
insert into customer 
values (51,'le','ke');
select*from customer;

insert into employees(e_id,Fname) 
values(20,'shi');
select*from employees;

insert into item (i_id, item_name, quantity, price) values (1, 'Chicken Mayo', 109, 10.59);
insert into item (i_id, item_name, quantity, price) values (2, 'Kimchi Dishes', 13, 11.4);
insert into item (i_id, item_name, quantity, price) values (3, 'Fried Chiecken', 562, 15.35);
select*from item;

#Part 3
#Q1.1
#Show the total number of transactions your database is storing
select sum(quantity) as 'Best Selling Dishes' from item;

#Q1.2
#Show the most sold/listed item or customer with the highest number of purchases
select quantity from item
where quantity = (select max(quantity) from item);

#Q2
select i_id, price from item 
group by i_id order by price DESC;

#Q3
select i_id, count(i_id) from item
where i_id = 'price';

#Q4 
select od_id from t_orderd
inner join t_order on t_orderd.od_id=t_order.o_id
inner join item on t_orderd.o_id=item.item_name;

#Q5 
select o_id, count(o_id)
as 'Most Popular Dishes' from t_order
group by o_id
order by count(o_id) desc limit 7;

#Q6.1
select month(t_orderd.o_date)
as 'month', sum(t_orderd.total),
group_concat(od_id)
as 'Monthly Transactions'from t_orderd
group by month
order by month;

#Q6.2
select month(t_orderd.o_date) 
as'month',sum(item.price*item.quantity)
as'Purchase Value'from item inner join t_orderd
on t_orderd.od_id=item.i_id
group by month
order by month;

#Q6.3
select month(t_order.o_date)
as'month',
item.item_name,item.i_id,item.quantity from item
inner join t_order
on item.i_id = t_order.o_id
order by month;

