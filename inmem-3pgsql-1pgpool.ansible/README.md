
## playbook

PostgreSQL 3台、Pgpool-II 1台のクラスタを構成します。
PostgreSQLは pg_wal を tmpfs上に、fsync=off とした、
apply同期のストリーミングレプリケーション構成です。


    $ ansible-playbook -i hosts setup-hosts.yml

/etc/hosts と /etc/hostname を頒布します。
ネットワークが設定済みなら不要です。


    $ ansible-playbook -i hosts drop-all-pg.yml

プライマリ・スタンバイのPostgreSQLを停止してデータを削除します。


    $ ansible-playbook -i hosts stop-pgpool.yml

Pgpool-IIを停止します。


    $ ansible-playbook -i hosts setup-pg-prmary.yml

プライマリPostgreSQLをセットアップします。


    $ ansible-playbook -i hosts setup-pg-standby.yml

スタンバイPostgreSQLをセットアップします。


    $ ansible-playbook -i hosts setup-pgpool.yml

Pgpool-II をセットアップします。


## vars

    pgdg_url: "https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm"
    pgver: 11

使用する PostgreSQL の PGDGリポジトリを指定します。


    subnet: "172.31.16.0/20"
    pg1_host: pg1
    pg1_addr: 172.31.17.213
    pg2_host: pg2
    pg2_addr: 172.31.25.63
    pg3_host: pg3
    pg3_addr: 172.31.31.31
    pool1_host: pg4
    pool1_addr: 172.31.28.143

テスト用のホストとサブネットを設定します。

