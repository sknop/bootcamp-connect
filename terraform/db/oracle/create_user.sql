create user sven identified by "sven-secret";
create user adam identified by "adam-secret";
create user lorenc identified by "lorenc-secret";
create user neil identified by "neil-secret";
create user pierpaolo identified by "pierpaolo-secret";
create user victoria identified by "victoria-secret";
create user ray identified by "ray-secret";
create user rohit identified by "rohi-secret";
create user victor identified by "victor-secret";
create user amy identified by "amy-secret";


  GRANT CREATE TABLE TO sven;
  GRANT CREATE SESSION TO sven;

  GRANT UNLIMITED TABLESPACE TO sven;

  GRANT SELECT ON movielens.movies TO sven;
  GRANT SELECT ON movielens.movies_to_genres TO sven;
  GRANT SELECT ON movielens.tags TO sven;
  GRANT SELECT ON movielens.genres TO sven;


  GRANT CREATE TABLE TO adam;
  GRANT CREATE SESSION TO adam;

  GRANT UNLIMITED TABLESPACE TO adam;

  GRANT SELECT ON movielens.movies TO adam;
  GRANT SELECT ON movielens.movies_to_genres TO adam;
  GRANT SELECT ON movielens.tags TO adam;
  GRANT SELECT ON movielens.genres TO adam;


  GRANT CREATE TABLE TO lorenc;
  GRANT CREATE SESSION TO lorenc;

  GRANT UNLIMITED TABLESPACE TO lorenc;

  GRANT SELECT ON movielens.movies TO lorenc;
  GRANT SELECT ON movielens.movies_to_genres TO lorenc;
  GRANT SELECT ON movielens.tags TO lorenc;
  GRANT SELECT ON movielens.genres TO lorenc;


  GRANT CREATE TABLE TO neil;
  GRANT CREATE SESSION TO neil;

  GRANT UNLIMITED TABLESPACE TO neil;

  GRANT SELECT ON movielens.movies TO neil;
  GRANT SELECT ON movielens.movies_to_genres TO neil;
  GRANT SELECT ON movielens.tags TO neil;
  GRANT SELECT ON movielens.genres TO neil;


  GRANT CREATE TABLE TO pierpaolo;
  GRANT CREATE SESSION TO pierpaolo;

  GRANT UNLIMITED TABLESPACE TO pierpaolo;

  GRANT SELECT ON movielens.movies TO pierpaolo;
  GRANT SELECT ON movielens.movies_to_genres TO pierpaolo;
  GRANT SELECT ON movielens.tags TO pierpaolo;
  GRANT SELECT ON movielens.genres TO pierpaolo;

  GRANT CREATE TABLE TO victoria;
  GRANT CREATE SESSION TO victoria;

  GRANT UNLIMITED TABLESPACE TO victoria;

  GRANT SELECT ON movielens.movies TO victoria;
  GRANT SELECT ON movielens.movies_to_genres TO victoria;
  GRANT SELECT ON movielens.tags TO victoria;
  GRANT SELECT ON movielens.genres TO victoria;

  GRANT CREATE TABLE TO victor;
  GRANT CREATE SESSION TO victor;

  GRANT UNLIMITED TABLESPACE TO victor;

  GRANT SELECT ON movielens.movies TO victor;
  GRANT SELECT ON movielens.movies_to_genres TO victor;
  GRANT SELECT ON movielens.tags TO victor;
  GRANT SELECT ON movielens.genres TO victor;

GRANT FLASHBACK ANY TABLE TO pierpaolo;
GRANT FLASHBACK ANY TABLE TO SVEN;
GRANT FLASHBACK ANY TABLE TO NEIL;
GRANT FLASHBACK ANY TABLE TO ADAM;
GRANT FLASHBACK ANY TABLE TO VICTOR;
GRANT FLASHBACK ANY TABLE TO VICTORIA;
GRANT FLASHBACK ANY TABLE TO LORENC;

BEGIN
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','SVEN','SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', 'SVEN', 'EXECUTE');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_TABLESPACES', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$INSTANCE', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.alter_supplemental_logging(p_action => 'ADD');
end;

BEGIN
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','NEIL','SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', 'NEIL', 'EXECUTE');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_TABLESPACES', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$INSTANCE', 'NEIL', 'SELECT');
    rdsadmin.rdsadmin_util.alter_supplemental_logging(p_action => 'ADD');
end;

BEGIN
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','ADAM','SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', 'ADAM', 'EXECUTE');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_TABLESPACES', 'ADAM', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$INSTANCE', 'SVEN', 'SELECT');
    rdsadmin.rdsadmin_util.alter_supplemental_logging(p_action => 'ADD');
end;

BEGIN
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','VICTOR','SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', 'VICTOR', 'EXECUTE');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_TABLESPACES', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$INSTANCE', 'VICTOR', 'SELECT');
    rdsadmin.rdsadmin_util.alter_supplemental_logging(p_action => 'ADD');
end;

BEGIN
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','VICTORIA','SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', 'VICTORIA', 'EXECUTE');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_TABLESPACES', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$INSTANCE', 'VICTORIA', 'SELECT');
    rdsadmin.rdsadmin_util.alter_supplemental_logging(p_action => 'ADD');
end;

BEGIN
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','LORENC','SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', 'LORENC', 'EXECUTE');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_TABLESPACES', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$INSTANCE', 'LORENC', 'SELECT');
    rdsadmin.rdsadmin_util.alter_supplemental_logging(p_action => 'ADD');
end;

BEGIN
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','PIERPAOLO','SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', 'PIERPAOLO', 'EXECUTE');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_TABLESPACES', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$INSTANCE', 'PIERPAOLO', 'SELECT');
    rdsadmin.rdsadmin_util.alter_supplemental_logging(p_action => 'ADD');
end;

create or replace procedure add_user is
begin
    execute immediate 'create user amy identified by "amy-secret"';
    execute immediate 'GRANT CREATE TABLE TO amy';
end;
/

begin
    add_user;
end;
/

drop user amy;
