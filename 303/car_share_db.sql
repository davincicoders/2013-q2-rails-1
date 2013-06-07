drop table if exists cars;

create table cars (
    id                  integer not null,
    color               varchar(250) not null,
    model               varchar(250) not null,
    car_share_member_id integer,
    primary key (id)
);

insert into cars (id, color, model, car_share_member_id) values (1, 'red', 'VW Golf', null);
insert into cars (id, color, model, car_share_member_id) values (2, 'black', 'VW Jetta', 2);
insert into cars (id, color, model, car_share_member_id) values (3, 'white', 'Toyota Celica', null);

drop table if exists car_share_members;

create table car_share_members (
    id               serial,
    first_name       varchar(250) not null,
    username         varchar(250) not null,
    password_digest  varchar(250) not null,
    primary key (id)
);

insert into car_share_members (first_name, username, password_digest)
  values ('Jen', 'Jen',
  '$2a$10$a4wQUbztQI9QIjgKaSBFcOiW.qVyTAD4aybmlRbXlgd9E3er5I/6.');
insert into car_share_members (first_name, username, password_digest)
  values ('Ted', 'Ted',
  '$2a$10$awwXyeevdXJdmxU6zzrFCOJwB/AZJkszAHx2EgmxXGgx8UDX1Y0T2');
