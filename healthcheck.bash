#!/usr/bin/env bash

if [[ "${KC_HTTP_ENABLED}" == 'true' ]]; then
  curl http://localhost:8080
else
  curl https://localhost:8443 -k
fi
