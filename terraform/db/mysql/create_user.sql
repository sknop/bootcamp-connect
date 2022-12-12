
CREATE USER 'sven'@'%' IDENTIFIED WITH mysql_native_password BY 'sven-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'sven'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'sven'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'sven'@'%';

CREATE USER 'james'@'%' IDENTIFIED WITH mysql_native_password BY 'james-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'james'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'james'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'james'@'%';

CREATE USER 'jason'@'%' IDENTIFIED WITH mysql_native_password BY 'jason-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'jason'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'jason'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'jason'@'%';


CREATE USER 'luke'@'%' IDENTIFIED WITH mysql_native_password BY 'luke-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'luke'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'luke'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'luke'@'%';

CREATE USER 'michael'@'%' IDENTIFIED WITH mysql_native_password BY 'michael-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'michael'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'michael'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'michael'@'%';

CREATE USER 'patrick'@'%' IDENTIFIED WITH mysql_native_password BY 'patrick-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'patrick'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'patrick'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'patrick'@'%';


CREATE USER 'prudhvi'@'%' IDENTIFIED WITH mysql_native_password BY 'prudhvi-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'prudhvi'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'prudhvi'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'prudhvi'@'%';


CREATE USER 'rangarajan'@'%' IDENTIFIED WITH mysql_native_password BY 'rangarajan-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'rangarajan'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'rangarajan'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'rangarajan'@'%';


CREATE USER 'sankar'@'%' IDENTIFIED WITH mysql_native_password BY 'sankar-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'sankar'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'sankar'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'sankar'@'%';


CREATE USER 'srinivas'@'%' IDENTIFIED WITH mysql_native_password BY 'srinivas-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'srinivas'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'srinivas'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'srinivas'@'%';


CREATE USER 'stuart'@'%' IDENTIFIED WITH mysql_native_password BY 'stuart-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;

GRANT ALL ON movielens.* TO 'stuart'@'%';
GRANT SELECT, EVENT, EXECUTE, LOCK TABLES ON movielens.* TO 'stuart'@'%';
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'stuart'@'%';

CREATE USER 'test'@'%' IDENTIFIED BY 'test-secret'  PASSWORD EXPIRE INTERVAL 30 DAY;
