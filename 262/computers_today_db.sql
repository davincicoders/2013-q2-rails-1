drop table if exists g197_customers;

create table g197_customers (
  id                integer not null,
  prefix            varchar(100),
  first_name        varchar(100),
  middle_name       varchar(100),
  last_name         varchar(100),
  suffix            varchar(100),
  organization_name varchar(100),
  address           varchar(100),
  city              varchar(100),
  state             varchar(100),
  postal_code       varchar(100),
  country           varchar(100),
  phone             varchar(100),
  email             varchar(100),
  primary key (id)
);

copy g197_customers (id,prefix,first_name,middle_name,last_name,suffix,organization_name,address,city,state,postal_code,country,phone,email) from stdin with csv;
1,Mr,Clayton,,Pounders,,,33 West 40th Suite 42,West Chester,MO,77788,USA,615-555-2233,cpound@jegsworks.com
2,Sr,Hernando,,Cordilla,,,Memoria 4567,Caracas,,,Venezuela,0212 555 87 96,cordillah@viajesmundiales
3,Mrs,Miranda,,Greenfield,,,12904 West Palm Ave,Ft. Lauderdal,FL,35920,USA,,
4,Dr,Henry,F,Miller,,,89 Forrestdale St.,Alameda,CA,90124,USA,458-555-7820,docmiller@jegsworks.com
5,Mr,Simon,,Potter,Jr,,4582 Cedar Lane,Roswell,NM,48975,USA,231-555-7800,potterman@jegsworks.com
6,ms,Sylvia,G,Blintz,,Women's Club of Gardendal,112 First Ave. Apt23,Gardendale,AL,78452,USA,615-555-7863,sblintz@jegsworks.com
7,mrs,Melanie,C,Wong,,,3478 North Hills Dr.,San Diego,CA,45978,USA,231-555-6689,mellie@jegsworks.com
8,Mr,Adam,,Fitzgerald,,Fitzgerald & Associates,42 West Mesa Dr.,Phoenix,AZ,78954,USA,485-555-6678,fitzg@jegsworks.com
9,Sra,Maria,Lopez,Garcia,,,7890 Middlebrook Pike Suit,Nashville,TN,56789,USA,615-555-8820,mgarcia@jegsworks.com
10,Ms,Tokiko,,Tomara,,,890 Kyoto Road,Tokyo,,160-0023,Japan,03-5555-5250,
11,Mr,Nathan,,Mason,,West Hills High School,24 Piney Ridge Road,Murfreesboro,TN,37851,USA,423-555-7891,nmason@jegsworks.com
12,Lt,Gerald,,Mason,,US Army,"CMR 345, Box 12334`",APO AE,,9250,USA,,masongerald@jegsworks.com
13,Sra,Michelle,,Rodrigez,,,Avenida Juarez 897,Mexico City,,11560,Mexico,52-5-555-5195,micheller@viajesmundiales
14,Dr,Constance,M,Flannery,,,Hamburgo 7084 Col Juarez,Mexico City,,6600,Mexico,52-5-555-6200,flannery@viajesmundiales.
15,Judge,Glenn,N,Grissom,,,23 Central Ave. Suite 112,Birmingham,AL,35498,USA,205-555-4464,dajudge@jegsworks.com
16,Mr,Howard,W,Pritchard,,,"46 Delores Place, Apt 14",Birmingham,AL,35188,USA,205-555-3312,glenngris@jegsworks.com
17,Mr,Akeda,L,Obama,,,14 Westchester Dr.,Alameda,CA,90213,USA,458-555-4498,obama@jegsworks.com
18,Sr,Hector,,Juarez,,,Centro 13,Buenos Aires,,1426,Argentina,+54 911 5555-4989,hjuarez@jegsworks.com
19,Sr,Jose,,Alverez,,,Echeverria 15300,Buenos Aires,,1426,Argentina,+54 11 5555-7763,jose.alverez@jegsworks.co
20,Sra,Juanita,,Mejia,,,Franklin 1254,Buenos Aires,,1425,Argentina,+54 11 5555-0023,j.mejia@jegsworks.com
\.

drop table if exists g197_order_items;

create table g197_order_items (
  id                  integer not null,
  g197_order_id       integer not null,
  g197_product_id     integer not null,
  subscription_length integer not null,
  primary key (id)
);

copy g197_order_items (id,g197_order_id,g197_product_id,subscription_length) from stdin with csv;
1,1,1,2
2,2,3,5
3,3,1,1
4,3,2,1
5,4,1,2
6,4,4,2
7,5,2,1
8,6,3,1
9,6,2,1
10,7,1,2
11,7,3,2
12,7,2,2
13,8,1,1
14,8,4,1
15,9,3,5
16,10,1,1
17,10,4,1
18,11,1,1
19,12,1,5
20,13,3,1
21,14,4,1
22,14,1,2
23,14,2,2
24,15,1,1
25,16,2,1
26,17,1,1
27,17,2,1
28,18,3,5
29,18,1,5
30,19,2,1
31,20,4,1
\.

drop table if exists g197_orders;

create table g197_orders (
  id                  integer not null,
  g197_customer_id    integer not null,
  g197_sales_rep_id   integer not null,
  date_received       date not null,
  payment_method      varchar(100) not null,
  primary key (id)
);

copy g197_orders (id,g197_customer_id,g197_sales_rep_id,date_received,payment_method) from stdin with csv;
1,2,3,11/27/2006,MC
2,1,1,10/25/2006,Visa
3,3,3,11/28/2006,Visa
4,3,3,11/28/2006,Visa
5,4,2,12/16/2006,check
6,5,2,12/16/2006,MC
7,6,1,12/20/2006,MC
8,7,4,12/21/2006,check
9,8,4,12/22/2006,money order
10,9,1,12/23/2006,Visa
11,10,2,12/28/2006,check
12,11,1,01/03/2007,MC
13,12,2,01/04/2007,check
14,13,4,01/05/2007,Visa
15,14,4,01/06/2007,MC
16,15,2,01/08/2007,MC
17,16,1,01/08/2007,check
18,17,1,01/08/2007,Visa
19,18,2,01/08/2007,money order
20,19,1,01/10/2007,Visa
21,20,3,01/11/2007,Visa
\.

drop table if exists g197_products;

create table g197_products (
  id                  integer not null,
  name                varchar(100) not null,
  description         varchar(100) not null,
  issued              varchar(100) not null,
  price_per_year      float not null,
  primary key (id)
);

copy g197_products (id,name,description,issued,price_per_year) from stdin with csv;
1,Computers Today,newsletter,month,24.95
2,PCs in Education,newsletter,quarter,15.95
3,News for Techies,email newsletter,week,20
4,News for Newbies,magazine,month,24.95
\.

drop table if exists g197_sales_reps;

create table g197_sales_reps (
  id               integer not null,
  prefix           varchar(100) not null,
  first_name       varchar(100) not null,
  middle_name      varchar(100) not null,
  last_name        varchar(100) not null,
  commission_rate  integer not null,
  primary key (id)
);

copy g197_sales_reps (id,prefix,first_name,middle_name,last_name,commission_rate) from stdin with csv;
1,Ms,Sheila,Sharon,Simmons,10
2,Mr,George,Frederick,Yodl,10
3,Sra,Victoria,Sanchez,Garcia,10
4,Mr,Julius,Abraham,Freedman,8
\.
