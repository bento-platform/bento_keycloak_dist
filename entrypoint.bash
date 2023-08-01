#!/usr/bin/env bash

# If set, use the local UID from outside the container (or default to 1000)
USER_ID=${BENTO_UID:-1000}

echo "[/entrypoint.bash] using USER_ID=${USER_ID}"

# Starting from the Keycloak Dockerfile setup:
#   https://github.com/keycloak/keycloak/blob/main/quarkus/container/Dockerfile
# we edit /etc/passwd to set the new user ID for the `keycloak` user
sed -i "s/keycloak:x:1000/keycloak:x:${USER_ID}/g" /etc/passwd

# Drop into `keycloak` from root and execute the CMD specified for the image
exec /gosu keycloak "$@"
