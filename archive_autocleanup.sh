#!/bin/sh

# DATA directory
DATADIR=$1
#DATADIR="/appli/postgres/test/9.6/data/"

# WAL directory
WALDIR=$2

# Maximum value of used FS allowed in percents
MAXFS=$3

# Finding binairies path for cleanup
#PGCTRLDT_BIN=`which pg_controldata`
#PGARCHVCLNP_BIN=`which pg_archivecleanup`

PGCTRLDT_BIN=/usr/pgsql-9.6/bin/pg_controldata
PGARCHVCLNP_BIN=/usr/pgsql-9.6/bin/pg_archivecleanup

# DEBUGGING ZONE
#echo $PGCTRLDT_BIN
#echo $PGARCHVCLNP_BIN

ACTUALFS=$(df -h | grep 'var\/postgres' | awk '{print $4}' | cut -d'%' -f 1)



echo "Actual filling of FS in percents : " $ACTUALFS


if [[ $ACTUALFS -gt $MAXFS ]]; then

	echo 'Cleanup !'

		LASTWAL=$( $PGCTRLDT_BIN  -D $DATADIR | grep 'REDO WAL file' | awk '{print $6}'a)

	echo "Last WAL FILE to be kept : " $LASTWAL

		$PGARCHVCLNP_BIN $WALDIR $LASTWAL 2>>autocleanup.log

else 
	echo " No Cleanup this time... "

fi


