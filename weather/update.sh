#!/bin/sh

set -e
TMP_UPDATE_FILE="$HOME/.cache/conky-weather-tmp.json"
UPDATE_FILE="$HOME/.cache/conky-weather.json"

result=$(curl -s https://query.yahooapis.com/v1/public/yql \
   -d q='select * from weather.forecast where woeid = 455827 and u="c"' \
   -d format=json > $TMP_UPDATE_FILE)

count=$(cat $TMP_UPDATE_FILE | jq .query.count)
if [ "$count" -gt 0 ]
then
  cp -rf "$TMP_UPDATE_FILE" "$UPDATE_FILE"
fi