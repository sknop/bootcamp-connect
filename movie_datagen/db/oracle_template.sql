CREATE USER {{user}} IDENTIFIED BY "{{user}}-secret";
GRANT CREATE TABLE TO {{user}};
GRANT CREATE SESSION TO {{user}};
GRANT UNLIMITED TABLESPACE TO {{user}};

GRANT SELECT ON movielens.movies TO {{user}};
GRANT SELECT ON movielens.movies_to_genres TO {{user}};
GRANT SELECT ON movielens.tags TO {{user}};
GRANT SELECT ON movielens.genres TO {{user}};

GRANT FLASHBACK ANY TABLE TO {{user}};

BEGIN
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','{{user:upper}}','SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', '{{user:upper}}', 'EXECUTE');
    rdsadmin.rdsadmin_util.grant_sys_object('DBA_TABLESPACES', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.grant_sys_object('V_$INSTANCE', '{{user:upper}}', 'SELECT');
    rdsadmin.rdsadmin_util.alter_supplemental_logging(p_action => 'ADD');
end;

