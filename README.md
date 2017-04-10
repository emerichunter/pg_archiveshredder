# pg_archiveshredder
This utility in shell is made for the sole purpose of shredding you wal logs to the latest automatically when benching. DO NOT EVER USE THIS ON PRODUCTION !

Add this to crontab (85 is maximum percentage or FS used here) :
* * * * * /path/to/archive_autocleanup.sh /path/to/pgdata /path/to/pg_wal/ 85 >>/path/to//archive_autocleanup.log 2>&1
* * * * * sleep 20 ; /path/to/archive_autocleanup.sh /path/to/pgdata /path/to/pg_wal/ 85 >>/path/to//archive_autocleanup.log 2>&1
* * * * * sleep 40 ; /path/to/archive_autocleanup.sh /path/to/pgdata /path/to/pg_wal/ 85 >>/path/to//archive_autocleanup.log 2>&1

