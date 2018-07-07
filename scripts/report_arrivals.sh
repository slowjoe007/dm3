#!/bin/sh

# Requires `inotify-tools`, `uuid-runtime` to be installed

inotifywait -mrq -e create --format %w%f "$ARRIVAL_DIR" | while read FILE
do
    UUID=`uuidgen`

    FILENAME=`basename $FILE`
    #mv $FILE ${$ARRIVAL_DIR%/}   
    logger "File \"${$ARRIVAL_DIR%/}/${UUID}_${FILENAME}\" has been created."
    
    # TODO - Trigger push notification
done
