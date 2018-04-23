# Sistema radius per autenticació de dispositius de xarxa (wireless, switch, etc.)

**Autor:** Arnau Esteban Contreras

**id_alumne:** isx47590131

**Descripció:** 


-------

# Guia

## 1. Instal·lació
Per començar a instal·lar *Freeradius* hem de mirar quins paquets tenim disponibles en la nostre distribució (en el meu cas fedora24 `dnf`):

```
$ sudo dnf list all freeradius
Last metadata expiration check: 4 days, 0:54:33 ago on Thu Apr 19 08:18:59 2018.
Available Packages
freeradius.x86_64                                                             3.0.10-2.fc24                                         
```

i l'instal·lem juntament amb el pequet utils:

```
$ sudo dnf -y install freeradius freeradius-utils
```



Podem veure que s'ha creat un usuari i un grup al fer-ho:

```
$ grep radius /etc/passwd
radiusd:x:95:95:radiusd user:/var/lib/radiusd:/sbin/nologin

$ grep radius /etc/group
radiusd:x:95:
```



Ara cal comprovar que tenim els ports que toquen disponibles per ser utilitzats. Tenim dos opcions, una que és desactivar el *Firewall* i l'altre que és permetre els ports 1812, 1813, 1645 i 1646 ([suport de cisco on explica els ports](https://supportforums.cisco.com/t5/wan-routing-and-switching/which-port-numbers-are-used-for-radius-accounting-and-radius/td-p/2494536 "Suport Cisco"))
En el meu cas ja tinc el *Firewall* desactivat:

```
iptables -L -n

Chain INPUT (policy ACCEPT)
Chain FORWARD (policy ACCEPT)
Chain OUTPUT (policy ACCEPT)
```


A continuació per executar *Freeradius* es recomana fer-ho en mode *debug*, el qual s'indica amb `-X`, per així saber els problemes que puguin succeir. Per encedre, apagar, reiniciar, etc. (en el cas de fedora, *systemd*) és fa amb:

``` 
$ sudo systemc start|stop|restart|enable|disable radiusd
```

Per comprovar que està en funcionament:

```
$ pidof radiusd 

o

$ ps -ax | grep radiusd

o

$ systemctl status radiusd
```



## 2. Configuració
