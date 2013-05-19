drop table if exists contact_us_comments;

create table contact_us_comments (
  id         serial,
  name       varchar(250),
  email      varchar(250),
  web_site   varchar(250),
  country    varchar(250),
  comments   varchar(250),
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);
