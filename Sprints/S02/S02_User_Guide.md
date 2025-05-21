# Guide d’installation – Infrastructure Active Directory

## Sommaire

1. [Installation des rôles ADDS, DHCP, DNS – SERVEUR "WINSRV-ADDS-DHCP-DNS"](#installation-des-rôles-adds-dhcp-dns--winsrv-adds-dhcp-dns)
   - [Partie 1 – Installation des rôles](#partie-1--installation-des-rôles)
   - [Partie 2 – Configuration d’Active Directory (ADDS)](#partie-2--configuration-dactive-directory-adds)
   - [Partie 3 – Configuration du DHCP](#partie-3--configuration-du-dhcp)
   - [Partie 4 – Configuration du DNS](#partie-4--configuration-du-dns)
2. [Installation de Windows Server Core – "SERVEUR WINCORESRV-ADDS"](#installation-de-windows-server-core--wincoresrv-adds)
3. [Installation de Debian avec GLPI – SERVEUR "DEBSRV-GLPI"](#installation-de-debian-avec-glpi--debsrv-glpi)
4. [Installation d’un poste client d'administration Ubuntu – CLIENT "DT-DSI-Admin"](#installation-dun-client-ubuntu--dt-dsi-admin)


## Installation et configuration des rôles ADDS, DHCP et DNS
### Serveur : WINSRV-AD-DHCP-DNS  
### Forêt : ecotechsolutions.lan
### IP Statique : 172.16.40.1
### Masque Réseau : 255.255.0.0
### Passerelle : 172.16.40.254
---

### PARTIE 1 – Installation des rôles

#### Étape 1 : Ouvrir le Gestionnaire de serveur
- Lancer "Gestionnaire de serveur"
- Cliquer sur "Ajouter des rôles et fonctionnalités"

#### Étape 2 : Assistant d’ajout de rôles
- Type d'installation : Installation basée sur un rôle ou une fonctionnalité

![Installation ADDS](https://raw.githubusercontent.com/WildCodeSchool/TSSR-2503-P3-G2-BuildYourInfra-EcoTechSolutions/890a3ce449f92501d97790662f6df70b87351a42/Ressources/Médiathèque/Captures%20d'écran%20déploiement%20ADDS%20DHCP%20DNS/Capture%20d'écran%201%20-%20installation%20adds.png)

- Sélection du serveur : WINSRV-AD-DHCP-DNS

![Choix du serveur](https://raw.githubusercontent.com/WildCodeSchool/TSSR-2503-P3-G2-BuildYourInfra-EcoTechSolutions/refs/heads/main/Ressources/M%C3%A9diath%C3%A8que/Captures%20d'%C3%A9cran%20d%C3%A9ploiement%20ADDS%20DHCP%20DNS/Capture%20d'%C3%A9cran%202%20-%20choix%20serveur%20adds.png)

#### Étape 3 : Sélection des rôles
Cocher les rôles suivants :
- Services de domaine Active Directory (ADDS)
- Serveur DHCP
- Serveur DNS  
Valider les fonctionnalités supplémentaires si demandé.

![Cocher les rôles](https://raw.githubusercontent.com/WildCodeSchool/TSSR-2503-P3-G2-BuildYourInfra-EcoTechSolutions/refs/heads/main/Ressources/M%C3%A9diath%C3%A8que/Captures%20d'%C3%A9cran%20d%C3%A9ploiement%20ADDS%20DHCP%20DNS/Capture%20d'%C3%A9cran%203%20-%20ajout%20des%203%20roles.png)

#### Étape 4 : Confirmation
- Lancer l'installation
- L'installateur doit indiqué "Installation succeeded". Les rôles correcetement installés sont visibles en vert dans le server manager.

![Installation succeeded](https://raw.githubusercontent.com/WildCodeSchool/TSSR-2503-P3-G2-BuildYourInfra-EcoTechSolutions/refs/heads/main/Ressources/M%C3%A9diath%C3%A8que/Captures%20d'%C3%A9cran%20d%C3%A9ploiement%20ADDS%20DHCP%20DNS/Capture%20d'%C3%A9cran%204%20-%20fin%20installation%20des%20roles.png)



---

## PARTIE 2 – Configuration d'Active Directory (ADDS)

#### Étape 1 : Promouvoir le serveur en contrôleur de domaine
- Après l'installation, cliquer sur l'alerte "Promouvoir ce serveur en contrôleur de domaine"

![Promotion DC](https://raw.githubusercontent.com/WildCodeSchool/TSSR-2503-P3-G2-BuildYourInfra-EcoTechSolutions/refs/heads/main/Ressources/M%C3%A9diath%C3%A8que/Captures%20d'%C3%A9cran%20d%C3%A9ploiement%20ADDS%20DHCP%20DNS/Capture%20d'%C3%A9cran%205%20-%20%20configuration%20DC.png)

#### Étape 2 : Configuration du déploiement
- Choisir "Ajouter une nouvelle forêt"
- Nom du domaine racine : ecotechsolutions.lan

![Root domain name](https://raw.githubusercontent.com/WildCodeSchool/TSSR-2503-P3-G2-BuildYourInfra-EcoTechSolutions/refs/heads/main/Ressources/M%C3%A9diath%C3%A8que/Captures%20d'%C3%A9cran%20d%C3%A9ploiement%20ADDS%20DHCP%20DNS/Capture%20d'%C3%A9cran%206%20-%20foret%20deploiement.png)

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


### Partie 2 – Configuration d’Active Directory (ADDS)
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

## Installation de Windows Server Core – WINCORESRV-ADDS
...

## Installation de Debian avec GLPI – DEBSRV-GLPI
...

## Installation d’un client Ubuntu – DT-DSI-Admin
...

