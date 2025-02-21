#!/bin/bash

# This is an auto backup bash shell script.
# by y1jiong

WORKING_PATH='/opt'
BACKUP_PATH='/opt/mc/java'
OUTPUT_PATH='/opt/mc/java'
TARGET='mc'
PREFIX='mc'
SUFFIX='tar.gz'

if [ ! -d "$OUTPUT_PATH" ]; then
    mkdir "$OUTPUT_PATH"
fi

#tar -I pigz -cf $OUTPUT_PATH/$PREFIX.$(date +%Y%m%d-%H%M).$SUFFIX -C $BACKUP_PATH $TARGET
tar -C $BACKUP_PATH -c $TARGET | pigz > $OUTPUT_PATH/$PREFIX.$(date +%Y%m%d-%H%M).$SUFFIX
echo $(date +%Y/%m/%d-%H:%M) $PREFIX backup completed >> $WORKING_PATH/backup.log

find $OUTPUT_PATH -mtime +2 -name "*.$SUFFIX" -exec rm -f {} \;
echo $(date +%Y/%m/%d-%H:%M) The backup 3 days ago has been deleted >> $WORKING_PATH/backup.log

exit
