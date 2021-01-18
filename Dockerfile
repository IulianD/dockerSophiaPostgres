FROM postgres:12
RUN mkdir /import
COPY *.sh /docker-entrypoint-initdb.d/
COPY omop_test*.sql.gz /
RUN gunzip omop_test1.sql.gz omop_test2.sql.gz omop_test3.sql.gz
RUN cat omop_test1.sql omop_test2.sql omop_test3.sql > /import/omop_test.sql
RUN chown -R postgres /import
RUN rm omop_test1.sql omop_test2.sql omop_test3.sql
