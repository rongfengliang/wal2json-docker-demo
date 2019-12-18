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