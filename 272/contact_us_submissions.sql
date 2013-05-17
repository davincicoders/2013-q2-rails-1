drop table if exists contact_us_submissions;

create table contact_us_submissions (
id          serial,
name        varchar(250),
email       varchar(250),
web_site    varchar(250),
country     varchar(250),
primary key (id),
);
