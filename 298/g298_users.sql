drop table if exists g298_users;

create table g298_users (
  id              serial,
  username        varchar(250),
  password        varchar(250),
  primary key (id)
);

insert into g298_users (username, password)
  values ('Sue', 'Sue');

insert into g298_users (username, password)
  values ('Jan', 'Jan');
