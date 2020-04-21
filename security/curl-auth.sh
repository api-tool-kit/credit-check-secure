#!/bin/bash

###################################################
# curl-auth.sh
# utility to make http request w/ an OAuth token
# 2020-04 mamund
#
# assumes:
# - curl
#
# reads:
# - authorization.env
#
###################################################

###################################################
echo
echo "OAuth Request Utility"
echo "================================"
date
echo 

#################################################o#
# local vars
auth="curl-auth.env"

###################################################
# load env values
if [ ! -f $auth ]
then
  echo "Missing $auth"
  exit 1
fi
source $auth

###################################################
# command line values
while getopts ":u:m:a:c:d:" opt; do
  case $opt in
    u) url="$OPTARG"
    ;;
    m) method="$OPTARG"
    ;;
    a) accept="$OPTARG"
    ;;
    c) contentType="$OPTARG"
    ;;
    d) data="$OPTARG"
    ;;
    \?) "Invalid option -$OPTARG [-u (url) -m (method) -a (accept) -c (contentType) -d (data) -h (help)]" >&2; exit
  esac
done

###################################################
# run request
echo "...: requesting $method $url $data"
curl --url $url --request $method --header "content-type:$contentType" --header "accept:$accept" --header "authorization: Bearer $token" --data "$data"

###################################################
# all done
echo

###################################################
# EOF
###################################################

