drop table if exists books;

create table books (
  id            serial,
  authors       varchar(250),
  title         varchar(250),
  condition     varchar(250),
  is_loaned_out boolean not null,
  stars         integer,
  created_at    timestamp,
  updated_at    timestamp,
  primary key (id)
);

insert into books (authors, title, condition, is_loaned_out, stars)
  values ('David Flanagan and Yukihiro Matsumoto',
    'The Ruby Programming Language', 'good', false, 5);

insert into books (authors, title, condition, is_loaned_out, stars)
  values ('Michael Hartl',
    'Ruby on Rails Tutorial: Learn Web Development with Rails',
    'perfect', true, 4);

