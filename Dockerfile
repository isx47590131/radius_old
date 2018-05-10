# @edt ASIX-M11 Curs 2017-2018
# ldapserver:dataDB
# servivor ldap creació interactiu
# --------------------------------
FROM fedora:24
MAINTAINER isx47590131 "@edt ASIX-M11 Curs 2017-2018"
RUN dnf -y update vi
RUN dnf -y install vim procps iputils iproute tree nmap mlocate man-db \
        openldap openldap-clients openldap-servers freeradius-client \
	freeradius-utils hostname
RUN mkdir /opt/docker
RUN rm /var/run/nologin
COPY  * /opt/docker/
COPY ldap.conf /etc/openldap/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
RUN /opt/docker/install.sh
WORKDIR /opt/docker 
CMD ["/opt/docker/startup.sh"]

