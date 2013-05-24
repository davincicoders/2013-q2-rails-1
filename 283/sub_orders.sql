drop table if exists sub_orders;

create table sub_orders (
  id                serial,
  sandwich_type     varchar(250),
  bread_type        varchar (250),
  want_12_inch      boolean,
  want_extra_cheese boolean,
  want_chips        boolean,
  total_order       varchar (250),
  created_at        timestamp,
  updated_at        timestamp,
  primary key (id)
);
