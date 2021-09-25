FROM debian:buster-slim

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y curl wget lsb-release gnupg

RUN wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb \
    && dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb \
    && rm percona-release_latest.$(lsb_release -sc)_all.deb \
    && apt-get update \
    && apt-get install -y percona-xtrabackup-24 qpress
