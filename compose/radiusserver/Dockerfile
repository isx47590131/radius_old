# @edt ASIX-M11 Curs 2017-2018
# ldapserver:dataDB
# servivor ldap creació interactiu
# --------------------------------
FROM fedora:24
MAINTAINER isx47590131 "@edt ASIX-M11 Curs 2017-2018"
RUN dnf -y update vi
RUN dnf -y install vim procps iputils iproute tree nmap mlocate man-db \
        freeradius-client freeradius freeradius-ldap freeradius-utils \
	freeradius-utils hostname
RUN mkdir /opt/docker
RUN rm /var/run/nologin
COPY  * /opt/docker/
RUN chmod +x /opt/docker/startup.sh /opt/docker/get_ip.sh
COPY clients.conf /etc/raddb/
COPY default /etc/raddb/sites-enabled/
COPY ldap /etc/raddb/mods-aviable/
RUN ln -s /opt/docker/ldap /etc/raddb/mods-enabled/
WORKDIR /opt/docker 
#CMD ["/usr/sbin/radiusd", "-d", "/etc/raddb"]
CMD ["/opt/docker/startup.sh"]

