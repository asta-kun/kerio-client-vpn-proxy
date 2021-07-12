FROM ubuntu:18.04

RUN mkdir /app
RUN mkdir /app/binaries
WORKDIR /app

RUN apt-get update
RUN apt-get install -y debconf openssl wget

RUN wget -O ./binaries/kerio.deb http://cdn.kerio.com/dwn/control/control-9.1.4-1535/kerio-control-vpnclient-9.1.4-1535-linux-amd64.deb
RUN apt-get purge -y wget

ENTRYPOINT bash -c "dpkg  -i ./binaries/kerio.deb"