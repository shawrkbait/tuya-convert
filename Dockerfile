FROM phusion/baseimage:0.10.2

RUN apt-get update && apt-get install -y sudo iproute2 iputils-ping

RUN echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections

COPY docker/bin /usr/bin/

COPY . /usr/bin/tuya-convert

RUN apt-get install -y git iw dnsmasq rfkill hostapd screen curl build-essential python3-pip python3-setuptools python3-wheel python3-dev mosquitto haveged net-tools libssl-dev
RUN sudo -H python3 -m pip install --upgrade paho-mqtt tornado==5.0.2 git+https://github.com/drbild/sslpsk.git pycryptodomex

RUN mkdir -p /etc/service/tuya && cd /etc/service/tuya && ln -s /usr/bin/config.sh run
