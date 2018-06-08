#FROM registry.gitlab.com/kazuhcurrycw/test/postgres:dap_9.5.5
FROM commonregistry:5000/postgres:dap_9.5.5

COPY pg_hba.conf /dbfp/pgdata/data/

RUN chown -R postgres:postgres /dbfp/pgdata/data/

COPY postgresql-9.5.service /usr/lib/systemd/system/
