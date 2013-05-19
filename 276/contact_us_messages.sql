drop table if exists contact_us_messages;

create table contact_us_messages (
  id         serial,
  name       varchar(250),
  email      varchar(250),
  message    varchar(250),
  phone      varchar (250),
  created_at timestamp,
  updated_at timestamp,
  primary key (id)
);
