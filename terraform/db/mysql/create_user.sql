CREATE DATABASE mydb_username;

CREATE USER 'kakarot'@'%' IDENTIFIED WITH mysql_native_password BY 'songoan'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON collect_foo.* TO 'kakarot'@'%';

GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'kakarot'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'kakarot'@'%';


use movielens;

DELIMITER $$
CREATE PROCEDURE `GrantUsers`(IN username VARCHAR(10), IN password VARCHAR(10))
BEGIN
   SET @dbname = CONCAT('mydb_', username);
   SET @sql = CONCAT("CREATE DATABASE ",@dbname);
   PREPARE stmt FROM @sql;
   EXECUTE stmt;

   SET @sql_create_user = CONCAT("CREATE USER '", @username, "'@'%' IDENTIFIED WITH mysql_native_password BY '", @password,"' PASSWORD EXPIRE INTERVAL 30 DAY");

   PREPARE stmt_create FROM @sql_create_user;
   EXECUTE stmt_create;

  END$$
DELIMITER ;

SET @sql_grant_perm  = CONCAT("GRANT ALL ON ", @dbname, "* TO '", @username, "'@'%'");
SET @sql_perm_movies = CONCAT("GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO '", @username, "'@'%'");
SET @sql_perm_repl   = CONCAT("GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO '", @username, "'@'%'");


PREPARE stmt_grant FROM @sql_grant_perm;
EXECUTE stmt_grant;
PREPARE stmt_perm FROM @sql_perm_movies;
EXECUTE stmt_perm;
PREPARE stmt_repl FROM @sql_perm_repl;
EXECUTE stmt_repl;

***

CREATE USER 'sven'@'%' IDENTIFIED WITH mysql_native_password BY 'songoan'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'sven'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'sven'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'sven'@'%';

CREATE USER 'christoph'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'christoph'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'christoph'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'christoph'@'%';

CREATE USER 'jorge'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'jorge'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'jorge'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'jorge'@'%';


CREATE USER 'kirill'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'kirill'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'kirill'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'kirill'@'%';

CREATE USER 'laurent'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'laurent'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'laurent'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'laurent'@'%';

CREATE USER 'oscar'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'oscar'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'oscar'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'oscar'@'%';


CREATE USER 'benedikt'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'benedikt'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'benedikt'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'benedikt'@'%';


CREATE USER 'damien'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'damien'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'damien'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'damien'@'%';

CREATE USER 'jakub'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'jakub'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'jakub'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'jakub'@'%';

CREATE USER 'nacho'@'%' IDENTIFIED WITH mysql_native_password BY 'kakarot'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'nacho'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'nacho'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'nacho'@'%';
