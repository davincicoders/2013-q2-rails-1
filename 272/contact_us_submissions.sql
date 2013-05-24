drop table if exists contact_us_submissions;

create table contact_us_submissions (
  id serial,
  full_name varchar(300),
  email varchar(300),
  website varchar(300),
  country varchar(300),
  comment_suggest varchar(1200),
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);
