#!/bin/sh

# Requires `inotify-tools`, `uuid-runtime` to be installed
# Register in '/etc/rc3.d' to be started on boot

# Allow specifying the directory to monitor via command parameter
if [ -n "$1" ]; then
    ARRIVAL_DIR=$1
fi

inotifywait -mrq -e create --format %w%f "$ARRIVAL_DIR" | while read FILE
do
    UUID=`uuidgen`

    FILENAME=`basename "$FILE"`
    NEW_FILENAME="${ARRIVAL_DIR%/}/${UUID}_${FILENAME}"

    mv "$FILE" "$NEW_FILENAME"

    logger "File \"$NEW_FILENAME\" has been created."
    
    # TODO - Trigger push notification
done
