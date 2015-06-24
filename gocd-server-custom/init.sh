#!/bin/sh

BASEDIR=$(dirname $0)
PLUGIN_DIR=$BASEDIR/plugins
mkdir $PLUGIN_DIR

curl -fSL "https://github.com/voitau/gocd-script-executor-plugin/releases/download/0.2.1-custom/script-executor-0.2.1-custom.jar" \
    -o $PLUGIN_DIR/script-executor-plugin.jar
curl -fSL "https://github.com/voitau/gocd-docker-material-poller/releases/download/0.0.1-custom/docker-material-poller-0.0.1-custom.jar" \
    -o $PLUGIN_DIR/docker-material-poller.jar
