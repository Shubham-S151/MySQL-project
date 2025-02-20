-- create database bicycle;
-- use bicycle;
alter table orders modify column order_date datetime;
alter table orders modify column required_date datetime;
alter table orders modify column shipped_date datetime;

desc orders;
# shortest query is
select 1;

-- cerating a snowflake schema

create database bicycle_snowflake;
use bicycle_snowflake;

-- creating a customer dimension table
create table customer_dim as
(select * from bicycle.customers); 
alter table customer_dim add primary key (customer_id);

-- creating brand sub dimension  
create table order_dim as
(select order_id,order_status,order_date,shipped_date,required_date from bicycle.orders);
alter table order_dim add primary key (order_id);
alter table order_dim modify order_status int;

# cerating brand and category subdimension 
create table brand_subdim as
(select * from bicycle.brands);
alter table brand_subdim add primary key (brand_id);

-- creating category subdimension
create table category_subdim as 
(select * from bicycle.categories);
alter table category_subdim add primary key(category_id);

-- creating product dimension
create table product_dim as
(select product_id,product_name,brand_id,category_id,model_year from bicycle.products);
alter table product_dim add primary key (product_id),
						add constraint foreign key (brand_id) references brand_subdim(brand_id),
						add constraint foreign key (category_id) references category_subdim(category_id);
                        
# creating a fact table 
create table fact_table (list_price double,
						discount double,
                        quantity int,
                        product_id int,
                        customer_id int,
                        order_id int,
                        foreign key (product_id) references product_dim(product_id),
                        foreign key (customer_id) references customer_dim(customer_id),
                        foreign key (order_id) references order_dim(order_id));
                        
insert into fact_table 
select oi.list_price,oi.discount,oi.quantity,oi.product_id,o.customer_id,oi.order_id 
from bicycle.order_items oi join bicycle.orders o using(order_id);