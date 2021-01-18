#!/bin/bash
set -e
export PGPASSWORD=opalpass

psql -v ON_ERROR_STOP=1 --username postgres --dbname omop_test <<-EOSQL
reassign owned by etldev to opalroot;
grant select on all tables in schema omop_vocabulary to opal;
grant select on all tables in schema synthea_omop to opal;
grant select on all tables in schema public to opal;
grant usage on  schema synthea_omop to opal;
grant usage on  schema omop_vocabulary to opal;
revoke all on schema omop_vocabulary from etldev;
revoke all on schema synthea_omop from etldev;
revoke all on all tables in schema omop_vocabulary from etldev;
revoke all on all tables in schema synthea_omop from etldev;
drop user etldev;
create database sophia;
alter database sophia owner to opalroot;
\c sophia 
grant connect on database sophia to opal;
grant create on database sophia to opal;
grant select on all tables in schema public to opal;
EOSQL
