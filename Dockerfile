FROM quay.io/keycloak/keycloak:22.0

# Proxy should verify Host headers, so we are fine to turn this off.
# > Disables dynamically resolving the hostname from request headers
ENV KC_HOSTNAME_STRICT=false

# See https://www.keycloak.org/server/reverseproxy
# > The proxy forwards the HTTPS connection to Keycloak without terminating TLS.
# > The secure connections between the server and clients are based on the keys
# > and certificates used by the Keycloak server.
ENV KC_PROXY=passthrough

# Switch back to root so we can do some dynamic chown/chmodding based on bento_user
USER 0

ENTRYPOINT [ "/bin/bash", "/entrypoint.bash" ]
