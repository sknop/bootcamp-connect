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
