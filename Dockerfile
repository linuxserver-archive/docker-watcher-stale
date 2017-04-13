FROM lsiobase/alpine:3.5

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install build packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
	g++ \
	gcc \
	python3-dev && \

# install runtime packages
 apk add --no-cache \
	git \
	p7zip \
	py3-pip \
	python3 \
	tar \
	unrar \
	unzip \
	xz && \

# install pip packages
 pip3 install --no-cache-dir -U \
	python-Levenshtein && \

# install watcher
 git clone https://github.com/nosmokingbandit/watcher3 /app/watcher && \

# cleanup
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
