### [Content](../contents.md)

-----------------------------

# Общие сведения

### DBeaver

**Настройки по уменьшению взаимодействия с базой**

- Preferences -> Connections -> Metadata 
  
  - Open Separate connections for metadata read = never
  
  - Generate DDL with extra info = false

- Preferences -> Connections -> Errors and timeouts
  
  - Connectiona auto-recover enable = false

- Preferences -> Editors -> SqlEditor
  
  - Open Separate connections for metadata read = never
  
  - Connect on editor activation = false
  
  - Connect on query execute = false

- Preferences -> Editors -> SqlEditor -> Code complition
  
  - Enable auto activation = false
  
  - Auto insert proposal = false

- Preferences -> Editors -> SqlEditor -> SQL Processing
  
  - Invalidate connection before execute = false
  
  - Refresh active schema after SQL execution = false

- Preferences -> User interface -> Navigator
  
  - Show statistic info = false

# Postgres

## Стартуем базу в докер

[How to Use the Postgres Docker Official Image | Docker](https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/)

[Запускаем PostgreSQL в Docker: от простого к сложному / Хабр](https://habr.com/ru/articles/578744/)



Версии докера: `*-alpine` на базе дистрибутива alpine



Стартуем образ базы в detached режиме и создаем в нем базу postgres

```bash
docker run --name pg-latest -e POSTGRES_PASSWORD=123 -d postgres
```

```
docker run --name pg-15 -p 5432:5432 -e POSTGRES_PASSWORD=123 -d postgres:15-alpine
```

```
docker run --rm --name pg-15 -v "/path/init.sql":/docker-entrypoint-initdb.d/ -p 5432:5432 -e POSTGRES_PASSWORD=123 -d postgres:15-alpine
```

подключаемся к контейнеру,

```
docker exec -it pg-15 psql -U postgres
```

или

```
docker exec -it pg-15 bin/bash
```

Логируемся в psql под пользаком postgres

```
psql -U postgres
```



## PostgresSQL

## psql

[Extracting MySQL Table Sizes in PostgreSQL | Atlassian](https://www.atlassian.com/data/admin/how-to-list-databases-and-tables-in-postgresql-using-psql)

[PostgreSQL Show Tables](https://www.postgresqltutorial.com/postgresql-administration/postgresql-show-tables/)

```plsql
\l -- list of databases
\list -- list of databases

\c postgres-db -- Switching databases
\connect postgres-db -- Switching databases

\dt -- Listing tables
\dt+ -- extends


\d table_name -- To show the details of a specific table
\d+ table_name --To show the details of a specific table
```



SQL Examples for postgres

```plsql
CREATE TABLE leads (id INTEGER PRIMARY KEY, name VARCHAR);
```


