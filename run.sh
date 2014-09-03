#!/bin/sh

docker build -t abonnasseau/osm-tile-server
docker run -d -P abonnasseau/osm-tile-server
