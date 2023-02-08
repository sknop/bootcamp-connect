DROP USER "{{user}}";
CREATE USER "{{user}}" WITH PASSWORD '{{user}}-secret' NOCREATEDB INHERIT;
GRANT SELECT ON ALL TABLES IN SCHEMA movielens to {{user}};
GRANT USAGE ON SCHEMA movielens TO {{user}};
GRANT debezium to {{user}};
GRANT debezium_replication_group to {{user}};
