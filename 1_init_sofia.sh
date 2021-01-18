#!/bin/bash
set -e
export PGPASSWORD=opalpass
psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
    create user opalroot with encrypted password 'opalpass';
    create user opal with encrypted password 'opalpass'; 
    create user etldev; 
    
    create database opal_data;
    alter database opal_data owner to opalroot;
    create database opal_id;
    alter database opal_id owner to opalroot;
    
    grant connect on database opal_id to opal;
    grant create on database opal_id to opal;
    grant connect on database opal_data to opal;
    grant create on database opal_data to opal;

    create database omop_test;
    alter database omop_test owner to opalroot;
    grant connect on database omop_test to opal;
    grant create on database omop_test to opal;
EOSQL
