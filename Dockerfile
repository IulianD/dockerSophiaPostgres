FROM postgres:12.5
ENV PGDATA /sophia/data
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA"
RUN mkdir -p /sophia/conf/conf.d && chown -R postgres:postgres /sophia/conf && chmod 777 /sophia/conf
VOLUME "$PGDATA"
RUN mkdir /import
COPY *.sh /docker-entrypoint-initdb.d/
COPY omop_test*.sql.gz /
RUN gunzip omop_test1.sql.gz omop_test2.sql.gz omop_test3.sql.gz
RUN cat omop_test1.sql omop_test2.sql omop_test3.sql > /import/omop_test.sql
RUN chown -R postgres /import
RUN rm omop_test1.sql omop_test2.sql omop_test3.sql
