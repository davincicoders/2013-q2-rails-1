drop table if exists authors;

create table authors (
  id            integer,
  first_name    varchar(250),
  email         varchar(250),
  primary key (id)
);

insert into authors (id, first_name, email)
  values (11, 'Jill', 'jill.g@mail.com');
insert into authors (id, first_name, email)
  values (12, 'Ken', 'ken.m@mail.com');
insert into authors (id, first_name, email)
  values (13, 'Jill', 'jill.r@mail.com');

drop table if exists recipes;

create table recipes (
  id            integer,
  recipe_name   varchar(250),
  author_id     integer not null,
  primary key (id)
);

insert into recipes (id, recipe_name, author_id) values (1, 'Brownies', 11);
insert into recipes (id, recipe_name, author_id) values (2, 'Fudge', 12);
insert into recipes (id, recipe_name, author_id) values (3, 'Snickerdoodles', 12); 
insert into recipes (id, recipe_name, author_id) values (4, 'Chocolate cookies', 11);
