	drop table if exists g198_collectibles;

	create table g198_collectibles (
  id                integer not null,
  name              varchar(100) not null,
  description       varchar(100),
  g198_episode_id   integer not null,
  g198_category_id  integer not null,
  units_in_stock    integer not null,
  year_made         integer,
  year_acquired     integer,
  how_acquired      varchar(100) not null,
  amount_paid       varchar(100),
  condition         varchar(100) not null,
  condition_details varchar(200),
  primary key (id)
);

copy g198_collectibles (id,name,description,g198_episode_id,g198_category_id,units_in_stock,year_made,year_acquired,how_acquired,amount_paid,condition,condition_details) from stdin with csv;
1,Blockbuster Yoda,Life-size figure,1,3,1,1999,2000,Asked for it,0,Mint,Dusty but otherwise in mint condition! No box.  Available originally from Blockbuster stores as a prize in a drawing. This one was bought on eBay by my father as a gift.
2,Watto Cut-Out,Life Size stand-up cutout by Pepsi,1,4,1,1999,2000,Asked for it,0,Excellent,Back stand is slightly bent so that the figure does not stand quite straight.
3,Anikan Skywalker (Tatooine),with backpack and grease gun,1,1,1,1999,1999,Gift,6.99,Mint unopened,
4,Jar Jar Binks,with Gungan battle staff,1,1,1,1999,1999,Gift,6.99,Mint unopened,
5,Obi-Wan Kenobi (Jedi Duel),with Lightsaber,1,1,1,1999,1999,Gift,6.99,Mint unopened,
6,Queen Amadala (Naboo),with blaster pistols,1,1,1,1999,1999,Gift,6.99,Mint unopened,
7,Senator Palpatine,with Senate Cam Droid,1,1,1,1999,1999,Gift,6.99,Mint unopened,
8,Chewbacca,,4,1,1,1977,0,Bought retail,,Good,Paint worn off nose. Missing gun.
9,C3P0,,4,1,1,1977,0,Bought retail,,Fair,Somewhat scratched. Paint worn.
10,Greedo,,4,1,1,1978,0,Bought retail,,Good,Color worn off toe tips and elbows
11,Boussh,Leia disguised,6,1,1,1996,1996,Bought retail,,Excellent,missing gun
12,Luke Skywalker,"white shirt, muscles",4,1,1,1995,1995,Bought retail,,Good,bizarrely muscular
13,Mace Windu,with lightsaber and Jedi cloak,1,1,1,1998,1998,Bought retail,6.99,Mint unopened,
14,Boss Nass,with Gungan staff,1,1,1,1998,1998,Bought retail,6.99,Excellent,Card has some bends.
\.

drop table if exists g198_episodes;

create table g198_episodes (
  id                integer not null,
  name              varchar(100) not null,
  year              integer,
  primary key (id)
);

copy g198_episodes (id,name,year) from stdin with csv;
0,(Not in movies),
1,The Phantom Menace,1999
2,Attack of the Clones,2002
3,Revenge of the Sith,2005
4,A New Hope,1977
5,The Empire Strikes Back,1980
6,Return of the Jedi,1983
\.

drop table if exists g198_categories;

create table g198_categories (
  id                integer not null,
  name              varchar(100) not null,
  primary key (id)
);

copy g198_categories (id,name) from stdin with csv;
1,Action Figure
2,Play Set
3,Large store figure
4,Cardboard cutout
5,Book
6,Toy
7,Vehicle
\.
