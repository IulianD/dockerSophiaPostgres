FROM postgres:12
COPY *.sh /docker-entrypoint-initdb.d/
COPY omop_test*.sql.gz /
RUN gunzip omop_test1.sql.gz omop_test2.sql.gz omop_test3.sql.gz
RUN cat omop_test1.sql omop_test2.sql omop_test3.sql > omop_test.sql
RUN rm omop_test1.sql omop_test2.sql omop_test3.sql
