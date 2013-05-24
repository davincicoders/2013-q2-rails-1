drop table if exists fruits;

create table fruits (
    id               serial,
    name             varchar(250),
    image_filename   varchar(250),
    usd_per_lb       float,
    created_at       timestamp,
    updated_at       timestamp,
    primary key (id)
);

insert into fruits (name, image_filename, usd_per_lb, created_at, updated_at)
  values ('apple', 'apple.png', 1.49, now(), now());
insert into fruits (name, image_filename, usd_per_lb, created_at, updated_at)
  values ('orange', 'orange.png', 2.49, now(), now());
insert into fruits (name, image_filename, usd_per_lb, created_at, updated_at)
  values ('lemon', 'lemon.png', 1.66, now(), now());
insert into fruits (name, image_filename, usd_per_lb, created_at, updated_at)
  values ('kiwi', 'kiwi.png', 1.59, now(), now());
