drop table if exists movies;
drop table if exists actors;
drop table if exists awards;
drop table if exists actors_movies;

create table movies (
  id serial,
  title varchar(250),
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);
create table actors (
  id serial,
  first_name varchar(250),
  last_name varchar(250),
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);
create table awards (
  id serial,
  year integer,
  award_name varchar(250),
  actor_id integer,
  movie_id integer,
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);
create table actors_movies (
  id serial,
  actor_id integer,
  movie_id integer,
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);

insert into movies (title, created_at, updated_at) values ('War Horse', now(), now()); --1
insert into movies (title, created_at, updated_at) values ('The Artist', now(), now()); --2
insert into movies (title, created_at, updated_at) values ('Moneyball', now(), now()); --3
insert into movies (title, created_at, updated_at) values ('The Descendants', now(), now()); --4
insert into movies (title, created_at, updated_at) values ('The Tree of Life', now(), now()); --5
insert into movies (title, created_at, updated_at) values ('Midnight in Paris', now(), now()); --6
insert into movies (title, created_at, updated_at) values ('The Help', now(), now()); --7
insert into movies (title, created_at, updated_at) values ('Hugo', now(), now()); --8
insert into movies (title, created_at, updated_at) values ('Extremely Loud & Incredibly Close', now(), now()); --9
insert into movies (title, created_at, updated_at) values ('Alfred Nobbs', now(), now()); --10
insert into movies (title, created_at, updated_at) values ('The Girl With the Dragon Tattoo', now(), now()); --11
insert into movies (title, created_at, updated_at) values ('The Iron Lady', now(), now()); --12
insert into movies (title, created_at, updated_at) values ('My Week With Marilyn', now(), now()); --13
insert into movies (title, created_at, updated_at) values ('A Better Life', now(), now()); --14
insert into movies (title, created_at, updated_at) values ('Tinker Tailor Soldier Spy', now(), now()); --15
insert into movies (title, created_at, updated_at) values ('Ocean''s Eleven', now(), now()); --16

insert into actors (first_name, last_name, created_at, updated_at) values ('Glenn', 'Close', now(), now()); --1
insert into actors (first_name, last_name, created_at, updated_at) values ('Rooney', 'Mara', now(), now()); --2
insert into actors (first_name, last_name, created_at, updated_at) values ('Viola', 'Davis', now(), now()); --3
insert into actors (first_name, last_name, created_at, updated_at) values ('Meryl', 'Streep', now(), now()); --4
insert into actors (first_name, last_name, created_at, updated_at) values ('Michelle', 'Williams', now(), now()); --5
insert into actors (first_name, last_name, created_at, updated_at) values ('Demian', 'Bichir', now(), now()); --6
insert into actors (first_name, last_name, created_at, updated_at) values ('George', 'Clooney', now(), now()); --7
insert into actors (first_name, last_name, created_at, updated_at) values ('Jean', 'Dujardin', now(), now()); --8
insert into actors (first_name, last_name, created_at, updated_at) values ('Gary', 'Oldman', now(), now()); --9
insert into actors (first_name, last_name, created_at, updated_at) values ('Brad', 'Pitt', now(), now()); --10
insert into actors (first_name, last_name, created_at, updated_at) values ('Sean', 'Penn', now(), now()); --11

insert into awards (year, award_name, actor_id, movie_id, created_at, updated_at) values (2012, 'Best Picture', null, 2, now(), now()); --1
insert into awards (year, award_name, actor_id, movie_id, created_at, updated_at) values (2012, 'Best Actress', 4, 12, now(), now()); --2
insert into awards (year, award_name, actor_id, movie_id, created_at, updated_at) values (2012, 'Best Actor', 8, 2, now(), now()); --3

insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (7, 16, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (1, 10, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (2, 11, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (3, 7, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (4, 12, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (5, 13, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (6, 14, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (7, 4, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (8, 2, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (9, 15, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (10, 3, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (10, 5, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (10, 16, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (11, 5, now(), now());
insert into actors_movies (actor_id, movie_id, created_at, updated_at) values (12, 5, now(), now());
