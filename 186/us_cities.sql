drop table if exists us_cities;

create table us_cities (
  id serial,
  name varchar(250),
  latitude float,
  longitude float,
  time_zone varchar(250),
  primary key (id)
);

insert into us_cities (name, latitude, longitude, time_zone)
    values ('Albany, N.Y.', '42.666666666666664', '-73.75', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Albuquerque, N.M.', '35.083333333333336', '-106.65', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Amarillo, Tex.', '35.18333333333333', '-101.83333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Anchorage, Alaska', '61.21666666666667', '-149.9', '8:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Atlanta, Ga.', '33.75', '-84.38333333333334', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Austin, Tex.', '30.266666666666666', '-97.73333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Baker, Ore.', '44.78333333333333', '-117.83333333333333', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Baltimore, Md.', '39.3', '-76.63333333333334', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Bangor, Maine', '44.8', '-68.78333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Birmingham, Ala.', '33.5', '-86.83333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Bismarck, N.D.', '46.8', '-100.78333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Boise, Idaho', '43.6', '-116.21666666666667', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Boston, Mass.', '42.35', '-71.08333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Buffalo, N.Y.', '42.916666666666664', '-78.83333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Carlsbad, N.M.', '32.43333333333333', '-104.25', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Charleston, S.C.', '32.78333333333333', '-79.93333333333334', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Charleston, W. Va.', '38.35', '-81.63333333333334', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Charlotte, N.C.', '35.233333333333334', '-80.83333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Cheyenne, Wyo.', '41.15', '-104.86666666666666', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Chicago, Ill.', '41.833333333333336', '-87.61666666666666', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Cincinnati, Ohio', '39.13333333333333', '-84.5', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Cleveland, Ohio', '41.46666666666667', '-81.61666666666666', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Columbia, S.C.', '34.0', '-81.03333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Columbus, Ohio', '40.0', '-83.01666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Dallas, Tex.', '32.766666666666666', '-96.76666666666667', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Denver, Colo.', '39.75', '-105.0', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Des Moines, Iowa', '41.583333333333336', '-93.61666666666666', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Detroit, Mich.', '42.333333333333336', '-83.05', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Dubuque, Iowa', '42.516666666666666', '-90.66666666666667', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Duluth, Minn.', '46.81666666666667', '-92.08333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Eastport, Maine', '44.9', '-67.0', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('El Centro, Calif.', '32.63333333333333', '-115.55', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('El Paso, Tex.', '31.766666666666666', '-106.48333333333333', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Eugene, Ore.', '44.05', '-123.08333333333333', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Fargo, N.D.', '46.86666666666667', '-96.8', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Flagstaff, Ariz.', '35.21666666666667', '-111.68333333333334', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Fort Worth, Tex.', '32.71666666666667', '-97.31666666666666', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Fresno, Calif.', '36.733333333333334', '-119.8', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Grand Junction, Colo.', '39.083333333333336', '-108.55', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Grand Rapids, Mich.', '42.96666666666667', '-85.66666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Havre, Mont.', '48.55', '-109.71666666666667', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Helena, Mont.', '46.583333333333336', '-112.03333333333333', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Honolulu, Hawaii', '21.3', '-157.83333333333334', '7:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Hot Springs, Ark.', '34.516666666666666', '-93.05', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Houston, Tex.', '29.75', '-95.35', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Idaho Falls, Idaho', '43.5', '-112.01666666666667', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Indianapolis, Ind.', '39.766666666666666', '-86.16666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Jackson, Miss.', '32.333333333333336', '-90.2', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Jacksonville, Fla.', '30.366666666666667', '-81.66666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Juneau, Alaska', '58.3', '-134.4', '8:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Kansas City, Mo.', '39.1', '-94.58333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Key West, Fla.', '24.55', '-81.8', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Klamath Falls, Ore.', '42.166666666666664', '-121.73333333333333', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Knoxville, Tenn.', '35.95', '-83.93333333333334', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Las Vegas, Nev.', '36.166666666666664', '-115.2', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Lewiston, Idaho', '46.4', '-117.03333333333333', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Lincoln, Neb.', '40.833333333333336', '-96.66666666666667', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Long Beach, Calif.', '33.766666666666666', '-118.18333333333334', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Los Angeles, Calif.', '34.05', '-118.25', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Louisville, Ky.', '38.25', '-85.76666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Manchester, N.H.', '43.0', '-71.5', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Memphis, Tenn.', '35.15', '-90.05', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Miami, Fla.', '25.766666666666666', '-80.2', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Milwaukee, Wis.', '43.03333333333333', '-87.91666666666667', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Minneapolis, Minn.', '44.983333333333334', '-93.23333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Mobile, Ala.', '30.7', '-88.05', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Montgomery, Ala.', '32.35', '-86.3', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Montpelier, Vt.', '44.25', '-72.53333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Nashville, Tenn.', '36.166666666666664', '-86.78333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Newark, N.J.', '40.733333333333334', '-74.16666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('New Haven, Conn.', '41.31666666666667', '-72.91666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('New Orleans, La.', '29.95', '-90.06666666666666', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('New York, N.Y.', '40.78333333333333', '-73.96666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Nome, Alaska', '64.41666666666667', '-165.5', '8:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Oakland, Calif.', '37.8', '-122.26666666666667', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Oklahoma City, Okla.', '35.43333333333333', '-97.46666666666667', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Omaha, Neb.', '41.25', '-95.93333333333334', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Philadelphia, Pa.', '39.95', '-75.16666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Phoenix, Ariz.', '33.483333333333334', '-112.06666666666666', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Pierre, S.D.', '44.36666666666667', '-100.35', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Pittsburgh, Pa.', '40.45', '-79.95', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Portland, Maine', '43.666666666666664', '-70.25', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Portland, Ore.', '45.516666666666666', '-122.68333333333334', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Providence, R.I.', '41.833333333333336', '-71.4', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Raleigh, N.C.', '35.766666666666666', '-78.65', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Reno, Nev.', '39.5', '-119.81666666666666', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Richfield, Utah', '38.766666666666666', '-112.08333333333333', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Richmond, Va.', '37.55', '-77.48333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Roanoke, Va.', '37.28333333333333', '-79.95', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Sacramento, Calif.', '38.583333333333336', '-121.5', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('St. Louis, Mo.', '38.583333333333336', '-90.2', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Salt Lake City, Utah', '40.766666666666666', '-111.9', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('San Antonio, Tex.', '29.383333333333333', '-98.55', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('San Diego, Calif.', '32.7', '-117.16666666666667', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('San Francisco, Calif.', '37.78333333333333', '-122.43333333333334', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('San Jose, Calif.', '37.333333333333336', '-121.88333333333334', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('San Juan, P.R.', '18.5', '-66.16666666666667', '1:00 p.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Santa Fe, N.M.', '35.68333333333333', '-105.95', '10:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Savannah, Ga.', '32.083333333333336', '-81.08333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Seattle, Wash.', '47.61666666666667', '-122.33333333333333', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Shreveport, La.', '32.46666666666667', '-93.7', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Sioux Falls, S.D.', '43.55', '-96.73333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Sitka, Alaska', '57.166666666666664', '-135.25', '8:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Spokane, Wash.', '47.666666666666664', '-117.43333333333334', '9:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Springfield, Ill.', '39.8', '-89.63333333333334', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Springfield, Mass.', '42.1', '-72.56666666666666', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Springfield, Mo.', '37.21666666666667', '-93.28333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Syracuse, N.Y.', '43.03333333333333', '-76.13333333333334', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Tampa, Fla.', '27.95', '-82.45', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Toledo, Ohio', '41.65', '-83.55', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Tulsa, Okla.', '36.15', '-95.98333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Virginia Beach, Va.', '36.85', '-75.96666666666667', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Washington, D.C.', '38.88333333333333', '-77.03333333333333', '12:00 noon');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Wichita, Kan.', '37.71666666666667', '-97.28333333333333', '11:00 a.m.');
insert into us_cities (name, latitude, longitude, time_zone)
    values ('Wilmington, N.C.', '34.233333333333334', '-77.95', '12:00 noon');
