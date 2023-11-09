create table db_dsheth.RecordLabel (
  labelName varchar(20) primary key,
  countryCode char(3),
  revenue decimal(11,2)
);

create table db_dsheth.Artist (
  artistId integer primary key,
  artistName varchar(30),
  age integer,
  labelName varchar(20),
  foreign key (labelName) references db_dsheth.RecordLabel(labelName)
  on delete set NULL
  on update cascade
);

create table db_dsheth.Person (
  personId integer,
  firstname varchar(15),
  lastname varchar(20),
  totalPlays integer,
  balance decimal(7,2),
  primary key (personId)
);

create table db_dsheth.Song (
  artistId integer,
  songName varchar(20),
  duration integer,
  releaseDate datetime,
  cost decimal(4,2),
  primary key (artistId, songName),
  foreign key (artistId) references db_dsheth.Artist(artistId) 
  on delete cascade 
  on update cascade
);

create table db_dsheth.PlaySong (
  personId integer, 
  artistId integer, 
  songName varchar(20),
  playDate datetime,
  cost decimal(4,2),
  primary key (personId, artistId, songName, playDate),
  foreign key (personId) references db_dsheth.Person(personId) 
  on delete cascade 
  on update cascade,
  foreign key (artistId, songName) references db_dsheth.Song(artistId, songName) 
  on delete cascade 
  on update cascade
);

insert into db_dsheth.RecordLabel values ("Republic Records", "USA", '250456123.55');

insert into db_dsheth.RecordLabel values ("Island Records", "CDN", '100000000.00');

insert into db_dsheth.Artist values (1, "Ariana Grande", 25, "Republic Records");

insert into db_dsheth.Artist values (2, "Justin Bieber", 24, "Island Records");

insert into db_dsheth.Artist values (3, "Amy Grant", 48, "Island Records");

insert into db_dsheth.Person values (1, "Sarah", "Smith", 25, '254.00');

insert into db_dsheth.Person values (2, "Fred", "Funk", 62, '22.22');

insert into db_dsheth.Song values (1, 'No Tears Left to Cry', 206, '2018-04-20', '1.99');

insert into db_dsheth.Song values (2, 'Despacito', 227, '2017-01-12', '0.99');

insert into db_dsheth.PlaySong values (1, 1, 'No Tears Left to Cry', '2018-10-01 10:00:00', '1.99');

insert into db_dsheth.PlaySong values (1, 1, 'No Tears Left to Cry', '2018-10-01 10:13:30', '0.99');

insert into db_dsheth.PlaySong values (2, 2, 'Despacito', '2018-10-05 23:15:00', '0.79');

select * from db_dsheth.Person;

SET SQL_SAFE_UPDATES = 0;

update db_dsheth.Person 
set balance = balance + 50
where db_dsheth.Person.firstname = "Fred" and db_dsheth.Person.lastname = "Funk";

describe db_dsheth.PlaySong;

select * from db_dsheth.PlaySong;

update db_dsheth.PlaySong 
set playDate = DATE_ADD(playDate, INTERVAL 1 HOUR)
where personId = 1;

select * from db_dsheth.Artist;

delete from db_dsheth.Artist
where Artist.age > 30;

delete from db_dsheth.PlaySong
where artistId = (select artistId from db_dsheth.Artist where artistName = 'Justin Bieber');

select * from db_dsheth.PlaySong;