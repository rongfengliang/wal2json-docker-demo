# wal2json docker running

## how to runing

>  need install pg client tools

* start service

```code
docker-compose  up -d
```

* create slot 

```code
pg_recvlogical  -h 127.0.0.1 -U postgres -d postgres  --slot test_slot --create-slot -P wal2json

```

* view  json result

> new terminal

```code
pg_recvlogical -h 127.0.0.1  -U postgres -d postgres   --slot test_slot --start -o pretty-print=1 -f -
```

* deploy sql

> new  terminal

```code
psql -At -f example1.sql -h 127.0.0.1 -U postgres  -d postgres
```

## for  jdbc 

> you  must delete created slot first

* delete exisis  slot

```code
SELECT 'drop' FROM pg_drop_replication_slot('test_slot');
```

* running java demo

```code
cd mypgcdc
mvn clean package
java -jar target/postgres-wal2json-app.jar
```