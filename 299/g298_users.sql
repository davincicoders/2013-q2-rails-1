drop table if exists g298_users;

create table g298_users (
  id              serial,
  username        varchar(250),
  password_digest varchar(250),
  primary key (id)
);
