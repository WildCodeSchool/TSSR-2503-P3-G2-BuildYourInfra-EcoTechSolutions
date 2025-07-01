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


Dans ce tutoriel, nous allons apprendre à installer et configurer Apache Guacamole, une solution open source et gratuite que l'on peut mettre en place en tant que bastion d'administration, passerelle d'accès ou encore serveur de rebond. Une machine sous Debian 12 sera utilisée pour héberger l'application. L'hôte Apache Guacamole est positionné en DMZ puisqu'il doit être accessible depuis l'extérieur.  
Apache Guacamole devient un élément central de l'infrastructure puisqu'il sert de passerelle pour administrer les machines. 


## 1. [Installation et configuration du serveur Bastion avec Apache Guacamole]
<span id="Srv-Bastion"/><span> 

### A - Installer les prérequis d'Apache Guacamole  
<span id="pré-requis"/><span>  



### B - Compiler et installer Apache Guacamole "Server"  
<span id="pré-requis2"/><span>  



### C - Créer le répertoire de configuration  
<span id="Répertoire"/><span>  



### D - Installer Guacamole Client (Web App)  
<span id="Guacamole-client"/><span>  



### E - Base de données MariaDB pour l'authentification  
<span id="MariaDB"/><span>  



### F - Configuration depuis l'interface Web  
<span id="webapp"/><span>  



### G - Ajout d'une connexion RDP  
<span id="RDP"/><span>  



### H - Ajout d'une connexion SSH  
<span id="SSH"/><span>  



### I - Résolution erreur fréquente  
<span id="debogage"/><span>  

