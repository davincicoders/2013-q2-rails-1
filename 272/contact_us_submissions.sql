drop table if exists contact_us_submissions;

create table contact_us_submissions (
  id serial,
  your_name varchar(250),
  email   varchar(250),
  website    varchar(250),
  country   boolean,
  comments  varchar(250),
  primary key (id)
);
