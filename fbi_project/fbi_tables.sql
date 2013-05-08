drop table if exists sg_customers;

create table sg_customers (
  id serial,
  bride_name varchar(100),
  bride_phone	varchar(100),
  bride_email	varchar(100),
  groom_name	varchar(100),
  groom_phone	varchar(100),
  groom_email	varchar(100),
  company_name	varchar(100),
  contact_name	varchar(100),
  contact_w_phone	varchar(100),
  contact_c_phone	varchar(100),
  contact_email	varchar(100),
  company_address	varchar(100),
  company_city	varchar(100),
  company_state	varchar(100),
  company_zip	varchar(100),
  company_country	varchar(100),
  notes	varchar(500),
  primary key	(id)
);

insert into sg_customers (bride_name, bride_phone, bride_email, groom_name, groom_phone, groom_email, company_name, contact_name, contact_w_phone, contact_c_phone, contact_email, company_address, company_city, company_state, company_zip, company_country, notes) values ('Sara Bolle', '720-111-1111', 'sara.bolle@gmail.com', 'Travis Deatherage', '720-222-222', 'travis@lynx.com', null, null, null, null, null, null, null, null, null, null, 'These are my customer notes.'); 



drop table if exists sg_florists;

create table sg_florists (
id	serial,
name	varchar(100),
address	varchar(100),
city	varchar(100),
state	varchar(100),
zip	varchar(100),
country	varchar(100),
website	varchar(100),
phone	varchar(100),
primary key	(id)
);

insert into sg_florists (name, address, city, state, zip, country, website, phone) values ('Fundingsland Flowers', '555 Eastwood Ct.', 'Denver', 'CO', '23463','US', 'www.funflowers.com', '555-222-3333');


drop table if exists sg_employees;

create table sg_employees (
id serial,
name	varchar(100),
status	varchar(100),
email	varchar(100),
w_phone	varchar(100),
c_phone	varchar(100),
type	varchar(100),
login_name	varchar(100),
password	varchar(100),
admin_rights	boolean,
primary key	(id)

);

insert into sg_employees (name, status, email, w_phone, c_phone, type, login_name, password, admin_rights) values ('Jenny Fundingsland', 'Active', 'www.jenny@funflowers.com', '720-555-9999', '720-444-4444', 'owner', 'jfundingsland', 'mother', TRUE);



drop table if exists sg_ceremonies;

create table sg_ceremonies (
id	serial,
name	varchar(100),
address	varchar(100),
city	varchar(100),
state	varchar(100),
zip	varchar(100),
country	varchar(100),
website	varchar(100),
phone	varchar(100),
primary key	(id)
);

insert into sg_ceremonies (name, address, city, state, zip, country, website, phone) values ('Keystone Resort', '555 Ski Hill Road', 'Keystone', 'CO', '23893', 'US', 'www.keystone.com', null);



drop table if exists sg_receptions;

create table sg_receptions (

id	serial,
name	varchar(100),
address	varchar(100),
city	varchar(100),
state	varchar(100),
zip	varchar(100),
country	varchar(100),
website	varchar(100),
phone	varchar(100),
primary key	(id)
);

insert into sg_receptions (name, address, city, state, zip, country, website, phone) values ('Mountain House', '555 Mtn House Road', 'Keystone', 'CO', '23893', 'US', 'www.keystone.com', null);



drop table if exists sg_photographers;

create table sg_photographers (

id	serial,
first_name	varchar(100),
last_name	varchar(100),
status	varchar(100),
email	varchar(100),
w_phone	varchar(100),
c_phone	varchar(100),
primary key	(id)
);

insert into sg_photographers (first_name, last_name, status, email, w_phone, c_phone) values ('Dustin', 'Smith', 'active', 'dsmith@photosrus.com', '345-332-0987', '234-987-4829');



drop table if exists sg_coordinators;

create table sg_coordinators (

id	serial,
first_name	varchar(100),
last_name	varchar(100),
status	varchar(100),
email	varchar(100),
w_phone	varchar(100),
c_phone	varchar(100),
primary key	(id)
);

insert into sg_coordinators (first_name, last_name, status, email, w_phone, c_phone) values ('Tara', 'Sims', 'active', 'tsims@coord.com', '233-234-3242', '375-432-9876');



drop table if exists sg_fresh_products;

create table sg_fresh_products (
id	serial,
name	varchar(100),
unit_of_cost	varchar(100),
unit_cost	float not null,
cost_per_unit	float not null,
taxable	boolean,
markup	float not null,
primary key	(id)
);

insert into sg_fresh_products (name, unit_of_cost, unit_cost, cost_per_unit, taxable, markup) values ('dandelions', 25, 45.00, 1.80, TRUE, 3.00);



drop table if exists sg_hard_products;

