FROM ubuntu:18.04

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

RUN apt update \
    && echo "debconf debconf/frontend select noninteractive" | debconf-set-selections \
    && apt install -y jq curl wget git bc python-pip \
    && pip install elasticsearch-curator \
    && wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt update \
    && apt install -y powershell \
    && echo "LC_ALL=C.UTF-8" >> /etc/profile \
    && apt clean -y
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

STOPSIGNAL SIGTERM
CMD  bash
