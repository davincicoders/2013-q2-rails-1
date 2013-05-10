drop table if exists students;
drop table if exists courses;
drop table if exists courses_students;

create table students (
  id serial,
  full_name varchar(250),
  student_number integer,
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);

create table courses (
  id serial,
  course_number varchar(10),
  name varchar(250),
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);

create table courses_students (
  id serial,
  student_id integer,
  course_id integer,
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);

insert into courses (course_number, name, created_at, updated_at)
  values ('CS101', 'Intro to Programming', now(), now());
insert into courses (course_number, name, created_at, updated_at)
  values ('MA202', 'Calculus', now(), now());
