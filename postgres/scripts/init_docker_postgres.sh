
# this script is runned when the docker container is built
# it imports the base database structure and create the database for the tests

DATABASE_NAME="kashmir"
DATABASE_USER="kashmir_user"
DB_DUMP_LOCATION="/tmp/psql_data/structure.sql"

echo "*** CREATING DATABASE ***"

# create default database
psql -v ON_ERROR_STOP=1 -U postgres <<EOSQL
  CREATE USER "$DATABASE_USER" PASSWORD 'password1';
  CREATE DATABASE "$DATABASE_NAME";
  GRANT ALL PRIVILEGES ON DATABASE "$DATABASE_NAME" TO "$DATABASE_USER";
EOSQL

# import sql_dump
psql -v ON_ERROR_STOP=1 -U "$DATABASE_USER" -d "$DATABASE_NAME" -f "$DB_DUMP_LOCATION"

echo "*** DATABASE CREATED! ***"
