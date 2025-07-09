## Guide d'utilisation des logiciels – Audit Linux, Audit Active Directory et Audit Serveurs Windows

## Sommaire
### 1) Guide d’utilisation Audit Linux – Lynis, Open Scape
a. [Guide d'utilisation  de l'outil **Lynis**](#lynis)

b. [Guide d'utilisation de l'outil **OpenScap**](#openscap)


### 2) Guide d’utilisation Active Directory – Ping Castle

a. [Guide d'utilisation de l'outil **Ping Castle**](#pingcastle)

b. [Guide d'utilisation de l'outil **Microsoft ToolKit**](#toolkit)

c. [Guide d'utilisation de l'outil **HardenSysvol**](#harden)

### 3) Guide d’utilisation Audit Serveur Windows – AccessChk, AccessEnum, ShareEnum

a. [Guide d'utilisation de l'ouil **AccessChk**](#Chk)

b. [Guide d'utilisation de l'outil **AccessEnum**](Access)

c. [Guide d'utilisation de l'outil **ShareEnum**](#Share)


## 1) Guide d’utilisation des logiciels Audit Linux – Lynis, Open Scape  

### a - Guide d’utilisation de l'outil **Lynis**
<span id="lynis"/><span> 





b. Guide d’utilisation de l'outil **OpenScap**
<span id="openscap"/><span> 



## 2) Guide d’installation et configuration Active Directory – Ping Castle

a. Guide d'utilisation de l'outil **Ping Castle**
<span id="pingcastle"/><span> 

### Lancement d'un audit basique

1. **Démarrer l'application**
    - Lancez `PingCastle.exe`
    - Une console s'ouvre avec plusieurs options
2. **Sélectionner l'audit**
    - Choisissez "1-healthscore-Score the risk of a domain"
    - Appuyez sur Entrée
3. **Spécifier le domaine**
    - L'outil propose par défaut le domaine de votre compte
    - Validez avec Entrée ou saisissez un autre nom de domaine
4. **Attendre la fin de l'analyse**
    - L'audit se lance automatiquement
    - Durée variable selon la taille de l'annuaire
    - Appuyez sur Entrée pour fermer une fois terminé

### Résultats générés

L'outil génère deux rapports dans le répertoire d'installation :

- **Rapport HTML** : Plus graphique est facile d'interprétation
- **Rapport XML** : Version données structurées

## Lecture du rapport

### Score de risque principal

- Note sur 100 (plus élevée = moins sécurisé)
- Correspond au score le plus élevé parmi les 4 catégories

### Quatre catégories d'audit

1. **Stale Object** : Utilisateurs et ordinateurs
2. **Privileged Accounts** : Comptes à privilèges élevés
3. **Trusts** : Relations d'approbation entre domaines
4. **Anomalies** : Autres aspects de configuration

### Matrice de risque

- **Blanc** : Configuration correcte
- **Bleu** : Améliorations possibles
- **Jaune** : Travail nécessaire
- **Orange/Rouge** : Risques élevés à traiter en priorité

### Bonnes pratiques

- Analyser le rapport initial
- Corriger les points prioritaires (orange/rouge)
- Relancer un audit pour vérifier les améliorations
- Répéter le processus régulièrement

### Le premier rapport EcoTechSolution

Sur le Dashboard, on peut interprété un niveau de risque élevé toutes catégories confondues excepté "Trust" qui correspond aux données quand plusieurs Active Directory sont liés, ce qui n'est pas notre cas.

![](/S09/Ressources/PingCastle/01_premier_audit.png)  

Notre moyenne sans la catégorie "Trust" est à 59%. Notre objectif est de descendre en dessous de 20%.

En suivant le tableau ci dessous, nous avons un aperçu des correctifs que nous allons effectuer.

![](/S09/Ressources/PingCastle/02_Risk_Model.png)  

Exemples de modifications qui ont été mise en place pour améliorer la sécurité de notre infrastructure.

**Anomalies :**
- Désactivation de la GPO "Password Policies" qui possède une limite de caractère à 7. Notre politique de MDP étant plus performante, aucun intérêt de garder cette GPO.
- Activation de la "Recycle Bin AD" par ligne de commande. Cela permet de conserver des GPO, des OU ou autres informations supprimées accessibles pour un laps de temps
- Certains utilisateurs avaient l'option, "password never expire". Décochage de la case.
- Désactivation du service "Printer Spooler" sur les serveurs. Nous évitons ainsi une faille attack in the middle connue.


**Privileged Account :**
- Ajout de notre groupe DSi et Exploitation (Service Informatique) dans le groupe "Protected Users" qui possède des règles par default qui protège les informations de ses membres.
- Suppression du membre Administrator dans le groupe Schema Admin. C'est une bonne pratique quand aucune mise à jour du schéma AD est necessaire.

**Stale Objetcts :**
- Mise à jour des clients Windows 11 nécessaire (2H22)
- Ajout de la caractéristique Secure Only sur notre Reverse Lookup Zone pour le DNS.
- Création d'un GPO pour donner des permissions supplémentaire sur la remonté des logs "audit". Computer > Policies > Audit Policies > Success

Après ces différentes mesures, ci-dessous le résultat du deuxième audit.

![](/S09/Ressources/PingCastle/03_audit2_dashboard.png)  

![](/S09/Ressources/PingCastle/audit2_tableau.png)  

### b. Guide d’utilisation de l'outil **Microsoft ToolKit**
<span id="toolkit"/><span> 


### c. Guide d’utilisation de l'outil **HardenSysvol**
<span id="harden"/><span> 


## 3) Guide d’utilisation des logiciels Audit Serveur Windows – AccessChk, AccessEnum, ShareEnum

### a. Guide d’utilisation de l'ouil **AccessChk**
<span id="Chk"/><span> 


### b. Guide d’utilisation de l'outil **AccessEnum**
<span id="Access"/><span> 


### c. Guide d’utilisation de l'outil **ShareEnum**
<span id="Share"/><span> 

