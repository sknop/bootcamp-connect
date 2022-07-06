create user sven identified by "sven-secret";
create user dennis identified by "dennis-secret";
create user alberto identified by "alberto-secret";
create user marcel identified by "marcelo-secret";
create user nakul identified by "nakul-secret";
create user peter identified by "peter-secret";
create user ray identified by "ray-secret";
create user rohit identified by "rohi-secret";
create user victor identified by "victor-secret";
create user amy identified by "amy-secret";


  GRANT CREATE TABLE TO sven;
  GRANT CREATE SESSION TO sven;

  GRANT UNLIMITED TABLESPACE TO sven;

  GRANT SELECT ON movielens.movies TO sven;
  GRANT SELECT ON movielens.movies_to_genres TO sven;
  GRANT SELECT ON movielens.tags TO sven;
  GRANT SELECT ON movielens.genres TO sven;


  GRANT CREATE TABLE TO dennis;
  GRANT CREATE SESSION TO dennis;

  GRANT UNLIMITED TABLESPACE TO dennis;

  GRANT SELECT ON movielens.movies TO dennis;
  GRANT SELECT ON movielens.movies_to_genres TO dennis;
  GRANT SELECT ON movielens.tags TO dennis;
  GRANT SELECT ON movielens.genres TO dennis;


  GRANT CREATE TABLE TO alberto;
  GRANT CREATE SESSION TO alberto;

  GRANT UNLIMITED TABLESPACE TO alberto;

  GRANT SELECT ON movielens.movies TO alberto;
  GRANT SELECT ON movielens.movies_to_genres TO alberto;
  GRANT SELECT ON movielens.tags TO alberto;
  GRANT SELECT ON movielens.genres TO alberto;


  GRANT CREATE TABLE TO marcel;
  GRANT CREATE SESSION TO marcel;

  GRANT UNLIMITED TABLESPACE TO marcel;

  GRANT SELECT ON movielens.movies TO marcel;
  GRANT SELECT ON movielens.movies_to_genres TO marcel;
  GRANT SELECT ON movielens.tags TO marcel;
  GRANT SELECT ON movielens.genres TO marcel;


  GRANT CREATE TABLE TO nakul;
  GRANT CREATE SESSION TO nakul;

  GRANT UNLIMITED TABLESPACE TO nakul;

  GRANT SELECT ON movielens.movies TO nakul;
  GRANT SELECT ON movielens.movies_to_genres TO nakul;
  GRANT SELECT ON movielens.tags TO nakul;
  GRANT SELECT ON movielens.genres TO nakul;

  GRANT CREATE TABLE TO peter;
  GRANT CREATE SESSION TO peter;

  GRANT UNLIMITED TABLESPACE TO peter;

  GRANT SELECT ON movielens.movies TO peter;
  GRANT SELECT ON movielens.movies_to_genres TO peter;
  GRANT SELECT ON movielens.tags TO peter;
  GRANT SELECT ON movielens.genres TO peter;

  GRANT CREATE TABLE TO ray;
  GRANT CREATE SESSION TO ray;

  GRANT UNLIMITED TABLESPACE TO ray;

  GRANT SELECT ON movielens.movies TO ray;
  GRANT SELECT ON movielens.movies_to_genres TO ray;
  GRANT SELECT ON movielens.tags TO ray;
  GRANT SELECT ON movielens.genres TO ray;

  GRANT CREATE TABLE TO rohit;
  GRANT CREATE SESSION TO rohit;

  GRANT UNLIMITED TABLESPACE TO rohit;

  GRANT SELECT ON movielens.movies TO rohit;
  GRANT SELECT ON movielens.movies_to_genres TO rohit;
  GRANT SELECT ON movielens.tags TO rohit;
  GRANT SELECT ON movielens.genres TO rohit;


  GRANT CREATE TABLE TO victor;
  GRANT CREATE SESSION TO victor;

  GRANT UNLIMITED TABLESPACE TO victor;

  GRANT SELECT ON movielens.movies TO victor;
  GRANT SELECT ON movielens.movies_to_genres TO victor;
  GRANT SELECT ON movielens.tags TO victor;
  GRANT SELECT ON movielens.genres TO victor;

GRANT CREATE TABLE TO amy;
GRANT CREATE SESSION TO amy;

GRANT UNLIMITED TABLESPACE TO amy;

GRANT SELECT ON movielens.movies TO amy;
GRANT SELECT ON movielens.movies_to_genres TO amy;
GRANT SELECT ON movielens.tags TO amy;
GRANT SELECT ON movielens.genres TO amy;
