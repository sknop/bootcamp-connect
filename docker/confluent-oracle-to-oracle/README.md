# Example pipeline Database to Database

## Setup

MySQL 5.7 -> [Debezium CDC] -> Kafka -> [JDBC Sink Connector] -> MySQL 5.7

Tables:

* movies : mysql.movielens.movies
* genres : mysql.movielens.genres
* tags   : mysql.movielens.tags
* movies_to_genres : mysql.movielens.movies_to_genres 
