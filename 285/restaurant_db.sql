drop table if exists menu_items;

create table menu_items (
  id    serial,
  name  varchar(250) not null,
  price float not null,
  primary key (id)
);

insert into menu_items (name, price) values ('Hot Chocolate', 2.50);
insert into menu_items (name, price) values ('Milk', 2.00);
insert into menu_items (name, price) values ('Bottle water', 2.00);
insert into menu_items (name, price) values ('Juice', 2.50);
insert into menu_items (name, price) values ('Canned pop', 2.00);

drop table if exists restaurant_tables;

create table restaurant_tables (
  id               integer not null,
  number_of_chairs integer not null,
  primary key (id)
);

insert into restaurant_tables (id, number_of_chairs) values (1, 2);
insert into restaurant_tables (id, number_of_chairs) values (2, 2);
insert into restaurant_tables (id, number_of_chairs) values (3, 2);
insert into restaurant_tables (id, number_of_chairs) values (4, 2);
insert into restaurant_tables (id, number_of_chairs) values (5, 2);
insert into restaurant_tables (id, number_of_chairs) values (6, 2);
insert into restaurant_tables (id, number_of_chairs) values (7, 2);
insert into restaurant_tables (id, number_of_chairs) values (9, 2);
insert into restaurant_tables (id, number_of_chairs) values (11, 2);
insert into restaurant_tables (id, number_of_chairs) values (8, 4);
insert into restaurant_tables (id, number_of_chairs) values (10, 4);

drop table if exists restaurant_orders;

create table restaurant_orders (
  id                  serial,
  party_size          integer not null,
  restaurant_table_id integer not null,
  is_closed           boolean not null,
  created_at          timestamp,
  updated_at          timestamp,
  primary key (id)
);

drop table if exists ordered_menu_items;

create table ordered_menu_items (
  id                   serial,
  restaurant_order_id  integer not null,
  menu_item_id         integer not null,
  chair_number         integer not null,
  created_at           timestamp,
  primary key (id)
);
