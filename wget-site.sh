#!/bin/bash

if [ "$#" != 1 ]; then 
	echo 'Usage wget-site.sh http://www.site.com'
	exit 1
fi

SITE="$1"
DOMAIN=$(echo "$SITE" | egrep -o '(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,65}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})')

wget \
	--no-check-certificate \
	--random-wait \
	--recursive \
	--page-requisites \
	--user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)" \
	--mirror \
	-erobots=off \
	--convert-links \
	--domains $DOMAIN $SITE