drop table if exists garden_plots;

create table garden_plots (
  id                serial,
  seed_type         varchar(250),
  planted_year      integer,
  planted_month     varchar(3),
  planted_day       integer,
  is_unused         boolean,
  created_at        timestamp,
  updated_at        timestamp,
  primary key (id)
);
