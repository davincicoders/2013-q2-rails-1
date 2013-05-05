drop table if exists g218_users;

create table g218_users (
  id serial,
  username varchar(250),
  password varchar(250),
  primary key (id)
);

insert into g218_users (username, password)
  values ('Bob', 'Bob');
