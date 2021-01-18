#!/bin/bash
set -e
export PGPASSWORD=opalpass

# load the database
psql -v ON_ERROR_STOP=1 --username postgres --dbname omop_test -f /omop_test.sql
rm /omop_test.sql
