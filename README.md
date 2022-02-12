# Run Camunda with database initialised using SQL scripts

## Overview
1) Run PostgreSQL using docker-compose.
2) We connect `./init` folder as docker volume - it includes init SQL scripts:
   1) [10_create_camunda_user_and_schema.sql](./postgres/init/10_create_camunda_user_and_schema.sql)
      1) Create user
         * user: `camunda_user`
         * password: `camunda_user_password`
      2) Create schema `camunda_schema`.
   2) Then create Camunda specific tables in `camunda_schema`.
      * [21_postgres_identity_7.16.0.sql](./postgres/init/21_postgres_identity_7.16.0.sql)
      * [22_postgres_engine_7.16.0.sql](./postgres/init/22_postgres_engine_7.16.0.sql)
3) Ofcourse we can run these SQL scripts manually.
4) Then we run Camunda that is configured to use `camunda_user`:`camunda_user_password` and `camunda_schema`.

Note, that Camunda SQL scripts have been modified to take into account the fact that the `camunda_chema` is used.

## PostgreSQL

### Start PostgreSQL
```shell
# This script has to be executed in project root
docker-compose -f ./postgres/docker-compose.yaml up -d
```
### Stop PostgreSQL
```shell
# This script has to be executed in project root
docker-compose -f ./postgres/docker-compose.yaml down
```

## Camunda

### Start Camunda
```shell
# This script has to be executed in project root
# PostgreSQL should be already started and initialised
docker-compose -f ./camunda/docker-compose.yaml up -d
```
Note, that Camunda is configured to run without automated database configuration (we use database which is already initialised using method described above).

### Stop Camunda
```shell
# This script has to be executed in project root
docker-compose -f ./camunda/docker-compose.yaml down
```

## Reference

### PostgreSQL
* https://hub.docker.com/_/postgres
* https://gist.github.com/onjin/2dd3cc52ef79069de1faa2dfd456c945
* https://stackoverflow.com/a/34688994

### Camunda
* https://docs.camunda.org/manual/7.16/installation/database-schema/#manual-installation
* https://camunda.jfrog.io/ui/native/camunda-bpm/org/camunda/bpm/distro/camunda-sql-scripts/7.16.0/

