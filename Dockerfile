FROM ubuntu

RUN apt-get update && apt-get install -y software-properties-common && rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update && apt-get install -y wget php7.1 php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm php7.1-sqlite3 php7.1-bz2 && rm -rf /var/lib/apt/lists/*

RUN wget -O fb-tools.deb 'http://www.mengelke.de'`wget -q -O- http://www.mengelke.de/Projekte/FritzBox-Tools.html | grep -a -o -E '/Projekte/FritzBox;fb-tools.deb\?[a-f0-9]+'`
RUN dpkg -i fb-tools.deb

WORKDIR /tmp

CMD ["/bin/bash"]