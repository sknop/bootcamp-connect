create user sven identified by songoan;
create user christoph identified by kakarot;
create user jorge identified by kakarot;
create user kirill identified by kakarot;
create user laurent identified by kakarot;
create user oscar identified by kakarot;
create user benedikt identified by kakarot;
create user damien identified by kakarot;
create user jakub identified by kakarot;
create user nacho identified by kakarot;


  GRANT CREATE TABLE TO sven;
  GRANT CREATE SESSION TO sven;

  GRANT UNLIMITED TABLESPACE TO sven;

  GRANT SELECT ON movielens.movies TO sven;
  GRANT SELECT ON movielens.movies_to_genres TO sven;
  GRANT SELECT ON movielens.tags TO sven;
  GRANT SELECT ON movielens.genres TO sven;


  GRANT CREATE TABLE TO christoph;
  GRANT CREATE SESSION TO christoph;

  GRANT UNLIMITED TABLESPACE TO christoph;

  GRANT SELECT ON movielens.movies TO christoph;
  GRANT SELECT ON movielens.movies_to_genres TO christoph;
  GRANT SELECT ON movielens.tags TO christoph;
  GRANT SELECT ON movielens.genres TO christoph;


  GRANT CREATE TABLE TO jorge;
  GRANT CREATE SESSION TO jorge;

  GRANT UNLIMITED TABLESPACE TO jorge;

  GRANT SELECT ON movielens.movies TO jorge;
  GRANT SELECT ON movielens.movies_to_genres TO jorge;
  GRANT SELECT ON movielens.tags TO jorge;
  GRANT SELECT ON movielens.genres TO jorge;


  GRANT CREATE TABLE TO kirill;
  GRANT CREATE SESSION TO kirill;

  GRANT UNLIMITED TABLESPACE TO kirill;

  GRANT SELECT ON movielens.movies TO kirill;
  GRANT SELECT ON movielens.movies_to_genres TO kirill;
  GRANT SELECT ON movielens.tags TO kirill;
  GRANT SELECT ON movielens.genres TO kirill;


  GRANT CREATE TABLE TO laurent;
  GRANT CREATE SESSION TO laurent;

  GRANT UNLIMITED TABLESPACE TO laurent;

  GRANT SELECT ON movielens.movies TO laurent;
  GRANT SELECT ON movielens.movies_to_genres TO laurent;
  GRANT SELECT ON movielens.tags TO laurent;
  GRANT SELECT ON movielens.genres TO laurent;

  GRANT CREATE TABLE TO oscar;
  GRANT CREATE SESSION TO oscar;

  GRANT UNLIMITED TABLESPACE TO oscar;

  GRANT SELECT ON movielens.movies TO oscar;
  GRANT SELECT ON movielens.movies_to_genres TO oscar;
  GRANT SELECT ON movielens.tags TO oscar;
  GRANT SELECT ON movielens.genres TO oscar;

  GRANT CREATE TABLE TO benedikt;
  GRANT CREATE SESSION TO benedikt;

  GRANT UNLIMITED TABLESPACE TO benedikt;

  GRANT SELECT ON movielens.movies TO benedikt;
  GRANT SELECT ON movielens.movies_to_genres TO benedikt;
  GRANT SELECT ON movielens.tags TO benedikt;
  GRANT SELECT ON movielens.genres TO benedikt;

  GRANT CREATE TABLE TO damien;
  GRANT CREATE SESSION TO damien;

  GRANT UNLIMITED TABLESPACE TO damien;

  GRANT SELECT ON movielens.movies TO damien;
  GRANT SELECT ON movielens.movies_to_genres TO damien;
  GRANT SELECT ON movielens.tags TO damien;
  GRANT SELECT ON movielens.genres TO damien;


  GRANT CREATE TABLE TO jakub;
  GRANT CREATE SESSION TO jakub;

  GRANT UNLIMITED TABLESPACE TO jakub;

  GRANT SELECT ON movielens.movies TO jakub;
  GRANT SELECT ON movielens.movies_to_genres TO jakub;
  GRANT SELECT ON movielens.tags TO jakub;
  GRANT SELECT ON movielens.genres TO jakub;

  GRANT CREATE TABLE TO nacho;
  GRANT CREATE SESSION TO nacho;

  GRANT UNLIMITED TABLESPACE TO nacho;

  GRANT SELECT ON movielens.movies TO nacho;
  GRANT SELECT ON movielens.movies_to_genres TO nacho;
  GRANT SELECT ON movielens.tags TO nacho;
  GRANT SELECT ON movielens.genres TO nacho;
