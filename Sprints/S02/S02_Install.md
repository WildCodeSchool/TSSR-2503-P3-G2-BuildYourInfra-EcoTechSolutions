## Guide d’installation et configuration – Serveurs et clients - Ecotech Solutions

## Sommaire

1. [Installation des rôles ADDS, DHCP, DNS – SERVEUR "WINSRV-ADDS-DHCP-DNS"](#installation-des-rôles-adds-dhcp-dns--winsrv-adds-dhcp-dns)
   - [Partie 1 – Installation des rôles](#partie-1--installation-des-rôles)
   - [Partie 2 – Installation du DC Active Directory (ADDS)](#partie-2--installation-du-dc-active-directory-adds)
   - [Partie 3 – Configuration du DHCP](#partie-3--configuration-du-dhcp)
   - [Partie 4 – Configuration du DNS](#partie-4--configuration-du-dns)
2. [Installation de Windows Server Core – "SERVEUR WINCORESRV-ADDS"](#installation-de-windows-server-core--wincoresrv-adds)
3. [Installation de Debian avec GLPI – SERVEUR "DEBSRV-GLPI"](#installation-de-debian-avec-glpi--debsrv-glpi)
4. [Installation d’un poste client d'administration Ubuntu – CLIENT "DT-DSI-Admin"](#installation-dun-client-ubuntu--dt-dsi-admin)


### Installation et configuration des rôles ADDS, DHCP et DNS
#### Serveur : WINSRV-AD-DHCP-DNS  
#### Forêt : ecotechsolutions.lan
#### IP Statique : 172.16.40.1
#### Masque Réseau : 255.255.0.0
#### Passerelle : 172.16.255.254
---

### PARTIE 1 – Installation des rôles

#### Étape 1 : Ouvrir le Gestionnaire de serveur
- Lancer "Gestionnaire de serveur"
- Cliquer sur "Ajouter des rôles et fonctionnalités"

#### Étape 2 : Assistant d’ajout de rôles
- Type d'installation : Installation basée sur un rôle ou une fonctionnalité

![Installation ADDS](https://github.com/user-attachments/assets/f2d59266-fe89-4548-a7ef-0b7931ac5c84)


- Sélection du serveur : WINSRV-AD-DHCP-DNS

![Choix du serveur](https://github.com/user-attachments/assets/18cef3c2-7bb7-41f7-881a-8a1fa066904e)



#### Étape 3 : Sélection des rôles
Cocher les rôles suivants :
- Services de domaine Active Directory (ADDS)
- Serveur DHCP
- Serveur DNS  
Valider les fonctionnalités supplémentaires si demandé.

![Cocher les rôles](https://github.com/user-attachments/assets/43dc02c0-cea4-4b78-9acc-462e596eae87)


#### Étape 4 : Confirmation
- Lancer l'installation
- L'installateur doit indiqué "Installation succeeded". Les rôles correcetement installés sont visibles en vert dans le server manager.

![Installation succeeded](https://github.com/user-attachments/assets/d21ac8f9-e449-4cfe-a884-939a6b647f94)




---

## PARTIE 2 – Installation du DC Active Directory (ADDS)

#### Étape 1 : Promouvoir le serveur en contrôleur de domaine
- Après l'installation, cliquer sur l'alerte "Promouvoir ce serveur en contrôleur de domaine"

![Promotion DC](https://github.com/user-attachments/assets/cc6768ae-dce7-4f34-8663-136bba7390ff)


#### Étape 2 : Configuration du déploiement
- Choisir "Ajouter une nouvelle forêt"
- Nom du domaine racine : ecotechsolutions.lan

![Root domain name](https://github.com/user-attachments/assets/40793380-011f-45cc-ac5f-313072cc4b66)


#### Étape 3 : Options du contrôleur de domaine
- Niveau fonctionnel de forêt/domaine : Windows Server 2016 ou 2022
- Cochez :
  - Serveur DNS
  - Catalogue global
- Définir un mot de passe DSRM (récupération d'urgence)

#### Étape 4 : Configuration DNS
- Laisser les options par défaut
- Ignorer les avertissements sur la délégation si présents

#### Étape 5 : Nom NetBIOS 
- Nom généré automatiquement : ECOTECHSOLUTIONS

#### Étape 6 : Chemins des bases AD
Laisser les chemins par défaut :
- Base de données : C:\Windows\NTDS
- Fichiers journaux : C:\Windows\NTDS
- SYSVOL : C:\Windows\SYSVOL

#### Étape 7 : Vérification & Installation
- Vérifier le résumé
- Laisser l’analyse de prérequis se terminer
- Cliquer sur "Installer"

![Fin configuration DC](https://raw.githubusercontent.com/WildCodeSchool/TSSR-2503-P3-G2-BuildYourInfra-EcoTechSolutions/refs/heads/main/Ressources/M%C3%A9diath%C3%A8que/Captures%20d'%C3%A9cran%20d%C3%A9ploiement%20ADDS%20DHCP%20DNS/Capture%20d'%C3%A9cran%207%20-%20validation%20installation.png)

- Le serveur redémarrera automatiquement

...

### Partie 3 – Configuration du DHCP
...

### Partie 4 – Configuration du DNS

---

## Résultat attendu
Le serveur WINSRV-AD-DHCP-DNS devient :
- Contrôleur de domaine pour la forêt ecotechsolutions.lan
- Serveur DNS intégré
- Serveur DHCP prêt à être configuré


## Configuration des rôles DHCP et DNS – WINSRV-ADDS-DHCP-DNS
...

# A - Installation de Windows Server Core – WINCORESRV-ADDS

## 1° | Installation et configuration de notre Windows Serveur 2022 core :
-------------------------------
## - Configuration initiale du serveur core -
##### **Changer le nom du serveur :** 
- Aller dans **Computer name** et suivre les menus pour modifier le nom du serveur. Dans notre cas nous l'avons nommer selon notre convention de nommage soit => ``WINCORESRV-ADDS``

##### **Configuration Réseau du serveur core :**
- Allez dans **Network settings** puis suivre les menus pour modifier l'adresse IP de la carte réseau ainsi que l'adresse IP du DNS. Ou bien on peut aussi effectuer la configuration en Powershell avec les commandes suivantes :
**NB : Les adresses sont à adapter à votre réseau**
```
1 New-NetIPAddress -IPAddress "172.16.10.20" -PrefixLength "24" -InterfaceIndex (Get-NetAdapter).ifIndex
2 Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).ifIndex -ServerAddresses ("127.0.0.1")
```
- Vérifier votre configuration avec la commande ``Get-NetIPAdress`` permettant d'afficher les détails de votre interface réseau.

## 2° | Installation des rôles :
-------------------
##### **Fonctionnalités nécéssaire en tant que controleur de domaine :**
Nous avons besoin de ces différents outils :
- **RSAT-AD-Tools**
- **AD-Domain-Services**
- **DNS**

Pour cela, executer successivement ces 3 lignes de commandes PowerShell : 
```
1 Add-WindowsFeature -Name "RSAT-AD-Tools" -IncludeManagementTools -IncludeAllSubFeature
2 Add-WindowsFeature -Name "AD-Domain-Services" -IncludeManagementTools -IncludeAllSubFeature
3 Add-WindowsFeature -Name "DNS" -IncludeManagementTools -IncludeAllSubFeature
```

# B - Rejoindre le domaine EcoTechSolution  

 #### Étape 1 :   
 - Dans le menu principal, sélectionner PowerShell avec l’option 15  
![main_menu](https://github.com/user-attachments/assets/09c2daf3-d7da-4525-b8f1-908aa40163ae)  
  
#### Étape 2 :  
- Entrer la commande suivante :  
> Add-Computer -DomainName "EcoTechSolution.lan" -Credential "EcoTechSolution\Administrator" -Restart
  
![commande](https://github.com/user-attachments/assets/d7ddd9fc-8a67-4e87-acda-8356cbe62b5f)
  
#### Étape 3 :  
- Une fenêtre s’ouvre, vous invitant à entrer le mot de passe. Entrer le mot de passe : Azerty1*  
Après cela, la machine va redémarrer.  
![password](https://github.com/user-attachments/assets/7a30872b-adcc-4d3a-9a81-ccb54e7f018e)
  
#### Étape 4 :  
- Une fois redémarrer, vous pouvez observer sur la ligne Domain/workgroup, que vous êtes passez de « Workgroup » à « EcoTechSolution.lan ». Cela signifie que votre machine à bien été ajouté au  domain.  
![domain](https://github.com/user-attachments/assets/f920946f-5cca-4e62-a6f9-cfc4823ca5be)
  
#### Étape 5 :  
- Redémarrer la machine, lors du déverrouillage du clavier, appuyer 2 fois sur la touche ESC (echap) pour changer de compte.  
![switch_account](https://github.com/user-attachments/assets/06e22116-7bcb-4808-8d06-a328b8367133)
  
#### Étape 6 :  
- Sélectionner « Other user »  
![other_user](https://github.com/user-attachments/assets/32c73da7-efd9-4a96-bf5b-078bdc8e0afa)
  
#### Étape 7 :  
- Dans « User name » entrer : ECOTECHSOLUTION\Administrator  
Ensuite, appuyer sur la touche « Tabulation » pour passer sur la ligne du mot de passe (Password) et entrer le mot de passe : Azerty1* , puis Entrée.  
![login](https://github.com/user-attachments/assets/4bfa2503-211d-4a8d-a181-278e2049a9db)
  
#### Étape 8 :  
- Une fois dans le menu, sélectionner l’option 15 (PowerShell)  
![menu](https://github.com/user-attachments/assets/65e962e0-501f-497d-8558-dc3114858f5c)
  
#### Étape 9 :  
- Vérifier que vous êtes bien connecté au compte Administrator du domain avec la commande : whoami  
![verification](https://github.com/user-attachments/assets/2783cde4-b098-46cf-8ebe-7a9b4798afed)
  
#### Étape 10 :  
- Vérification que le serveur apparaît bien comme membre du domaine dans la console Active Directory :  
  Dans la barre de recherche du menu démarrer, taper : dsa.msc, une fenêtre (Active Directory Users and Computers) s’ouvre  
![verification_domain_member](https://github.com/user-attachments/assets/e3e3319e-dd32-4cf9-b027-d073ab11caad)
  
#### Étape 11 :  
- Dans l’arborescence du domaine (EcoTechSolution), dérouler le menu  
![verification_domain_member_part_2](https://github.com/user-attachments/assets/71c2832b-1efe-4190-83ca-14e8d40fdbf4)
  
#### Étape 12 :  
- Cliquer sur « Computer », vous verrez apparaître dans la fenêtre centrale la machine server core  
![verification_domain_member_part_3](https://github.com/user-attachments/assets/cb5b955d-6465-426f-8aaa-ceb9ce85d252)







## Installation de Debian avec GLPI – DEBSRV-GLPI
...

## Installation d’un client Ubuntu – DT-DSI-Admin
...

