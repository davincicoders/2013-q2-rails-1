drop table if exists b_cycle_stations;

create table b_cycle_stations (
  id              serial,
  station_name    varchar(100) not null,
  station_address varchar(100) not null,
  property_type   varchar(100) not null,
  num_docks       integer not null,
  power_type      varchar(100) not null,
  address_id      integer not null,
  address_line1   varchar(100) not null,
  address_line2   varchar(100),
  city            varchar(100) not null,
  state           varchar(100) not null,
  zip             varchar(100) not null,
  status          varchar(100) not null,
  globalid        varchar(100) not null,
  primary key (id)
);

copy b_cycle_stations (station_name,station_address,property_type,num_docks,power_type,address_id,address_line1,address_line2,city,state,zip,status,globalid) from stdin with csv;
9th and Logan,"899 Logan St, Denver, CO 80203",Multiple Owners,15,Wired Only,68252,899 Logan St,,Denver,CO,80203,Planned,{C2DDF5AF-3948-4E69-89D5-9172B9F85EF0}
13th and Marion,"1279 Marion St, Denver, CO 80218",Public,15,Solar Only,353104,1279 Marion St,,Denver,CO,80218,Planned,{7251850B-D3FB-4660-A643-32E26166E278}
13th and Speer,"1301 Speer Blvd, Denver, CO 80204",Public,17,Solar Only,221851,1301 Speer Blvd,,Denver,CO,80204,Planned,{78CAF86B-63E6-4FFD-BDFB-428C3C0835B2}
14th and Ogden,"1425 Ogden St, Denver, CO 80218",Public,13,Solar Only,0,1425 Ogden St,,Denver,CO,80218,Planned,{27DB434A-22E5-404C-93AE-9C8DE1E8A1DC}
15th and Curtis,"1501 Curtis St, Denver, CO 80202",Public,15,Solar Only,0,1501 Curtis St,,Denver,CO,80202,Planned,{9F279AD6-3615-41D2-B68D-7500C398E11B}
1551 Lafayette,"1551 Lafayette St, Denver, CO 80218",Public,17,Solar Only,0,1551 Lafayette St,,Denver,CO,80218,Planned,{7CD4470B-347A-4D07-85AF-AFFD9682E512}
17th and Franklin,"1695 Franklin St, Denver, CO 80218",Public,14,Solar Only,0,1695 Franklin St,,Denver,CO,80218,Planned,{7C94F131-33E9-468B-A390-F46DEDEB1C69}
18th and Arapahoe,"1800 Arapahoe St, Denver, CO 80202",Private,18,Wired Only,352782,1800 Arapahoe St,,Denver,CO,80202,Planned,{F2ADA4CA-864C-460F-BADC-5479719BF302}
23rd and Clay,"2301 Clay St, Denver, CO 80211",Public,13,Solar Only,52393,2301 Clay St,,Denver,CO,80211,Planned,{BD94474E-B3CA-4111-9DA6-251D9EBC19B7}
32nd and Clay,"3199 Clay St, Denver, CO 80211",Private,18,Solar Only,0,3199 Clay St,,Denver,CO,80211,Planned,{FF4F2663-B12F-4E95-8221-B53BF7BCB6A2}
32nd and Julian,"3199 Julian St, Denver, CO 80211",Public,23,Solar Only,0,3199 Julian St,,Denver,CO,80211,Planned,{000330F4-473A-4500-A4CB-6294E1AD36A7}
Colfax and Garfield,"1535 Garfield St, Denver, CO 80206",Public,17,Solar Only,0,1535 Garfield St,,Denver,CO,80206,Planned,{A5A309FD-186E-4799-85C2-9840B288E414}
Union Station Light Rail at 17th St.,"2050 17th St, Denver CO 80202",RTD,17,Wired Only,270493,2050 17th St,,Denver,CO,80202,Planned,{3E55B729-C011-4C3A-B4BF-BCDC0B3D0F76}
17th St and Tejon,"2701 17th St, Denver, CO 80211",Public,17,Solar Only,0,2701 17th St,,Denver,CO,80211,Planned,{AFD61743-15E9-4170-A4C8-1311169075B6}
1st and Broadway,"10 W 1st Ave, Denver, CO  80223",Private,22,Solar Only,350580,10 W 1st Ave,,Denver,CO,80223,Planned,{AF43B068-7C9D-4E3B-A0B2-DA2A7FE8F027}
Colfax and Steele,"1509 Steele St, Denver, CO 80206",Public,22,Solar Only,0,1509 Steele St,,Denver,CO,80206,Planned,{D7FB0973-F897-48D0-AF9F-558D236DE532}
Colfax and Gaylord,"1490 Gaylord St, Denver, CO 80206",Public,15,Solar Only,0,1490 Gaylord St,,Denver,CO,80206,Planned,{618C3277-23B5-4124-9F3C-A944493F0E86}
Bayaud and Pennsylvania,"525 E Bayaud Ave, Denver, CO 80209",Public,11,Solar Only,0,525 E Bayaud Ave,,Denver,CO,80209,Planned,{B0622C68-C4D1-44DF-B2FB-314CFAD06D21}
Colfax and Columbine,"2451 E Colfax Ave, Denver CO 80206",0,15,Solar Only,0,2451 E Colfax Ave,,Denver,CO,80206,Planned,{AEE1FF72-D6B7-474E-A3F7-DEEBC732E7F2}
6th and Clarkson,"771 E 6th Ave, Denver, CO 80203",Public,17,Solar Only,0,771 E 6th Ave,,Denver,CO,80203,Planned,{6EA5A9E4-7713-4331-BA68-0B7F7B96B9C4}
12th and Columbine,"2502 E 12th Ave, Denver, CO 80206",Public,13,Solar Only,0,2502 E 12th Ave,,Denver,CO,80206,Planned,{5A1029BF-0E89-4288-B6D8-577C692A1AEC}
20th and Chestnut,"2095 Chestnut Pl, Denver, CO 80202",Public,15,Solar Only,0,2095 Chestnut Pl,,Denver,CO,80202,Planned,{FFF0A7A3-42B2-4AAB-993B-0D0BADAE1458}
33rd and Zuni,"2402 W 33rd Ave, Denver, CO 80211",Public,17,Solar Only,0,2402 W 33rd Ave,,Denver,CO,80211,Planned,{CB35FCEB-6AF4-4A47-8EAA-32BA58CBE86D}
Bayaud and Emerson,"910 E Bayaud Ave, Denver, CO 80209",Public,19,Solar Only,0,910 E Bayaud Ave,,Denver,CO,80209,Planned,{4B5AD285-1406-48AF-AA66-7278400D9E04}
17th and Race,"2001 E 17th Ave, Denver, CO 80206",Public,15,Wired Only,260560,2001 E 17th Ave,,Denver,CO,80206,Planned,{F6ADF1BF-B518-4F01-84ED-AB1BA112ED55}
17th and Downing,"1100 E 17th Ave, Denver, CO 80218",Public,15,Solar Only,189441,1100 E 17th Ave,,Denver,CO,80218,Planned,{80E64CAF-0E6B-4289-9329-ACB3D452F923}
17th and Pearl,"523 E 17th Ave, Denver, CO 80203",Multiple Owners,17,Solar Only,55524,523 E 17th Ave,,Denver,CO,80203,Planned,{473F6F45-4A64-48D6-BF93-341D7E8F51E9}
11th and Emerson,"900 E 11th Ave, Denver, CO 80218",Public,11,Solar Only,65713,900 E 11th Ave,,Denver,CO,80218,Existing,{37E7CB00-AA2B-40E8-BDA1-7819A2D747E1}
12th and Sherman,"1220 Sherman St, Denver, CO 80203",Private,13,Wired Only,0,1220 Sherman St,,Denver,CO,80203,Existing,{88E6AA80-DC1C-41DC-993E-8100C8CA8C8C}
1450 Wazee,"1450 Wazee St, Denver CO 80202",Public,11,Wired Only,0,1450 Wazee St,,Denver,CO,80202,Existing,{7392EB31-0F45-4CCD-B205-DCA164454455}
15th and Cleveland,"101 W Colfax Ave, Denver, CO 80202",Private,11,Wired Only,181604,101 W Colfax Ave,,Denver,CO,80202,Existing,{384B51EB-6DF8-4CD0-865C-82D0FDC9BE31}
15th and Delgany,"1515 Delgany St, Denver CO 80202",Public,7,Wired Only,231957,1515 Delgany St,,Denver,CO,80202,Existing,{32EF7782-7968-4486-81C9-2BACE6AE0AD1}
1550 Glenarm,"1550 Glenarm Pl, Denver, CO 80202",Public,13,Wired Only,0,1550 Glenarm Pl,,Denver,CO,80202,Existing,{4E1F82E0-271E-4C58-8C03-D330ECA10A4C}
16th and Boulder,"1615 Boulder St, Denver CO 80211",Public,15,Solar Only,45048,1615 Boulder St,,Denver,CO,80211,Existing,{304E79DC-4C58-4BA0-A16F-B38A27299BAD}
16th and Broadway,"1600 Broadway, Denver CO 80202",Private,11,Wired Only,55719,1600 Broadway,,Denver,CO,80202,Existing,{45034894-DDA5-498C-984B-459E8052E4EE}
16th and Little Raven,"1600 Little Raven, Denver, CO 80202",Parks and Rec,13,Solar Only,0,1600 Little Raven,,Denver,CO,80202,Existing,{2CDA8857-6935-4CB3-9B90-724EC8FED1BC}
16th and Platte,"1601 Platte St, Denver CO 80202",Public,19,Solar Only,450477,1601 Platte St,,Denver,CO,80202,Existing,{3498622A-ACE2-4432-BAF4-009645D5377F}
16th and Sherman,"1625 Sherman St, Denver, CO 80203",Public,13,Solar Only,0,1625 Sherman St,,Denver,CO,80203,Existing,{DA6806E4-85E7-4EF3-8053-38EF47EB2845}
17th and Blake,"1509 17th St, Denver, CO 80202",Public,19,Solar Only,0,1509 17th St,,Denver,CO,80202,Existing,{483B3DD1-9790-45DA-BC9A-DD9DAF11AB89}
17th and Curtis,"950 17th St, Denver CO 80202",Private,19,Wired Only,55167,950 17th St,,Denver,CO,80202,Existing,{1F4FF118-2C42-4BDB-B0B3-310D6C470E54}
17th and Larimer,"1281 17th St, Denver, CO 80202",Private,15,Wired Only,0,1281 17th St,,Denver,CO,80202,Existing,{A0803BDA-7D32-488F-9925-621D7B700CB7}
18th and California,"1799 California St, Denver, CO 80202",Public,11,Wired Only,0,1799 California St,,Denver,CO,80202,Existing,{146F6D71-BF39-4C8C-B1E3-DD5CB031466E}
19th and Market,"1899 Market St, Denver CO 80202",Public,15,Solar Only,388103,1899 Market St,,Denver,CO,80202,Existing,{3D14EA7A-2AEF-4DC1-98F1-5536444B493D}
19th and Pearl,"620 E 19th Ave, Denver, CO 80203",Private,23,Wired Only,0,620 E 19th Ave,,Denver,CO,80203,Existing,{1BCB270C-A2DD-4E09-A956-9891233B8DE6}
19th and Wynkoop,"1900 Wynkoop St, Denver, CO 80202",Private,11,Solar Only,0,1900 Wynkoop St,,Denver,CO,80202,Existing,{4A723A5F-8AB4-42B9-9493-206490F17461}
2045 Franklin,"2045 Franklin St, Denver, CO 80205",Public,13,Wired Only,57320,2045 Franklin St,,Denver,CO,80205,Existing,{D710EAB5-1753-4AF6-B76C-31CB52BE09E4}
1350 Larimer,"1350 Larimer St, Denver CO 80202",Parks and Rec,15,Solar w/Wire Back-up,0,1350 Larimer St,,Denver,CO,80202,Existing,{44EDC663-FBA4-4731-84F9-542943720E5F}
14th and Champa,"700 14th St, Denver CO 80202",Private,23,Wired Only,54218,700 14th St,,Denver,CO,80202,Existing,{10B414CC-78DF-430A-B13A-C75AB9584C8A}
14th and Elati,"400 W 14th Ave, Denver CO 80204",Private,11,Solar Only,390118,400 W 14th Ave,,Denver,CO,80204,Existing,{E4F2FC1D-FAFD-49B2-9663-8C0A828D96F4}
22nd and Market,"2200 Market St, Denver CO 80205",Public,13,Wired Only,43418,2200 Market St,,Denver,CO,80205,Existing,{24BC175A-4EEB-4679-B530-D0186474977E}
22nd and Pennsylvania,"301 22nd St, Denver, CO 80205",Private,15,Solar w/Wire Back-up,0,301 22nd St,,Denver,CO,80205,Existing,{9E8F0911-DE43-498B-A35E-97FF54A60D40}
25th and Lawrence,"2500 Lawrence St, Denver, CO 80205",Private,9,Solar w/Wire Back-up,378978,2500 Lawrence St,,Denver,CO,80205,Existing,{CBE01E8F-5A7B-4ACD-A984-083E8B1B83A6}
14th and Welton,"890 14th St, Denver, CO 80202",Private,19,Wired Only,271000,890 14th St,,Denver,CO,80202,Existing,{81D01B61-ED58-4785-994E-3C8A706F6BB5}
28th and Larimer,"2751 Larimer St, Denver, CO 80206",Private,9,Wired Only,43178,2751 Larimer St,,Denver,CO,80206,Existing,{97A50BC9-9863-44D6-9ABD-F79B1E5AF6A6}
Broadway and Walnut,"2490 N Broadway St, Denver CO 80205",Public,13,Solar Only,0,2490 N Broadway,,Denver,CO,80205,Existing,{58F342EF-B2B3-40C7-A0AD-DFCD03A0E527}
Buchtel and High Light Rail,"1901 Buchtel Blvd, Denver CO 80210",RTD,19,Solar Only,173983,1901 Buchtel Blvd,,Denver,CO,80210,Existing,{40E688A5-5D94-491A-A250-6D756EECD0AB}
250 Columbine,"234 Columbine St, Denver, CO 80206",Private,11,Wired Only,84917,234 Columbine St,,Denver,CO,80206,Existing,{2C0C9488-1309-4F92-80DF-534125B9C837}
3rd and Milwaukee,"299 Milwaukee St, Denver, CO 80206",Private,15,Wired Only,180776,299 Milwaukee St,,Denver,CO,80206,Existing,{43867028-B8D7-4E14-9FAC-D753C421742F}
4th and Walnut,"398 Walnut St, Denver, CO 80204",Private,9,Wired Only,0,398 Walnut St,,Denver,CO,80204,Existing,{1C80C413-122A-48E4-8E58-9097B8734C90}
7th and Grant,"721 Grant St, Denver, CO 80203",Public,15,Solar Only,0,721 Grant St,,Denver,CO,80203,Existing,{C6F59672-2A7C-437B-BC5A-2E3433958827}
9th and Downing,"920 Downing St, Denver, CO 80218",Public,11,Solar Only,0,920 Downing St,,Denver,CO,80218,Existing,{E50F20E3-73E1-432A-90BC-2B6DDEE43CDE}
9th and Santa Fe,"923 W 9th Ave, Denver, CO 80204",Public,15,Solar Only,69269,923 W 9th Ave,,Denver,CO,80204,Existing,{6A0FB3B9-15BF-43A1-A634-131C4FD4E5F0}
10th and Osage,"1005 Osage St, Denver, CO 80204",Public,15,Solar Only,0,1005 Osage St,,Denver,CO,80204,Existing,{B9A5866C-B8A1-42F2-8193-9E677DD9CF04}
11th and Broadway,"1085 Broadway, Denver CO 80204",Private,11,Wired Only,67892,1085 Broadway,,Denver,CO,80204,Existing,{B5FD14D9-D697-4808-A53F-7CF136FBBE0B}
Cherry Creek Mall,"2800 E 1st Ave, Denver, CO 80206",Parks and Rec,15,Solar Only,0,2800 E 1st Ave,,Denver,CO,80206,Existing,{739E0022-0FC0-4EBA-91B5-2CFE58CC0FE4}
Denver Botanic Gardens,"1151 York St, Denver, CO 80206",Parks and Rec,19,Wired Only,65003,1151 York St,,Denver,CO,80206,Existing,{3A60D0BC-1960-49DA-A907-056525DBC165}
Denver Health,"777 Bannock St, Denver, CO 80204",Private,11,Wired Only,67719,777 Bannock St,,Denver,CO,80204,Existing,{5E973236-35B2-40FB-8BD8-A628A3FB2EAB}
Denver Museum of Nature and Science,"2001 Colorado Blvd,  Denver, CO 80205",Parks and Rec,21,Solar Only,222144,2001 Colorado Blvd,,Denver,CO,80205,Existing,{C3193205-1130-4E63-B255-8F4C8B29F516}
Denver Public Library,"100 W 13th Ave, Denver CO 80204",Private,19,Wired Only,166850,100 W 13th Ave,,Denver,CO,80204,Existing,{0E452ADE-C8C1-4D3B-AA6B-622BEC041CF3}
Denver Zoo,"2300 Steele St, Denver, CO 80205",Parks and Rec,22,Solar Only,0,2300 Steele St,,Denver,CO,80205,Existing,{05D5EC29-72D9-43CC-B702-47BE233B6D52}
DU Driscoll Center,"2000 E Asbury Ave, Denver CO",Private,15,Solar w/Wire Back-up,176621,2000 E Asbury Ave,,Denver,CO,80210,Existing,{A0E3FDF8-2842-4841-9277-A6197D2CEA4C}
Ellsworth and Madison,"10 S Madison St, Denver, CO 80209",Private,11,Wired Only,171814,10 S Madison St,,Denver,CO,80209,Existing,{F40D8299-8CF4-481F-AECC-24863799C3AD}
Five Points,"2700 Welton St, Denver, CO 80205",Private,7,Wired Only,0,2700 Welton St,,Denver,CO,80205,Existing,{240707F2-B785-428D-9F3B-4F097A279FA9}
Florida and S Pearl,"650 E Florida Ave., Denver CO 80210",Public,9,Wired Only,0,650 E Florida Ave,,Denver,CO,80210,Existing,{2F9E26F0-3FD6-4C11-8FEF-347D00D69B71}
Louisiana and Franklin,"1600 E Louisiana Ave, Denver, CO 80210",Private,18,Solar Only,0,1600 E Louisiana Ave,,Denver,CO,80210,Existing,{BD26352D-6415-4B5C-9917-4BA1EFB4CB69}
Louisiana Pearl Light Rail,"1300 S Washington St, Denver CO 80210",RTD,15,Solar Only,0,1300 S Washington St,,Denver,CO,80210,Existing,{3467F204-A68B-4DBC-A9D3-4018A2DB5BD7}
Market Street Station,"1600 Market Street, Denver CO 80202",RTD,21,Wired Only,0,1600 Market St,,Denver,CO,80202,Existing,{C5880E95-5AE0-4CE8-A96E-0DAEE6464744}
Park Ave West and Tremont,"355 Park Ave W, Denver CO 80205",Private,15,Solar w/Wire Back-up,0,355 Park Ave W,,Denver,CO,80205,Existing,{CAB1EB74-C1C2-4DCB-9F87-9DC26E11629A}
Pepsi Center,"1000 Chopper Cir, Denver, CO 80204",Private,17,Solar w/Wire Back-up,170593,1000 Chopper Cir,,Denver,CO,80204,Existing,{AA57F443-5E27-4AF2-809C-C34EDFE6193D}
REI,"1416 Platte St, Denver, CO 80202",Private,19,Solar w/Wire Back-up,54126,1416 Platte St,,Denver,CO,80202,Existing,{47AD0394-D9FB-41B0-AE6E-2EF47CDD71EC}
Webb Building,"201 W Colfax Ave, Denver CO 80202",Private,11,Wired Only,168091,201 W Colfax Ave,,Denver,CO,80202,Existing,{E3E8017F-CD45-4016-83F4-23289E5659A9}
9th and Curtis,"899 Curtis St, Denver, CO 80204",Private,17,Solar Only,0,899 Curtis St,,Denver,CO,80204,Existing,{9F155789-BD39-4E46-874A-F9ACA350DAD1}
13th and Pearl,"1291 Pearl St, Denver CO 80203",Private,13,Wired Only,66900,1291 Pearl St,,Denver,CO,80203,Existing,{7E1405E5-9997-4AAF-A879-466179A20EA7}
\.
