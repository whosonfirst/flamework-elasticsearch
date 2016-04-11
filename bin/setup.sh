#!/bin/sh

WHOAMI=`python -c 'import os, sys; print os.path.realpath(sys.argv[1])' $0`
WHEREAMI=`dirname $WHOAMI`
ROOT=`dirname $WHEREAMI`

PROJECT=$1

if [ ! -d ${PROJECT} ]
then
    echo "PROJECT DOES NOT EXIST!"
    exit 1
fi

cp ${ROOT}/www/include/*.php ${PROJECT}/www/include/

echo "" >> ${PROJECT}/www/include/config.php
cat ${ROOT}/www/include/config.php.elasticsearch

exit 0
