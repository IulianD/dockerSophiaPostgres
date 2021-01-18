FROM postgres:12
COPY 1_init_sofia.sh /docker-entrypoint-initdb.d/
COPY 2_populate_test_db.sh /docker-entrypoint-initdb.d/
COPY 3_grants.sh /docker-entrypoint-initdb.d/
COPY omop_test1.sql.gz /
COPY omop_test2.sql.gz /
COPY omop_test3.sql.gz /
RUN gunzip omop_test1.sql.gz omop_test2.sql.gz omop_test3.sql.gz
RUN cat omop_test1.sql omop_test2.sql omop_test3.sql > omop_test.sql
