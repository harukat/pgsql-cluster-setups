[ -f /etc/profile ] && source /etc/profile
PGDATA=/var/lib/pgsql/11/data
export PGDATA
# If you want to customize your settings,
# Use the file below. This is not overridden
# by the RPMS.
[ -f /var/lib/pgsql/.pgsql_profile ] && source /var/lib/pgsql/.pgsql_profile

PATH=/usr/pgsql-11/bin:$PATH
LD_LIBRARY_PATH=/usr/pgsql-11/lib:$LD_LIBRARY_PATH

PATH=/usr/pgpool-11/bin:/usr/pgsql-11/bin:$PATH
LD_LIBRARY_PATH=/usr/pgpool-11/lib:/usr/pgsql-11/lib:$LD_LIBRARY_PATH

