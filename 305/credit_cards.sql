drop table if exists credit_cards;

create table credit_cards (
  id                  serial,
  card_type           varchar(250),
  number              varchar(250),
  expiration_month    varchar(2),
  expiration_year     varchar(4),
  verification_number varchar(250),
  created_at          timestamp,
  updated_at          timestamp,
  primary key (id)
);
