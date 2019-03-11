#!/bin/bash
# This script is run by recovery_1st_stage to recovery the slave from the primary.

set -o xtrace
exec &> /tmp/recovery_1st_stage.log < /dev/null

PRIMARY_NODE_PGDATA="$1"
DEST_NODE_HOST="$2"
DEST_NODE_PGDATA="$3"
PRIMARY_NODE_PGPORT=$4

PRIMARY_NODE_HOST=$(hostname -s)
PGHOME=/usr/pgsql-{{pgver}}
REPLUSER=postgres

date
echo start: pg_basebackup for $DEST_NODE_HOST

# Run pg_basebackup to recovery the slave from the primary
ssh -T -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null postgres@$DEST_NODE_HOST "
rm -rf /var/run/postgresql/pg_wal
rm -rf $DEST_NODE_PGDATA
${PGHOME}/bin/pg_basebackup -h $PRIMARY_NODE_HOST -U $REPLUSER -p $PRIMARY_NODE_PGPORT -D $DEST_NODE_PGDATA -X stream -R && mv /var/lib/pgsql/{{pgver}}/data/pg_wal /var/run/postgresql/ && ln -s /var/run/postgresql/pg_wal /var/lib/pgsql/{{pgver}}/data/pg_wal && cat >> $DEST_NODE_PGDATA/recovery.conf << EOT
recovery_target_timeline = 'latest'
EOT
"
if [[ $? -ne 0 ]]; then
    echo end: pg_basebackup failed. online recovery failed.
    exit 1
else
    echo end: online recovery is finished
    exit 0
fi

