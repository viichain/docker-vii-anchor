FROM arthurzang/chain-base:v0.1

MAINTAINER arthurzang <vii.vip>

EXPOSE 5432
EXPOSE 8000
EXPOSE 11625
EXPOSE 11626

ADD dependencies /
RUN ["chmod", "+x", "dependencies"]
RUN /dependencies

ADD install /
RUN ["chmod", "+x", "install"]
RUN /install

RUN ["mkdir", "-p", "/opt/viichain"]
RUN ["mkdir", "-p", "/opt/viichain-default"]
RUN ["touch", "/opt/viichain/.docker-ephemeral"]

RUN useradd --uid 10011001 --home-dir /home/viichain --no-log-init viichain \
    && mkdir -p /home/viichain \
    && chown -R viichain:viichain /home/viichain

RUN ["ln", "-s", "/opt/viichain", "/viichain"]
RUN ["ln", "-s", "/opt/viichain/core/etc/vii-core.cfg", "/vii-core.cfg"]
RUN ["ln", "-s", "/opt/viichain/horizon/etc/vii-horizon.env", "/vii-horizon.env"]
ADD common /opt/viichain-default/common
ADD core /opt/viichain-default/core

ADD start /
RUN ["chmod", "+x", "start"]

ENTRYPOINT ["/init", "--", "/start" ]
