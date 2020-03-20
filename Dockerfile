LABEL MAINTAINER="lll9p <https://imtho.com>"

FROM alpine:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"

ENV TZ=Asia/Shanghai
ENV PUID=1000
ENV PGID=1000

WORKDIR /
RUN addgroup -S rrshare -g $PGID \
    && adduser -S rrshare -G rrshare -D -H -u $PUID \
    && echo "**** install packages ****" \
    && apk add --no-cache libstdc++ libc6-compat su-exec \
	&& tar zxvf /rrshareweb_centos7.tar.gz -C /rrshare/ \
	&& rm -rf /rrshareweb_centos7.tar.gz \
    && mv /rrshare/rrshareweb/conf /rrshare/rrshareweb/conf_ \
    && mkdir -p /mnt/config \
    && mkdir -p /mnt/store


# ports and volumes
EXPOSE 3001 6714 30210
VOLUME ["/mnt/config","/mnt/store"]
ENTRYPOINT ["/start.sh"]
