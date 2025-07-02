## Guide d’installation et configuration – Serveur Bastion, VPN, Serveur RDS

## Sommaire

1. [Installation et configuration du serveur Bastion avec Apache Guacamole](#Srv-Bastion)  
     [A - Installer les prérequis d'Apache Guacamole](pré-requis)  
     [B - Compiler et installer Apache Guacamole "Server"](#pré-requis2)  
     [C - Créer le répertoire de configuration](#Répertoire)  
     [D - Installer Guacamole Client (Web App)](#Guacamole-client)  
     [E - Base de données MariaDB pour l'authentification](#MariaDB)   
     [F - Configuration depuis l'interface Web](#webapp)       
     [G - Ajout d'une connexion RDP](#RDP)  
     [H - Ajout d'une connexion SSH](#SSH)  
     [I - Résolution erreur fréquente](#debogage)


---


## 1. [Installation et configuration du serveur Bastion avec Apache Guacamole]
<span id="Srv-Bastion"/><span> 

Dans ce guide, nous allons apprendre à installer et configurer Apache Guacamole, une solution open source et gratuite que l'on peut mettre en place en tant que bastion d'administration, passerelle d'accès ou encore serveur de rebond. Une machine sous Debian 12 sera utilisée pour héberger l'application. L'hôte Apache Guacamole est positionné en DMZ puisqu'il doit être accessible depuis l'extérieur.  
Apache Guacamole devient un élément central de l'infrastructure puisqu'il sert de passerelle pour administrer les machines. 

### A - Installer les prérequis d'Apache Guacamole  
<span id="pré-requis"/><span>  

**NB**:_Pour l'installation nous sommes en Root, si vous êtes sur un comptes utilisateur, vous devez installer **sudo** puis ajouter l'utilisateur pour avoir la permission sur les commandes. Pensez à rajouter **sudo** devant les commandes qui vont suivre._


Nous devons commencer par installer les paquets indispensable au fonctionnement d'**Apache Guacamole**, pour cela sur votre machine Debian executé les commandes suivantes puis attendez la fin de l'installation :

```
apt-get update
apt-get install build-essential libcairo2-dev libjpeg62-turbo-dev libpng-dev libtool-bin uuid-dev libossp-uuid-dev libavcodec-dev libavformat-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libtelnet-dev libvncserver-dev libwebsockets-dev libpulse-dev libssl-dev libvorbis-dev libwebp-dev
```
![](/S08/Ressources/Installer-dependance-Apache-Guacamole-sur-Debian.png)

### B - Compiler et installer Apache Guacamole "Server"  
<span id="pré-requis2"/><span>  

- La partie "Server" d'Apache Guacamole doit être téléchargée et compilée en local pour s'installer. Nous utiliserons la dernière version à ce jour , à savoir la version 1.6.0. Pour identifier la dernière version, nous pouvons nous appuyer sur ce lien :


[Historique des versions d'Apache Guacamole](https://guacamole.apache.org/releases/)


- On se positionne dans le répertoire "/tmp" et on télécharge l'archive tar.gz avec la commande :


```
cd /tmp
wget https://downloads.apache.org/guacamole/1.5.5/source/guacamole-server-1.5.5.tar.gz
```

- Une fois le téléchargement terminé, on décompresse l'archive tar.gz et on se positionne dans le répertoire obtenu :
```
tar -xzf guacamole-server-1.6.0.tar.gz
cd guacamole-server-1.6.0/
```
- On prépare ensuite la compilation pour vérifier la présences des dépendances installer précédémment :
```
sudo ./configure --with-systemd-dir=/etc/systemd/system/
```
- Vous devriez avoir toutes les dépendances avec le status **YES** comme ceci : 

![](/S08/Ressources/Compiler-Guacamole-sur-Debian-12.png)

- Une fois que tout est Ok, poursuivez avec la compilation du code source de Guacamole-Server:
```
Make
```

- On installe ensuite le composant Guacamole Server :
```
Make Install
```
![](/S08/Ressources/Compiler-Guacamole-sur-Debian-12-Exemple.png)

> **La partie serveur d'Apache Guacamole est installée**, il reste cependant quelques étapes à réalisée


- Il faut mettre a jours les liens entre guacamole-server et les librairies avec ``sudo ldconfig``


- On démarre le service **"guacd"** et on active son démarrage automatique :
```
sudo systemctl daemon-reload
sudo systemctl enable --now guacd
```

- Vérifiez le statut d'Apache Guacamole Server : ``sudo systemctl status guacd``


### C - Créer le répertoire de configuration  
<span id="Répertoire"/><span>  

- Nous allons crée l'arborescence pour la configuration d'Apache Guacamole. Cela va donner le répertoire ``"/etc/guacamole"`` avec les sous-répertoires ``"extensions"`` et ``"lib"`` nécéssaire pour le stockage des données dans une base de données **MariadDB/MySQL**.


```
sudo mkdir -p /etc/guacamole/{extensions,lib}
```

### D - Installer Guacamole Client (Web App)  
<span id="Guacamole-client"/><span>  

- Pour la **Web App** correspondante à Apache Guacamole, et donc à la partie cliente, nous avons besoin d'un serveur **Tomcat 9**. Attention **Tomcat 10**, distribué par défaut via les dépôts de Debian 12, n'est pas pris en charge par Apache Guacamole. Nous devons ajouter le dépôt de Debian 11 sur notre machine Debian 12 afin de pouvoir télécharger les paquets correspondants à Tomcat 9.
- Nous allons donc ajouter un nouveau fichier source pour Apt. Créez le fichier suivant :


```
sudo nano /etc/apt/sources.list.d/bullseye.list 
# Ajoutez cette ligne :
deb http://deb.debian.org/debian/ bullseye main
# Enregistrez et fermez le fichier.
```

- Mettez ensuite à jour le cache des paquets avec ``sudo apt-get update``


- Effectuez l'installation des paquets Tomcat 9 sur Debian 12 avec cette commande :
```
sudo apt-get install tomcat9 tomcat9-admin tomcat9-common tomcat9-user
```

![](/S08/Ressources/Installer-Tomcat-9-sur-Debian-12-800x201.png)


- Nous allons ensuite télécharger la dernière version de la Web App d'Apache Guacamole depuis le dépôt officiel. On se positionne dans **"/tmp"** et on télécharge la **Web App**, ce qui revient à télécharger un fichier avec l'extension ".war". Ici, la version 1.6.0 est téléchargée.

```
cd /tmp
wget https://downloads.apache.org/guacamole/1.6.0/binary/guacamole-1.6.0.war
```

- Une fois téléchargé, on le déplace dans la librairie de Web App de Tomcat9 avec :
```
sudo mv guacamole-1.6.0.war /var/lib/tomcat9/webapps/guacamole.war
# On relance ensuite les services Tomcat9 et Guacamole
sudo systemctl restart tomcat9 guacd
```

> Voilà, Apache Guacamole Client est installé !


### E - Base de données MariaDB pour l'authentification  
<span id="MariaDB"/><span>  

- Nous allons maintenant déployer MariaDB Server (ou MySQL Server, au choix) sur Debian pour qu'Apache Guacamole s'appuie sur une base de données. Elle sera utilse pour stocker toutes les informations de l'application.

> On installe le paquet MariaDB Server
```
sudo apt-get install mariadb-server
```

> Puis, on exécute le script ci-dessous pour sécuriser un minimum notre instance (changer le mot de passe root, désactiver les accès anonymes, etc...). Rentrez la configuration que vous voulez pour votre base de données.
```
sudo mysql_secure_installation
```

> Une fois cette étape effectuée, on va se connecter en tant que root à notre instance MariaDB :
```
mysql -u root -p
```

Nous allons maintenant créer la base de données "guacadb" avec l'utilisateur "Lucia_Morel" associé au mot de passe Azerty1* (vous devez adaptez ces valeurs), Cet utilisateur dispose de quelques droits sur la base de données.


```
CREATE DATABASE guacadb;
CREATE USER 'Lucia_Morel'@'localhost' IDENTIFIED BY 'Azerty1*';
GRANT SELECT,INSERT,UPDATE,DELETE ON guacadb.* TO 'Lucia.Morel'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

![](/S08/Ressources/Base-de-donnees-MariaDB-MySQL-pour-Apache-Guacamole-800x367.png)


- On va maintenant télécharger l'extension MySQL pour Apache Guacamole : 
```
cd /tmp
wget https://downloads.apache.org/guacamole/1.6.0/binary/guacamole-auth-jdbc-1.6.0.tar.gz
# On décompresse l'archive tar.gz
tar -xzf guacamole-auth-jdbc-1.6.0.tar.gz
# On déplace le fichier ".jar" dans le répertoire "/etc/guacamole/extensions/"
sudo mv guacamole-auth-jdbc-1.6.0/mysql/guacamole-auth-jdbc-mysql-1.6.0.jar /etc/guacamole/extensions/
```

- Ensuite, le connecteur MySQL doit être téléchargé depuis le site de MySQL (peu importe si vous utilisez MariaDB ou MySQL).

- Utilisez le lien ci-dessous pour repérer le lien de la dernière version en choisissant "Platform Independent", puis ajouter le liens entre parenthèse situé en dessous de  "Compressed TAR Archive".
[Connecteur MySQL](https://dev.mysql.com/downloads/connector/j/)

![](/S08/Ressources/MySQL_Connector.png)

- On lance ensuite le téléchargement 
```
cd /tmp
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-9.3.0.tar.gz
# On décompresse l'archive tar.gz :
tar -xzf mysql-connector-j-9.1.0.tar.gz
# On déplace le fichier .jar du connecteur vers le répertoire "lib" d'Apache Guacamole :
sudo cp mysql-connector-j-9.1.0/mysql-connector-j-9.1.0.jar /etc/guacamole/lib/
```

- Les dépendances sont déployées, mais nous n'avons pas encore fini cette intégration avec MariaDB. Il faut importer la structure de la base de données Apache Guacamole dans notre base de données **"guacadb"**. Pour cela, on va importer tous les fichiers SQL situés dans le répertoire **"guacamole-auth-jdbc-1.6.0/mysql/schema/"**

```
cd guacamole-auth-jdbc-1.6.0/mysql/schema/
cat *.sql | mysql -u root -p guacadb
```

- Une fois que c'est fait, on va créer et éditer le fichier "guacamole.properties" pour déclarer la connexion à MariaDB. Ce fichier peut être utilisé pour d'autres paramètres, selon vos besoins.
```
sudo nano /etc/guacamole/guacamole.properties
```

- Dans ce fichier, insérez les lignes ci-dessous en adaptant les trois dernières lignes avec vos valeurs :
```
# MySQL
mysql-hostname: 127.0.0.1
mysql-port: 3306
mysql-database: guacadb
mysql-username: Lucia_Morel 
mysql-password: Azerty1*
# Enregistrez et fermez le fichier
```

- Editez le fichier **"guacd.conf"** pour déclarer le serveur Guacamole (ici, on déclare une connexion locale sur le port par défaut, à savoir 4822).

```
sudo nano /etc/guacamole/guacd.conf
```
- Puis rentrez ceci dans le fichier :
```
[server] 
bind_host = 0.0.0.0
bind_port = 4822
```


### F - Configuration depuis l'interface Web  
<span id="webapp"/><span>  



### G - Ajout d'une connexion RDP  
<span id="RDP"/><span>  



### H - Ajout d'une connexion SSH  
<span id="SSH"/><span>  



### I - Résolution erreur fréquente  
<span id="debogage"/><span>  