create table sg_hard_products (
id	serial,
name	varchar(100),
unit_of_cost	varchar(100),
unit_cost	float not null,
cost_per_unit	float not null,
taxable	boolean,
markup	float not null,
primary key	(id)
);

insert into sg_hard_products (name, unit_of_cost, unit_cost, cost_per_unit, taxable, markup) values ('round vases', 5, 25.00, 5.00, FALSE, 2.00 );



drop table if exists sg_labor_products;

create table sg_labor_products (
id	serial,
name	varchar(100),
unit_of_cost	varchar(100),
unit_cost	float not null,
cost_per_unit	float not null,
taxable	boolean,
markup	float not null,
primary key	(id)
);

insert into sg_labor_products (name, unit_of_cost, unit_cost, cost_per_unit, taxable, markup) values ('Delivery', 1.00, 0.53, 0.53, true, 1.00);



drop table if exists sg_taxes;

create table sg_taxes (
id	serial,
region	varchar(100),
tax_rate	float not null,
primary key	(id)
);

insert into sg_taxes (region, tax_rate) values ('CO', 0.45);



drop table if exists sg_customers_sg_events;

create table sg_customers_sg_events (
id	serial,
sg_customer_id	integer not null,
sg_event_id	integer not null,
primary key	(id)
);

insert into sg_customers_sg_events (sg_customer_id, sg_event_id) values (1, 1);



drop table if exists sg_quote_items;

create table sg_quote_items (
id	serial,
sg_specification_id	integer not null,
sg_quote_id	integer not null,
quoted_item_price	float not null,
quoted_item_cost	float not null,
quoted_total_price	float not null,
quoted_tax	float not null,
quoted_grand_total	float not null,
total_deposit	float not null,
margin	float not null,
primary key	(id)
);

insert into sg_quote_items (sg_specification_id, sg_quote_id, quoted_item_price, quoted_item_cost, quoted_total_price, quoted_tax, quoted_grand_total, total_deposit, margin) values (1, 1, 399.00, 250.00, 400.00, 35.00, 435.00, 200.00, 0.35);



drop table if exists sg_events;

create table sg_events (
id	serial,
type	varchar(100),
date	varchar(100),
time	varchar(100),
deliery_setup_date	varchar(100),
delivery_setup_time	varchar(100),
notes	varchar(250),
feel_of_day	varchar(100),
color_palette	varchar(100),
flower_types	varchar(100),
attire	varchar(100),
lead_designer	varchar(100),
sg_ceremony_id	integer not null,
sg_reception_id	integer not null,
sg_photographer_id	integer not null,
sg_coordinator_id	integer not null,
primary key	(id)
);

insert into sg_events (type, date, time, deliery_setup_date, delivery_setup_time, notes, feel_of_day, color_palette, flower_types, attire, lead_designer, sg_ceremony_id, sg_reception_id, sg_photographer_id, sg_coordinator_id) values ('Wedding', '05/06/2012', '6pm', '05/06/2012', '4pm', 'Notes for events', 'whimsy', 'yellow', 'roses', 'tuxedos', 'Jenny', 1, 1, 1, 1);




drop table if exists sg_quotes;

create table sg_quotes (
id	serial,
quote_name	varchar(100),
total_price	float not null,
total_tax	float not null,
grand_total	float not null,
total_deposit	float not null,
margin	float not null,
status	varchar(100),
primary key	(id)
);

insert into sg_quotes (quote_name, total_price, total_tax, grand_total, total_deposit, margin, status) values ('Saras Wedding', 400.00, 35.00, 435.00, 200.00, 0.35, 'active');



drop table if exists sg_specifications;

create table sg_specifications (
id	serial,
sg_event_id	integer not null,
item_name	varchar(100),
item_quantity	integer not null,
item_specs	varchar(1000),
primary key	(id)
);

insert into sg_specifications (sg_event_id, item_name, item_quantity, item_specs) values (1, 'bouquet', 4, 'these are the specs for the boquet');



drop table if exists sg_orders;

create table sg_orders (
id	serial,
order_name	varchar(100),
order_date	varchar(100),
status	varchar(100),
sg_quote_id	integer not null,
order_placed	boolean,
primary key	(id)
);

insert into sg_orders (order_name, order_date, status, sg_quote_id, order_placed) values ('Saras Wedding', 'May 1, 2012', 'active', 1, TRUE);



drop table if exists sg_designed_products;

create table sg_designed_products (
id	serial,
sg_specification_id	integer not null,
sg_fresh_product_id	integer not null,
fresh_product_qty	integer not null,
sg_hard_product_id	integer not null,
hard_product_qty	integer not null,
sg_labor_product_id	integer not null,
labor_product_qty	integer not null,
primary key	(id)
);

insert into sg_designed_products (sg_specification_id, sg_fresh_product_id, fresh_product_qty, sg_hard_product_id, hard_product_qty, sg_labor_product_id, labor_product_qty) values (1, 1, 4, 1, 3, 1, 1.00);


