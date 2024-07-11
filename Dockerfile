FROM quay.io/keycloak/keycloak:25.0

# Required for copying in gosu, since the keycloak image doesn't have a package manager
ARG TARGETARCH

# Switch back to root so we can do some root operations and dynamic chown/chmodding based on bento_user UID
USER 0

# Proxy should verify Host headers, so we are fine to turn this off.
# > Disables dynamically resolving the hostname from request headers
ENV KC_HOSTNAME_STRICT=false

# Copy our custom entrypoint in
COPY ./entrypoint.bash .

# Copy in gosu
COPY ./build/gosu-$TARGETARCH /gosu

# Make gosu executable
RUN chmod +x /gosu

ENTRYPOINT [ "/bin/bash", "/entrypoint.bash" ]
CMD [ "/opt/keycloak/bin/kc.sh", "start" ]
