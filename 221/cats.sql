drop table if exists cats;

create table cats (
  id serial,
  name varchar(250),
  location varchar(250),
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);
