CREATE DATABASE mydb_username;

CREATE USER 'kakarot'@'%' IDENTIFIED WITH mysql_native_password BY 'songoan'
  PASSWORD EXPIRE INTERVAL 30 DAY;

  GRANT ALL ON collect_foo.* TO 'kakarot'@'%';

GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'kakarot'@'%';  
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'kakarot'@'%';
