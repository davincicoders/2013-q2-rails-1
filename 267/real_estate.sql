drop table if exists properties;

create table properties (
  id serial,
  address         varchar(250),
  city            varchar(250),
  state           varchar(2),
  price           varchar(12),
  num_bedrooms    integer,
  num_stories     integer,
  num_square_feet varchar(7),
  image_url       varchar(250),
  created_at      timestamp,
  updated_at      timestamp,
  primary key (id)
);

insert into properties
  (address, city, state, price, num_bedrooms, num_stories, num_square_feet,
    image_url,
    created_at, updated_at)
  values ('123 Easy St', 'Louisville', 'CO', '$1,775,000', 4, 2, '6,000',
    'http://farm1.staticflickr.com/55/139445633_e2fabef491.jpg',
    now(), now());

insert into properties
  (address, city, state, price, num_bedrooms, num_stories, num_square_feet,
    image_url,
    created_at, updated_at)
  values ('35 Oak Ln', 'Louisville', 'CO', '$333,000', 3, 2, '5,000',
    'http://farm1.staticflickr.com/104/292132478_05c200a320.jpg',
    now(), now());

insert into properties
  (address, city, state, price, num_bedrooms, num_stories, num_square_feet,
    image_url,
    created_at, updated_at)
  values ('254 Marigold Ct', 'Lafayette', 'CO', '$500,000', 3, 1, '7,000',
    'http://farm8.staticflickr.com/7047/6973026131_8e733ee374.jpg',
    now(), now());
