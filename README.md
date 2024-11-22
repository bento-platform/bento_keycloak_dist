# Bento Keycloak distribution

Keycloak Docker image distribution for the Bento platform. 
This is only relevant if a Bento instance is responsible for running its own IdP.


## Building for production

To build a production image which is uploaded to the GitHub Container Repository (GHCR), go to the 
[Actions tab](https://github.com/bento-platform/bento_keycloak_dist/actions) and trigger the Build and Push workflow.


## Building the Docker image locally

First, since the base Keycloak image does not come with a package manager, `gosu` must be downloaded
and placed into the [build](./build) folder prior to running `docker build`:

```bash
cd build
wget https://github.com/tianon/gosu/releases/download/1.16/gosu-amd64
# and/or
wget https://github.com/tianon/gosu/releases/download/1.16/gosu-arm64
cd ..
```

Then, the Docker image can be built, specifying the correct target architecture such that the
right `gosu` executable is selected (`amd64` or `arm64`):

```bash
docker build . --build-arg TARGETARCH=arm64 -t bento_keycloak_dist:latest
```

The image can be run once it is built:

```bash
docker run -it bento_keycloak_dist:latest
```

Additional environment variables MUST be passed in for Keycloak to actually be functional.
