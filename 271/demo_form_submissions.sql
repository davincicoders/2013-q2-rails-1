drop table if exists demo_form_submissions;

create table demo_form_submissions (
  id serial,
  first_name varchar(250),
  password   varchar(250),
  message    varchar(250),
  finished   boolean,
  gender     varchar(250),
  card_type  varchar(250),
  primary key (id)
);
