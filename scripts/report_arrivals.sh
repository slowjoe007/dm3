#!/bin/sh

# Requires `inotify-tools`, `uuid-runtime` to be installed

inotifywait -mrq -e create --format %w%f "$ARRIVAL_DIR" | while read FILE
do
    UUID=`uuidgen`
    logger "File \"$FILE\" ($UUID) has been created."
    
    # TODO - Trigger push notification
done
