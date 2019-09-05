#!/bin/bash

ECO_INSTALL_DIR="/srv/eco-server"

ECO_FILENAME=$(wget -qO- https://s3-us-west-2.amazonaws.com/eco-releases/\?prefix\=EcoServer | grep -o -m 1 '[^>]*-beta.zip' | tail -n 1)

ECO_SERVER_URL="https://s3-us-west-2.amazonaws.com/eco-releases/$ECO_FILENAME"
ECO_LOCAL_FILE="$ECO_INSTALL_DIR/$ECO_FILENAME"

wget --progress=bar:force:noscroll $ECO_SERVER_URL -O $ECO_LOCAL_FILE || exit 1

unzip -q $ECO_LOCAL_FILE -d $ECO_INSTALL_DIR
rm $ECO_LOCAL_FILE

mv Configs DefaultConfigs
mv Storage DefaultStorage

exit 0
