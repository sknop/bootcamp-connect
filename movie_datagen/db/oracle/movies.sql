/*CREATE USER movielens IDENTIFIED BY movielens;*/
GRANT CREATE TABLE TO movielens;
GRANT CREATE SESSION TO movielens;

GRANT UNLIMITED TABLESPACE TO movielens;

GRANT SELECT ON movielens.movies TO foo;
GRANT SELECT ON movielens.movies_to_genres TO foo;
GRANT SELECT ON movielens.tags TO foo;
GRANT SELECT ON movielens.genres TO foo;

DROP TABLE movielens.movies_to_genres;
DROP TABLE movielens.tags;
DROP TABLE movielens.movies;
DROP TABLE movielens.genres;
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
  FOREIGN KEY (movie_id)  REFERENCES movies(id),
  FOREIGN KEY (genre_id)  REFERENCES genres(id)
);

CREATE SEQUENCE MOVIES_TO_GENRES_ID_SEQ START WITH 1;


CREATE TABLE movielens.tags (
  user_id NUMBER,
  movie_id NUMBER,
  tag VARCHAR(256) not null,
  timestamp  TIMESTAMP(6) NOT NULL,
  CONSTRAINT pk_Ratings PRIMARY KEY (user_id,movie_id, tag)
);


ALTER USER foo quota unlimited on USERS;
insert into movielens.movies values (1, 'foo', 2021, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)