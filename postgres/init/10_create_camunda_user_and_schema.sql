-- This command should be customized
-- We are going to run Camunda using camunda_user and camunda_schema

CREATE ROLE camunda_user WITH
    LOGIN
    PASSWORD 'camunda_user_password'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT
    NOREPLICATION
    CONNECTION LIMIT -1;

CREATE SCHEMA IF NOT EXISTS camunda_schema
    AUTHORIZATION camunda_user;
