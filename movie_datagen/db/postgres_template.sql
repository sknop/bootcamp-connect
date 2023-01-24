CREATE USER "{{user}}" WITH PASSWORD '{{user}}-secret' NOCREATEDB;
GRANT SELECT ON ALL TABLES IN SCHEMA movielens to {{user}};
GRANT USAGE ON SCHEMA movielens TO {{user}};
