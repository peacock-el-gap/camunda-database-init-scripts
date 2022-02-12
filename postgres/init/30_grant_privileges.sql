-- Here are minimal privileges that are necessary for camunda_user
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA camunda_schema
TO camunda_user;