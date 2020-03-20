FROM alpine:latest

LABEL MAINTAINER="lll9p <https://imtho.com>"
# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"

ENV TZ=Asia/Shanghai
ENV PUID=1000
ENV PGID=1000
ENV APPDIR="/srv/rrshareweb"

RUN addgroup -S rrshare -g $PGID \
    && ls -al . \
    && adduser -S rrshare -G rrshare -D -H -u $PUID \
    && echo "**** install packages ****" \
    && apk add --no-cache libstdc++ libc6-compat su-exec \
    && wget https://github.com/lll9p/rrshare/raw/master/rrshareweb_centos7.tar.gz \
	&& tar zxvf /rrshareweb_centos7.tar.gz -C /srv/ \
	&& rm -rf /rrshareweb_centos7.tar.gz \
    && mv $APPDIR/conf $APPDIR/conf_ \
    && wget https://github.com/lll9p/rrshare/raw/master/start.sh -O $APPDIR/start.sh \
    && chmod a+x $APPDIR/start.sh \
    && mkdir -p /mnt/config \
    && mkdir -p /opt/work/store


WORKDIR /
# ports and volumes
EXPOSE 3001 6714 30210
VOLUME ["/mnt/config","/opt/work/store"]
ENTRYPOINT ["$APPDIR/start.sh"]
