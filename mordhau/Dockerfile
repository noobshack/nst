ARG MORDHAU_VERSION="latest"
FROM cm2network/mordhau:${MORDHAU_VERSION}

LABEL REPO="https://github.com/mpmsimo/nst"

# Copy server config
COPY ./Game.ini /home/steam/mordhau-dedicated/Mordhau/Saved/Config/LinuxServer/Game.ini
#RUN chmod 644 /home/steam/mordhau-dedicated/Mordhau/Saved/Config/LinuxServer/Game.ini

ARG GIT_HASH
LABEL GIT_HASH=$GIT_HASH \
      MORDHAU_VERSION=${MORDHAU_VERSION}
ENV GIT_HASH=$GIT_HASH
