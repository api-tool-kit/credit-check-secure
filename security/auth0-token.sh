#!/bin/bash

###################################################
# utility to get a new api token from auth0
# 2020-04 mamund
#
# assumes:
# - curl
#
# reads:
# - auth0.env
#    - id, secret, url, audience
#
# overwrites:
# - auth0-token.env
#
###################################################

###################################################
echo
echo "Auth0 API Token Utility"
echo "================================"
date

###################################################
# local vars
token="auth0-token.env"
env="auth0.env"

###################################################
# load env values
if [ ! -f $env ]
then
  echo "Missing $env"
  exit 1
fi
source $env

###################################################
# delete any existing token file
if [ -z "$token" ]
then
  rm $token
fi  

###################################################
# run request
echo ": requesting token from Auth0 ..."
curl \
  --silent \
  --url $url \
  --request POST \
  --header "content-type:application/json" \
  --output $token \
  --data "{
    \"client_id\":\"$id\", 
    \"client_secret\":\"$secret\", 
    \"audience\":\"$audience\", 
    \"grant_type\":\"client_credentials\"
  }"

###################################################
# all done
echo ": results written to $token"
echo "** DONE **"
echo

###################################################
# EOF
###################################################

