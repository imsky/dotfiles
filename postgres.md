# Postgres

## psql

* `\du`: show roles
* `\drds`: show group roles and settings
* `\df`: show functions
* `\dn`: show schemas and their owners
* `\dvst`: show views, tables, sequences
* `\dx`: show extensions and which schemas they're in
* `\l`: show databases
* `\dp`: show table permissions
* `\conninfo`: show connection info - database, user, etc.

## Snippets

### Get current user

```
select current_user;
```

### Get current database

```
select current_database();
```

### Get database size

```
select pg_size_pretty(pg_database_size('dbname'));
```
