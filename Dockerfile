FROM dalongrong/wal2json:origin-1.0
RUN echo "max_replication_slots = 10" >> /usr/share/postgresql/postgresql.conf.sample
RUN echo "wal_level = logical" >> /usr/share/postgresql/postgresql.conf.sample