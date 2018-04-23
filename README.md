# Sistema radius per autenticació de dispositius de xarxa (wireless, switch, etc.)

**Autor:** Arnau Esteban Contreras

**id_alumne:** isx47590131

**Descripció:** 


-------

# Guia

## 1.
Per començar a instal·lar freeradius mirem quins paquets tenim disponibles (en el meu cas en fedora24 `dnf`):

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
