## Security Folder

This folder contains scripts for managing client-credential security for this API w/ Auth0.

The following .TXT files MUST be renamed/copied as .ENV file and then populated with the indicated values. 

**NOTE: The .ENV files MUST NOT be included in the repo** (a .gitignore rule handles this right now). *DO NOT* include the client secret and other values in any .TXT file as they may be included in the repo and then be available for others to see/use.

* `auth.env` : stores key auth0 parameters for server-side security
* `auth-token.env`: holds output of `auth-token.sh` including valid access token
* `curl-auth.env` : config for using `curl` to make an HTTP request using a valid access token

_@mamund_
