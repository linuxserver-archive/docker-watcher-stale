FROM lsiobase/alpine:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	g++ \
	gcc \
	python3-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	git \
	p7zip \
	py3-pip \
	python3 \
	tar \
	unrar \
	unzip \
	xz && \
 echo "**** install pip packages ****" && \
 pip3 install --no-cache-dir -U \
	python-Levenshtein && \
 echo "**** install watcher ****" && \
 git clone https://github.com/nosmokingbandit/watcher3 /app/watcher && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root && \
 mkdir -p \
	/root

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 9090
VOLUME /config /downloads /movies
