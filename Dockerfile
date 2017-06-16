FROM debian:jessie
MAINTAINER True Stealth

RUN apt-get update && apt-get install -y \
    wget \
    && rm -r /var/lib/apt/lists/*

RUN wget http://ftp.debian.org/debian/pool/main/l/ldap-account-manager/ldap-account-manager_5.7-1_all.deb && \
    dpkg -i ldap-account-manager_5.7-1_all.deb.deb; \
    rm ldap-account-manager_5.7-1_all.deb.deb && \
    apt-get update &&  apt-get -fy install && rm -r /var/lib/apt/lists/*

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD /run.sh
