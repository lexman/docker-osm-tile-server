#!/bin/sh

docker pull debian
docker build .
docker run -d -P abonnasseau/osm-tile-server
