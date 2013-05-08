drop table if exists users;

create table users (
  id integer not null,
  username varchar(100),
  first_name varchar(100),
  middle_name varchar(100),
  last_name varchar(100),
  pass varchar(100),
  permissions varchar(100),
  profile_pic varchar(100),
  phys_addres varchar(40),
  city varchar(40),
  state varchar(40),
  zip varchar(8),
  posts_count integer not null,
  class varchar(10),
  primary key (id)
);

copy users (id,username,first_name,middle_name,last_name,pass,permissions,profile_pic,phys_addres,city,state,zip,posts_count,class) from stdin with csv;
1,Admin,Joshua,Michaiah,Langford,Example_pass,open,example.gif,410 E 78th Pl,Thornton,CO,80229,0,root
2,Grace,Grace,River,Yu,TBD_with_encryption,nil/V/V/V E M R/V E M R/V E M R/V E M R/V E M R/M R,my_profile.jpg,410 E 78th Pl,Thornton,CO,80229,0,moderator
3,JohnDoe,John,Henry,Doe,Broncos,nil/V/V/V/V M/V M/V M/M R,John_Pic.png,123 happy st,Arvada,CO,80003,0,user
\.

drop table if exists forums;

create table forums (
id integer not null,
name varchar(30),
about varchar(300),
primary key (id)
);

copy forums(id,name,about) from stdin with csv;
1,Crafting,A section for all things arts and crafts.  Talk about and share tips on crafts!
2,Patterns,A section solely for uploaded patterns.  Upload a pattern or reference a pattern!
3,Pattern making,Talk about how you make patterns and/or give tips to one another.
4,General discussion,A place to hang out and talk about whatever comes to mind.
5,Help, a place to come to get questions answered (about products featured or technical questions on Spirit of Art's website.)
\.

drop table if exists threads;

create table threads(
id integer not null,
tsubject varchar(50),
tcontext varchar(500),
ttime varchar(10),
tcreated_at varchar(30),
tmodified_at varchar(30),
primary key (id)
);

drop table if exists forums_threads;

create table forums_threads(
id integer not null,
forum_id integer not null,
thread_id integer not null,
primary key (id)
);


drop table if exists users_forums;

create table users_forums (
id integer not null,
user_id integer not null,
forum_id integer not null,
primary key (id)
);
