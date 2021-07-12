FROM jarri1999/kerio-client-generate-config


RUN apt-get update
RUN apt-get install -y privoxy

COPY ./privoxy.conf /etc/privoxy/config

# fake setup
RUN echo "fake.com\nno\nfake\nfake\nfake" | dpkg -i ./binaries/kerio.deb
RUN rm -rf ./binaries

EXPOSE 8118
EXPOSE 1080
ENTRYPOINT bash -c "/etc/init.d/kerio-kvc start && /etc/init.d/privoxy start && tail -f /var/log/kerio-kvc/debug.log"