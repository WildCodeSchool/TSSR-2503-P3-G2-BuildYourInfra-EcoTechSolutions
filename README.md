# TSSR-2503-P3-G2-BuildYourInfra-EcoTechSolutions

  ## Sommaire 

- [🎯 Présentation générale du projet](#presentation-du-projet)  
- [📜 Introduction](#introduction)  
- [👥 Membres du groupe par sprint](#membres-du-groupe-par-sprint)  
- [⚙️ Prérequis](#Prérequis)  
- [🧗Difficultés rencontrées💡Solutions trouvées](#Difficultés-rencontrées-et-solutions-trouvées)  
- [🚀 Améliorations possibles](#ameliorations-possibles)  

---  

# 🎯 Présentation générale du projet  
<span id="presentation-du-projet"></span>  
  
  

### 🏢 L'entreprise cliente  

![](/Ressources/Logos/EcoTechSolution_Logo.png)

**EcoTechSolutions**, implantée à Bordeaux, est un acteur innovant dans le domaine des solutions IoT dédiées à la gestion intelligente de l’énergie et des ressources. En collaborant étroitement avec le gouvernement et les leaders du secteur énergétique, elle conçoit et déploie des systèmes de surveillance avancés pour optimiser la consommation, réduire les émissions carbone et accompagner activement la transition écologique.  
Forte de son expertise technologique et de son esprit d'innovation, **EcoTechSolutions** s’impose comme un moteur essentiel de l’économie verte.  
L’entreprise rassemble aujourd’hui 251 talents, répartis au sein de 7 départements spécialisés, et s’enrichit régulièrement de compétences extérieures, intervenant sur des missions ponctuelles ou à temps plein.  

### 💼 Le groupe de projet  

_**Wilderz**_ est une société fictive et prestataire de services. Elle est mandatée par EcoTech Solutions afin de mettre en place une nouvelle infrastructure réseau.  
Nous allons réunir toutes nos compétences et ressources acquises durant la formation TSSR pour mener à bien ce projet.     
**DSI de cette société** : Dominique Colleville.  

### 🧑‍🔧 L'équipe technique   
  
Voici les 5 membres qui composent le groupe : 
   
Florian Cheron ; Lloyd Morlet ; Alan Coeurjoly ; Sheldon Thurm ; Jonathan Gorine
  
  
### Objectif final  
  
- Mettre en place une architecture réseau structurée, complète et fonctionnelle

-------------  
  
## 📜 Introduction  
<span id="introduction"></span>  

Vous êtes une entreprise toute jeune voir déjà leader dans votre domaine ? Mais problème : votre infrastructure réseau à des failles et nécéssite des améliorations ?  
Vous êtes au bon endroit !  

<img src="https://github.com/user-attachments/assets/7d9bd1c3-a10d-43fc-ba69-f814ac47dcee" width="600" height="400">  
  
_**Wilderz**_ est une entreprise française spécialisée dans les systèmes et réseaux informatiques.  
_Notre mission_ : concevoir et déployer des infrastructures réseaux innovantes, performantes et sécurisées, afin de garantir une meilleure visibilité et une protection renforcée des données.  
  
Nous accompagnons aussi bien les particuliers que les entreprises et les institutions publiques, en leur proposant des solutions sur mesure adaptées à leurs besoins et à l’évolution constante des technologies numériques.  
Acteur engagé à l’échelle nationale, Wilderz place la fiabilité, la sécurité et la transparence au cœur de chacun de ses projets.  

  ------------------------
## 👥 Les rôles par sprint  
<span id="membres-du-groupe-par-sprint"></span>  
  
  
  
### 📅 Sprint 1 

| Membre         | Rôle            |  Missions                               |
| -------------- | --------------- | --------------------------------------- |
|   Sheldon      | Product Owner   |  Gestion de la relation commercial inter-entreprise ; Préparation de la présentation sur slide     |
|   Lloyd        | Scrum Master    |  Management d'équipe et veille organisationnelle ; Préparation du schéma réseau  |
|   Alan         | Technicien      |  Planification des objectifs par sprints  |
|   Florian      | Technicien      |  Nomenclature et convention de nommage    |
|   John         | Technicien      |  Documentation technique sur Git-Hub      |
|   Tous      |  - |  Documentation technique des missions de chacun sur GitHub  | 

### 📅 Sprint 2 & 3

| Membre         | Rôle            |  Missions                               |
| -------------- | --------------- | --------------------------------------- |
|   Sheldon      | Technicien   |  Créations OU/Groupe,GPO sur le serveur Windows GUI / Automatisation de la création d'utilisateur dans l'ActiveDirectory extrait à partir d'un fichier CSV    |
|   Lloyd        | Scrum Master    |  Création du serveur Linux Debian et installation de GPLI sur le serveur  |
|   Alan         | Technicien      |  Installation du serveur Windows 2022 GUI avec AD-DS,DNS,DHCP / Installation et configuration SSSD sur PC d'Administration /  Mise en place des GPO sécurités et Standards   |
|   Florian      | Product Owner      |  Installation et configuration du Serveur Windows Core 2022 / Mise en place de la réplication intrasite pour les deux serveurs windows en tant que DC / Automatisation de la création d'utilisateur dans l'ActiveDirectory extrait à partir d'un fichier CSV  |
|   John         | Technicien      |  Installation et configuration du PC d'Administration sur Ubuntu / Installation des logiciels (Wireshark, OpenSSH ...) sur le PC d'Administration / Installation et configuration du SSSD sur le PC d'Administration , intégration au Domaine AD et gestions des accès  |  
|   Tous      |  - |  Documentation technique des missions de chacun sur GitHub  |

### 📅 Sprint 4 

| Membre         | Rôle            |  Missions                               |
| -------------- | --------------- | --------------------------------------- |
|   Sheldon      | Scrum Master   |  Mise en place du pfSense, Mise en place des dossiers partagés et script ajout utilisateurs     |
|   Lloyd        | Technicien    |  Gestion de la télémétrie sur les clients Windows 10/11 |
|   Alan         | Technicien      |  Mise en place du pfSense, début routage avec ubuntu, mise en place des dossiers partagés  |
|   Florian      | Technicien      | Mise en place du serveur de stockage et d'un RAID 1. Travail sur le script ajout utilisateurs. Ajout GPO Standard    |
|   John         | Product Owner      |  Installation et configuration de SSH et Wireshark sur PC admin. Mise en place du raid 1. Travail sur le script ajout utilisateurs      |
|   Tous      |  - |  Documentation technique des missions de chacun sur GitHub  |

### 📅 Sprint 5 

| Membre         | Rôle            |  Missions                               |
| -------------- | --------------- | --------------------------------------- |
|   Sheldon      | Technicien   |  Mise en place de la sauvegarde de données et de la planification de sauvegarde    |
|   Lloyd        | Product Owner    |  Mise en place de la supervision du réseau, mise en place du serveur WEB  |
|   Alan         | Technicien      |  Travail sur le partage de fichier et mappage réseau, mise en place de la sauvegarde et de sa planification  |
|   Florian      | Scrum Master      |  Débogage et création des GPO Standard / Sécurité, travail sur le mappage et la sauvegarde données, début du script de restriction d'accès selon horaires    |
|   John         | Technicien      |  Mise en place de la supervision du réseau, mise en place de la sauvegarde de données et sa planification      |
|   Tous      |  - |  Documentation technique des missions de chacun sur GitHub  |

### 📅 Sprint 6 

| Membre         | Rôle            |  Missions                               |
| -------------- | --------------- | --------------------------------------- |
|   Sheldon      | Technicien    |  Mise en place du serveur de messagerie (IredMail, Thunderbird)     |
|   Lloyd        | Technicien    |  Mise en place du serveur VoIP (FreePBX et 3CX)  |
|   Alan         | Product Owner      |  Mise en place du serveur VoIP (FreePBX et 3CX), finition du script de restriction d'horaires  |
|   Florian      | Technicien      |  Mise en place du serveur VoIP (FreePBX et 3CX), finition du script de restriction d'horaires   |
|   John         | Scrum Master      |  Mise en place du serveur de messagerie, finition du script de restriction d'horaires, (IredMail, Thunderbird)      |
|   Tous      |  - |  Documentation technique des missions de chacun sur GitHub  |
 

 ### 📅 Sprint 7

| Membre         | Rôle            |  Missions                               |
| -------------- | --------------- | --------------------------------------- |
|   Sheldon      | Scrum Master    |  AD Rôles FSMO, Mise en place de WSUS     |
|   Lloyd        | Technicien    |  Contenerisation de GLPI, serveur WEB, Proxy, ajout de IredMail, GLPI, Proxy, FreePBX en DMZ  |
|   Alan         | Technicien      |  AD Rôles FSMO, Debogage Mappage, CT Routeur  |
|   Florian      | Product Owner      |  Contenerisation, Proxy   |
|   John         | Technicien      |  Serveur WSUS, Stockage, modification RAID 1      |
|   Tous      |  - |  Documentation technique des missions de chacun sur GitHub  |


 ### 📅 Sprint 8

| Membre         | Rôle            |  Missions                               |
| -------------- | --------------- | --------------------------------------- |
|   Sheldon      | Technicien    |  Mappage dossier perso, vpn site à site, serveur rds     |
|   Lloyd        | Scrum Master    |  Routage réseau interne, vpn site à site, serveur rds  |
|   Alan         | Technicien      |  Mappage, Serveur bastion, vpn, serveur rds |
|   Florian      | Product Owner      |  Serveur bastion, vpn, rds   |
|   John         | Product Owner      |  Serveur bastion, serveur rds, firewall     |
|   Tous      |  - |  Documentation technique des missions de chacun sur GitHub  |

------------------
 
## ⚙️ Prérequis
<span id="Prérequis"></span>

- Hyperviseur de Type 1 Proxmox 
 🖥️  Machines Virtuelles:

| Nom complet                              | Adresse IP       | Masque              | Rôles | Priorité      |
|------------------------------------------|------------------|---------------------|----------------|---------------|
| G2-WINSRV-AD-DHCP-DNS                     | 172.16.20.5      | 255.255.255.0 (/24) | AD-DHCP-DNS / DC       | priority-high |
| G2-WINCORESRV-ADDS-2                      | 172.16.20.21     | 255.255.255.0 (/24) | ADDS / DC / RID Master      | priority-high |
| G2-WINCORESRV-ADDS                        | 172.16.20.19     | 255.255.255.0 (/24) | ADDS / DC / PDC Emulator     | priority-high |
| G2-ROUTEUR                                | 172.16.20.10     | 255.255.255.0 (/24) | ROUTEUR      | priority-high |
| G2-DT-DSI-Admin                           | 172.16.20.7      | 255.255.255.0 (/24) | Machine Test DSI/Admin       | priority-low  |
| G2-SRVWIN-RAID                            | 172.16.20.13     | 255.255.255.0 (/24) | Serveur de stockage       | priority-high |
| G2-BOR-COM-DT-Test                        | 172.16.20.17     | 255.255.255.0 (/24) | Machine Test Com/Client      | priority-low  |
| G2-DEBSRV-ZABBIX                          |                  |                | Supervision      | priority-high |
| G2-SRV-PROXY                              |                  |                    | Proxy       | priority-high |
| G2-SRV-FreePBX                            | 172.16.20.16     | 255.255.255.0 (/24) | Serveur de VOiP       | priority-low  |
| G2-SRV-iRedMail                           |                   |                   | Serveur de messagerie       | priority-high |
| G2-BOR-DSI-DT-Test                        |                 |                  | Machine Sandbox Admin       | priority-low  |
| G2-SRV-WSUS                               | 172.16.20.20     | 255.255.255.0 (/24) | Serveur de gestion de MAJ       | priority-low  |

- 🌐 Toutes les machines sont sur le réseau :
  - Adresse IP de réseau : ``172.16.20.0/24`` 
  - Adresse de passerelle : ``172.16.20.254`` 

- 📱 Les logiciels utilisés :
  - **OpenSSH** => Serveur et client SSH
  - **VirtualBox** => Lab avant migration finale sur Proxmox  
  - **NetData** => Monitoring en temps réel
  - **Trippy** => Diagnostique réseau
  - **Wireshark** => Analyse réseau
  - **3CX** ==> Logiciel type Softphone
  - **RoundCude** ==> Webmail

## 🧗 Difficultés rencontrées et 💡 Solutions trouvées
<span id="Difficultés-rencontrées-et-solutions-trouvées"></span>


|  [🧗Difficultés rencontrées](#difficultes-rencontrees)|[💡Solutions trouvées](#solutions-trouvees)|  
| --------------------------------------- | --------------------------------------- |
|   Découverte de l'entreprise EcoTech'   |         Recherche et Réflexion          |
|   Besoin matériel                       |         Recherche et Réflexion          |
|   Compétences manquantes                | Recherche et gestion planning en fonction des cours |

  
## 🚀 Améliorations possibles
<span id="ameliorations-possibles"></span>

- Plus de meeting synthétique pour la répartition des tâches
- Répartition du travail en binôme maximum
- 
