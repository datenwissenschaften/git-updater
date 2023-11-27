FROM ubuntu:22.04

LABEL maintainer="martin.franke@datenwissenschaften.com"
LABEL version="1.0"
LABEL description="Git Updater"
LABEL name="datenwissenschaften/git-updater"

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /opt

RUN apt-get -qq clean
RUN apt-get -qq autoremove -y
RUN apt-get -qq update
RUN apt-get -qq upgrade -y
RUN apt-get -qq install -y git

COPY scripts/bootstrap.sh ./bootstrap.sh
RUN chmod +x ./bootstrap.sh

CMD './bootstrap.sh'
