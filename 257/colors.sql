drop table colors;

create table colors (
  id serial,
  name varchar(10),
  code varchar(7),
  primary key (id)
);

insert into colors (name, code) values ('black', '#000000');
insert into colors (name, code) values ('red', '#FF0000');
insert into colors (name, code) values ('green', '#00FF00');
insert into colors (name, code) values ('blue', '#0000FF');
insert into colors (name, code) values ('yellow','#FFFF00');
insert into colors (name, code) values ('cyan', '#00FFFF');
insert into colors (name, code) values ('magenta', '#FF00FF');
insert into colors (name, code) values ('gray', '#C0C0C0');
insert into colors (name, code) values ('white', '#FFFFFF');
