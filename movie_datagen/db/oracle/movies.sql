CREATE USER movielens IDENTIFIED BY movielens;

---

GRANT CREATE TABLE TO movielens;
GRANT CREATE SESSION TO movielens;

GRANT UNLIMITED TABLESPACE TO movielens;

GRANT SELECT ON movielens.movies TO admin;
GRANT SELECT ON movielens.movies_to_genres TO admin;
GRANT SELECT ON movielens.tags TO admin;
GRANT SELECT ON movielens.genres TO admin;

GRANT CREATE USER, DROP USER to admin;
GRANT CREATE TABLE, CREATE SESSION, CREATE SYNONYM,
    CREATE VIEW to admin;

DROP TABLE movielens.movies_to_genres;
DROP TABLE movielens.tags;
DROP TABLE movielens.movies;
DROP TABLE movielens.genres;
DROP TABLE movielens.ratings;
DROP SEQUENCE MOVIES_TO_GENRES_ID_SEQ;

CREATE TABLE movielens.movies (
  id NUMBER,
  title VARCHAR(500) NOT NULL,
  year VARCHAR(4) NOT NULL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP(6),
  PRIMARY KEY (id)
);

CREATE TABLE movielens.genres (
  id NUMBER,
  name VARCHAR(80) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE movielens.movies_to_genres (
  id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
  movie_id NUMBER,
  genre_id NUMBER,
  PRIMARY KEY (id),
  FOREIGN KEY (movie_id)  REFERENCES movielens.movies(id),
  FOREIGN KEY (genre_id)  REFERENCES movielens.genres(id)
);

CREATE SEQUENCE MOVIES_TO_GENRES_ID_SEQ START WITH 1;


CREATE TABLE movielens.tags (
  user_id NUMBER,
  movie_id NUMBER,
  tag VARCHAR(256) not null,
  timestamp  TIMESTAMP(6) NOT NULL,
  CONSTRAINT PK_TAGS PRIMARY KEY (user_id,movie_id, tag)
);

CREATE TABLE movielens.ratings (
    user_id NUMBER NOT NULL,
    movie_id NUMBER NOT NULL,
    rating  DECIMAL(2,1) NOT NULL,
    timestamp  TIMESTAMP(6) NOT NULL,
    CONSTRAINT PK_RATINGS PRIMARY KEY (user_id,movie_id, rating)
);

ALTER USER admin quota unlimited on USERS;

begin
    rdsadmin.rdsadmin_util.alter_supplemental_logging(
            p_action => 'ADD');
    rdsadmin.rdsadmin_util.set_configuration('archivelog retention hours',24);
    rdsadmin.rdsadmin_util.alter_supplemental_logging('ADD','ALL');
    rdsadmin.rdsadmin_util.alter_supplemental_logging('ADD');
end;
/

ALTER TABLE movielens.movies ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;
ALTER TABLE movielens.genres ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;
ALTER TABLE movielens.movies_to_genres ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;
ALTER TABLE movielens.ratings ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;
ALTER TABLE movielens.tags ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;
