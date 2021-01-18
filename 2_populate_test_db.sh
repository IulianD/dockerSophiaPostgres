#!/bin/bash
set -e
export PGPASSWORD=opalpass

# load the database
psql -v ON_ERROR_STOP=1 --username postgres --dbname omop_test -f /import/omop_test.sql
rm /import/omop_test.sql
