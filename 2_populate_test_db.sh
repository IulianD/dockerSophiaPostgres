#!/bin/bash
set -e
export PGPASSWORD=opalpass

# load the database
psql -v ON_ERROR_STOP=1 --username postgres --dbname omop_test -f /import/omop_test.sql
rm /import/omop_test.sql
# we can set 2 numbers in the env:
# PG_NUMHOSTS - how many pg servers in the setup
# PG_THISHOST - this host's number (from 0)
# if those are set, delete all the modulo(PG_THISHOST) patient ids (so we make the data different among hosts)
if [[ -v PG_THISHOST ]]; then    
	psql -v ON_ERROR_STOP=1 --username postgres --dbname omop_test -f /import/delete_some_ids.sql
	/import/delete_some_ids.sql
fi
