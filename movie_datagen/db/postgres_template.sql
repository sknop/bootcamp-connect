CREATE USER "{{user}}" WITH PASSWORD '{{user}}-secret' NOCREATEDB;
GRANT SELECT ON ALL TABLES IN SCHEMA public to "{{user}}";

