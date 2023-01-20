DROP TABLE IF EXISTS movies_to_genres;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS genres;

CREATE SCHEMA IF NOT EXISTS movielens;

CREATE TABLE IF NOT EXISTS movielens.movies (
    id BIGINT PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    year VARCHAR(4) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP(6)
);

CREATE TABLE  IF NOT EXISTS movielens.genres (
    id   BIGINT PRIMARY KEY,
    name VARCHAR(80) NOT NULL
);

CREATE TABLE  IF NOT EXISTS movielens.movies_to_genres (
   id       BIGSERIAL PRIMARY KEY,
   movie_id BIGINT,
   genre_id   BIGINT,
   FOREIGN KEY (movie_id)  REFERENCES movielens.movies(id),
   FOREIGN KEY (genre_id)  REFERENCES movielens.genres(id)
);

CREATE TABLE  IF NOT EXISTS movielens.ratings (
  user_id BIGINT not null,
  movie_id BIGINT not null,
  rating  DECIMAL(2,1) not null,
  timestamp  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_Ratings PRIMARY KEY (user_id, movie_id, rating)
);

/*userId,movieId,tag,timestamp*/
CREATE TABLE IF NOT EXISTS movielens.tags (
   user_id BIGINT not null,
   movie_id BIGINT not null,
   tag VARCHAR(256) not null,
   timestamp  TIMESTAMP(6) NOT NULL,
   CONSTRAINT pk_tags PRIMARY KEY (user_id, movie_id, tag)
);


