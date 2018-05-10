#!/bin/bash
#@isx47590131
#10/05/2018
#script que introduce la red de los containers 
# el la configuración de los clietes
#--------------------------------------------------------------------------------
#ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ldapserver | cut -d . -f 1-3 )
ip=$(hostname -i | cut -d . -f 1-3)
network="$ip.0"
if [ -f 'clients.conf' ]
then
  sed -i "/client ldapserver {/{n;s/.*/\tipaddr = $network/}" clients.conf
fi

