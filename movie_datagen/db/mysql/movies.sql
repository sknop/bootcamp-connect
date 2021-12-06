CREATE DATABASE IF NOT EXISTS movielens;

use movielens;

DROP TABLE IF EXISTS movies_to_genres;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS genres;

CREATE TABLE movies (
    id BIGINT UNSIGNED PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    year VARCHAR(4) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE genres (
    id   BIGINT UNSIGNED PRIMARY KEY,
    name VARCHAR(80) NOT NULL
);

CREATE TABLE movies_to_genres (
   id       BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   movie_id BIGINT UNSIGNED,
   genre_id   BIGINT UNSIGNED,
   FOREIGN KEY (movie_id)  REFERENCES movies(id),
   FOREIGN KEY (genre_id)  REFERENCES genres(id)
);

/*userId,movieId,rating,timestamp*/
CREATE TABLE ratings (
  user_id BIGINT UNSIGNED not null,
  movie_id BIGINT UNSIGNED not null,
  rating  DECIMAL(2,1) not null,
  timestamp  int(11) not null,
  CONSTRAINT pk_Ratings PRIMARY KEY (user_id,movie_id)
);

/*userId,movieId,tag,timestamp*/
CREATE TABLE tags (
   user_id BIGINT UNSIGNED not null,
   movie_id BIGINT UNSIGNED not null,
   tag VARCHAR(50) not null,
   timestamp  int(11) not null,
   CONSTRAINT pk_Ratings PRIMARY KEY (user_id,movie_id)
);