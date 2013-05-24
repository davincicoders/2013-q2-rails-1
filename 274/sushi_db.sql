drop table if exists sushi_dishes;

create table sushi_dishes (
  id serial,
  name varchar(250),
  price float,
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);

insert into sushi_dishes (name, price) values ('Tuna', 5.00);
insert into sushi_dishes (name, price) values ('Salmon', 4.75);
insert into sushi_dishes (name, price) values ('Yellowtail', 5.25);
insert into sushi_dishes (name, price) values ('Super White Tuna', 4.50);
insert into sushi_dishes (name, price) values ('Squid', 4.50);
insert into sushi_dishes (name, price) values ('Mackerel', 4.00);
insert into sushi_dishes (name, price) values ('Flying Fish Roe', 4.25);

drop table if exists sushi_orders;

create table sushi_orders (
  id serial,
  table_number integer,
  total_price float,
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);

drop table if exists sushi_order_line_items;

create table sushi_order_line_items (
  id serial,
  sushi_order_id integer,
  sushi_dish_id integer,
  quantity integer,
  line_price float,
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);
