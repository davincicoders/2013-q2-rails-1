drop table if exists g300_users;

create table g300_users (
  id              serial,
  username        varchar(250),
  password_digest varchar(250),
  primary key (id)
);

insert into g300_users (username, password_digest) values ('Bob',
  '$2a$10$SVb3kc/I47d/NJ2mZkEVXunAp89yoNCk0lOA4SpHu2IreUQOLuRHm');
