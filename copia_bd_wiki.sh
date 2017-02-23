scp root@servidor://var/lib/mysql/wiki_sibe/* /var/lib/mysql/wiki_sibe/
chown mysql.mysql /var/lib/mysql/wiki_sibe/ -R -f
mysqlcheck -uroot -psqlmestre -o wiki_sibe
