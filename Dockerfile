# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

# set version label
ARG BUILD_DATE
ARG VERSION
ARG REMMINA_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# title
ENV TITLE=Remmina

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y \
    remmina \
    remmina-plugin-exec \
    remmina-plugin-kiosk \
    remmina-plugin-kwallet \
    remmina-plugin-rdp \
    remmina-plugin-secret \
    remmina-plugin-spice \
    remmina-plugin-vnc \
    remmina-plugin-www \
    remmina-plugin-x2go \
    locales \
    locales-all \
    fonts-noto && \
  echo "**** cleanup ****" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

RUN locale-gen zh_TW.UTF-8 && update-locale LANG="zh_TW.UTF-8" LANGUAGE="zh_TW"
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config
