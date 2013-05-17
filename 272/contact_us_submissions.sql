drop table if exists contact_us_submissions;


create table contact_us_submissions (
id		       serial,
your_name    varchar(100),
email		     varchar(100),
web_site	   varchar(100),
country      varchar(100),
human_check  boolean,
comments     varchar(500),
primary key        (ID)

);

