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
    updated_at TIMESTAMP(6)
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

CREATE TABLE ratings (
  user_id BIGINT UNSIGNED not null,
  movie_id BIGINT UNSIGNED not null,
  rating  DECIMAL(2,1) not null,
  timestamp  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_Ratings PRIMARY KEY (user_id, movie_id, rating)
);

/*userId,movieId,tag,timestamp*/
CREATE TABLE tags (
   user_id BIGINT UNSIGNED not null,
   movie_id BIGINT UNSIGNED not null,
   tag VARCHAR(256) not null,
   timestamp  TIMESTAMP(6) NOT NULL,
   CONSTRAINT pk_tags PRIMARY KEY (user_id, movie_id, tag)
);

DELIMITER $$

DROP PROCEDURE IF EXISTS add_user $$

CREATE PROCEDURE add_user(IN username VARCHAR(45))
BEGIN
    DECLARE host CHAR(14) DEFAULT '@\'%\'';
    DECLARE clean_user VARCHAR(45);
    DECLARE passwd VARCHAR(55);

    SET clean_user := REPLACE(TRIM(username), CHAR(39), CONCAT(CHAR(92), CHAR(39)));
    SET username := CONCAT('\'', clean_user, '\'', host),
        passwd := CONCAT('\'', clean_user, '-secret\'');
    SET @sql := CONCAT('CREATE USER ', username, ' IDENTIFIED WITH mysql_native_password BY ', passwd, ' PASSWORD EXPIRE INTERVAL 30 DAY');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;

    SET @sql := CONCAT('GRANT ALL ON movielens.* TO ', username);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;

    SET @sql := CONCAT('GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO ', username);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;

    SET @sql := CONCAT('GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO ', username);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;


    DEALLOCATE PREPARE `stmt`;
    FLUSH PRIVILEGES;
END$$

DELIMITER ;



