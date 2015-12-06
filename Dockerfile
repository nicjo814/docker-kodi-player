FROM phusion/baseimage:0.9.16

ENV DEBIAN_FRONTEND noninteractive
ENV HOME="/root"
ENV TERM=xterm
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

ADD nvidia-driver.run /tmp/nvidia-driver.run
RUN sh /tmp/nvidia-driver.run -a -N --ui=none --no-kernel-module
#RUN sh /tmp/nvidia-driver.run -a -N --ui=none
RUN rm /tmp/nvidia-driver.run

RUN apt-get install -y software-properties-common && \
add-apt-repository ppa:team-xbmc/ppa && \
apt-get update && \
apt-get install -y \
kodi \
mysql-client

CMD /usr/bin/kodi-standalone
