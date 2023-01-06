CREATE USER '{{user}}'@'%' IDENTIFIED WITH mysql_native_password BY '{{user}}-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;
GRANT ALL ON movielens.* TO '{{user}}'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO '{{user}}'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO '{{user}}'@'%';
