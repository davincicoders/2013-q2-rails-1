drop table if exists bank_users;

create table bank_users (
    id               serial,
    first_name       varchar(250),
    username         varchar(250),
    password         varchar(250),
    primary key (id)
);

insert into bank_users (first_name, username, password)
  values ('Bob', 'Bob', 'Bob'); -- 1
insert into bank_users (first_name, username, password)
  values ('Suzy', 'Suzy', 'Suzy'); -- 2

drop table if exists bank_accounts;

create table bank_accounts (
    id               serial,
    bank_user_id     integer,
    account_type     varchar(250),
    current_balance  float,
    primary key (id)
);

insert into bank_accounts (bank_user_id, account_type, current_balance)
  values (1, 'Checking', '300.00');
insert into bank_accounts (bank_user_id, account_type, current_balance)
  values (1, 'Saving', '25.00');
insert into bank_accounts (bank_user_id, account_type, current_balance)
  values (1, 'VISA', '-384.00');
insert into bank_accounts (bank_user_id, account_type, current_balance)
  values (2, 'Checking', '750.00');
insert into bank_accounts (bank_user_id, account_type, current_balance)
  values (2, 'Saving', '15000.00');

