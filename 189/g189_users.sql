drop table if exists g189_users;

create table g189_users (
  id serial,
  username varchar(100) not null,
  password varchar(100) not null,
  primary key (id)
);

insert into g189_users (username, password) values ('Jen', 'lock');
insert into g189_users (username, password) values ('Jim', 'rock');
