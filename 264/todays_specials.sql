drop table if exists todays_specials;

create table todays_specials (
  id          serial,
  name        varchar(250),
  filename    varchar(250),
  price       varchar(250),
  primary key (id)
);

insert into todays_specials (name, filename, price)
values ('Apple Pie', 'pie.png', '$2.99');

insert into todays_specials (name, filename, price)
values ('Peach Gelato', 'gelato.png', '$3.99');

insert into todays_specials (name, filename, price)
values ('Fudge Brownies', 'fudge.png', '$2.49');
