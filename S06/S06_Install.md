## Guide d’installation et configuration – Serveur VoIP FREEBPX et serveur de messagerie - Ecotech Solutions

## Sommaire

1. [Mise en place du serveur VoIP FreePBX](#FreePBX)  
     [Partie 1 - Installation de FreePBX](#Ins.FPBX)  
     [Partie 2 - Configuration de FreePBX](#Cfg.FPBX)  
2. [Mise en place d'un serveur de messagerie](#messagerie)  


## 1.Mise en place du serveur VoIP FreePBX
<span id="FreePBS"/><span>

Création de la machine virtuel avec l'ISO SNG7-PBX16-64bit-2302-1.iso.
FreePBX fonctionne uniquement sous linux.

Installation de l'ISO :
- Choisir la configuration standard  


![cap1](/S06/Ressources/FreePBX/freePBX-01.png)

------------------------------------------------------------------------------------  

- Choisir la configuration GUI  
![cap1](/S06/Ressources/FreePBX/freePBX-02.png)

------------------------------------------------------------------------------------  

- FreePBX Standard  
![cap1](/S06/Ressources/FreePBX/freePBX-03.png)
------------------------------------------------------------------------------------  


- On redémarre le serveur FreePBX.
- Configuration de la carte réseau avec le DHCP
- Choix de la langue francaise pour la machine virtuel qui est par defaut en anglais
`localectl set-locale LANG=fr_FR.utf8`
`localectl set-keymap fr`
`localectl set-x11-keymap fr`

Maintenant que la VM Serveur FreePBX est configuré, nous allons nous y connecter via un client windows ou ubuntu.
- Connexion depuis un moteur de recherche l'adresse IP du serveur : `https://172.16.20.17`
![cap1](/S06/Ressources/FreePBX/freePBX-04.png)  
------------------------------------------------------------------------------------  

Une fois sur l'interface de FreePBX, on peut laisser l'installation se terminer et changer le mot de passe par défault par un mot de passe fort.
Suivre les étapes ci-dessous jusqu'au Dashboard.
![cap1](/S06/Ressources/FreePBX/freePBX-05.png)  

![cap1](/S06/Ressources/FreePBX/freePBX-06.png)  

![cap1](/S06/Ressources/FreePBX/freePBX-07.png)  

L'installation de FreePBX est terminé, il reste à configurer les utilisateurs et notre serveur.  

![cap1](/S06/Ressources/FreePBX/freePBX-09.png)

------------------------------------------------------------------------------------
