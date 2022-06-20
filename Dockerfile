FROM ghcr.io/linuxserver/baseimage-rdesktop-web:focal

# set version label
ARG BUILD_DATE
ARG VERSION
ARG REMMINA_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y \
    remmina \
    remmina-plugin-exec \
    remmina-plugin-nx \
    remmina-plugin-rdp \
    remmina-plugin-spice \
    remmina-plugin-kwallet \
    remmina-plugin-vnc \
    remmina-plugin-www \
    remmina-plugin-xdmcp && \
  echo "**** cleanup ****" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
VOLUME /config
