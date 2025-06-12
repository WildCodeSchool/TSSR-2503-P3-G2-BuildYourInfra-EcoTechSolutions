## Guide d’installation et configuration – Serveurs et clients - Ecotech Solutions

## Sommaire

1. [Mettre en place une sauvegarde de données](#sauvegarde-de-donnees)  
     [Partie 1 - Installation du rôle Windows Server Backup](#wsb)  
     [Partie 2 - Création d'une planification de backup](#backup)  
2. [Mise en place d'une supervision de l'infrastructure réseau](#supervision-zabbix)  
3. [Déploiement des Agents Zabbix](#agent-zabbix)  
    
    
## 1 - Mettre en place une sauvegarde de données  
<span id="sauvegarde-de-donnes"></span>  
  
### Partie 1 - Installation du rôle Windows Server Backup  
<span id="wbs"></span>  
  
Pour utiliser Windows Server Backup, il faut avant tout installer le rôle sur le serveur.  

Dans le Server Manager, cliquer sur "Manage" et "Add Roles and Features"  

![wsb_role_01](https://github.com/user-attachments/assets/188df6fe-c670-46a9-b9e2-4698384721a6)  

Une fenêtre s'ouvre, cliquer sur "Next"  
![wsb_role_02](https://github.com/user-attachments/assets/71f87a03-53d6-4184-8858-06d72ca8907a)  
  
Continuer a cliquer sur "Next" jusqu'à arriver à la section "Features" et cocher la case "Windows Server Backup", puis cliquer sur "Next"   
![wsb_role_03](https://github.com/user-attachments/assets/d117560b-a9fc-4fe7-9eff-980d8358b13d)  

La section "Confirmation" vous récapitule les rôles installés, ici Windows Server Backup. Cliquer sur "Install"  
![wsb_role_04](https://github.com/user-attachments/assets/11e341e6-e06c-41a3-81c3-20f24029a0c5)  
  
L'installation se lance. Patientez jusqu'à la fin, puis cliquer sur "Close"  
![wsb_role_05](https://github.com/user-attachments/assets/51766d4b-b96d-4e28-bbb4-0da0f7334b7f)  

  







## 2 - Mise en place d'une supervision de l'infrastructure réseau   
<span id="supervision-zabbix"></span>  
  
Pour la supervision, nous avons opté pour le logiciel Zabbix.  

#### Installation - Partie 1  

Suivre l'étape 2 "Install and configure Zabbix for your platform" sur le site officiel [ici](https://www.zabbix.com/fr/download?zabbix=7.0&os_distribution=debian&os_version=12&components=server_frontend_agent&db=mysql&ws=apache)  
  
  
#### Installation - Partie 2  

Une fois terminée, vous devrez aller sur la page web : http://172.16.20.13/zabbix  
  
#### Etape 1 : Vous arrivez sur la page de bienvenue.  
Dans "langue par défaut" sélectionner "Français", puis cliquer sur "Prochaine étape"  

![bienvenue](https://github.com/user-attachments/assets/a4865e53-c06f-45fb-b9c7-565fd36f9f65)  

#### Etape 2 : Vérification des prérequis.  
Vérifier que tout est OK et cliquer sur "Prochaine étape"  
![prerequis](https://github.com/user-attachments/assets/750efcde-75da-438f-9946-5dafa0e6b943)  
   

#### Etape 3 : Configurer la connexion à la base de données  
Dans "Port de la base de données", noter "3306"qui correspond au port standard MySQL/MariaDB,  
puis donner un nom à la base de données (ici zabbix), un nom d'utilisateur (ici zabbix) puis un mot de passe (ici Azerty1*),  
puis cliquer sur "Prochaine étape"  
![base_de_donnees](https://github.com/user-attachments/assets/6ab82d89-e660-4f51-b375-080e18adb647)  
  

#### Etape 4 : Paramètres    
Dans "Nom du serveur Zabbix" noter l'adresse IP de la machine (ici : 172.16.20.13) (on peut aussi mettre le nom exact de la machine)   
Dans fuseau horaire par défaut, mettre (UTC+02:00) Europe/Paris, puis cliquer sur "Prochaine étape"   
     
![parametres](https://github.com/user-attachments/assets/df69d667-04fb-4767-a7d7-6ffd427077aa)  
   

#### Etape 5 : Résumé pré-installation    
Si vous voulez changer les paramètres, cliquer sur "Retour" sinon, si tout est correct, cliquer sur "Prochaine étape"  

![resume](https://github.com/user-attachments/assets/a01c85f2-c82e-428f-89dd-13fd691143ab)  
 

#### Etape 6 : Fin d'installation  
Un message vous indique que l'installation de l'interface Zabbix est réussie.  

![fin](https://github.com/user-attachments/assets/b615ffa6-39d0-4b14-8989-660a7f74e870)  
 

#### Etape 7 : Page de connexion  
Pour une première connexion, vous devez vous connecter avec les identifiants par défaut de Zabbix :  
Nom d'utilisateur : Admin  
Mot de passe : zabbix  
  
![connexion](https://github.com/user-attachments/assets/bc63bff3-8a36-453e-96a2-33c93dd6bdd2)  
   

#### Etape 8 : Dashboard  
Une fois connecté, vous arrivez sur le dashboard.  
Dans la partie " Information système" , vous verrez "le serveur zabbix est en cours d'exécution" avec la valeur "Oui" en vert.  
  
![dashboard](https://github.com/user-attachments/assets/f8b9587b-04f9-4f67-8829-45d6d10ffcae)  
 

## 3 - Déploiement des Agents Zabbix
<span id="agent-zabbix"></span>  

Une fois le serveur Zabbix mise en place, pour obtenir les métriques des machines que l'on veux superviser, nous devons déployer l'Agent Zabbix sur nos machines.

### Pour les machines Windows

Manipulation à faire sur chaque machine Windows (serveur ou client) :

- Aller sur le site de Zabbix (www.zabbix.com), puis cliquez sur le bouton vert en haut à droite "Get Zabbix"

- Choisissez l'option le plus à droite : "Agents Zabbix"

![agent_zabbix_w1](/S05/Ressources/Zabbix/agent_zabbix_w1.png)

- Sélectionner votre version de l'Agent pour Windows

![agent_zabbix_w2](/S05/Ressources/Zabbix/agent_zabbix_w2.png)

- Cliquez sur le bouton "Download" pour télécharger l'Agent Zabbix

![agent_zabbix_w3](/S05/Ressources/Zabbix/agent_zabbix_w3.png)

- Une fois télécharger, lancer l'installateur de l'Agent et cliquez sur "Next"

![agent_zabbix_w4](/S05/Ressources/Zabbix/agent_zabbix_w4.png)

- Cochez la casse "I accept the terms in the License Agreement", puis cliquez sur "Next"

![agent_zabbix_w5](/S05/Ressources/Zabbix/agent_zabbix_w5.png)

- Laissez toutes les option comme elle sont et cliquez sur "Next"

![agent_zabbix_w6](/S05/Ressources/Zabbix/agent_zabbix_w6.png)

- Renseigner le nom de la machine dans "Host name" et l'IP de votre serveur Zabbix dans "Zaabix server IP/DNS" et "Server or Proxy for active checks"

![agent_zabbix_w7](/S05/Ressources/Zabbix/agent_zabbix_w7.png)

- Cliquez sur "Install" pour commencer l'installation

![agent_zabbix_w8](/S05/Ressources/Zabbix/agent_zabbix_w8.png)

- Cliquez sur "Finish" pour terminer l'installation de l'Agent Zabbix sur votre machine Windows

### Pour les machines Linux

Manipulation à faire sur chaque machine Linux (serveur ou client) :

- Aller sur le site de Zabbix (www.zabbix.com), puis cliquez sur le bouton vert en haut à droite "Get Zabbix"

- Choisissez l'option le plus à gauche : "Packages Zabbix"

![agent_zabbix_l1](/S05/Ressources/Zabbix/agent_zabbix_l1.png)

- Choisissez parmi les options : Votre version de Zabbix, Votre Distribution Linux et Agent comme "Composent Zabbix"

![agent_zabbix_l2](/S05/Ressources/Zabbix/agent_zabbix_l2.png)

- Suivez les instructions d'installation sur le site officiel de Zabbix

![agent_zabbix_l3](/S05/Ressources/Zabbix/agent_zabbix_l3.png)

- Une fois installer, édité le fichier de configuration `/etc/zabbix/zabbix_agentd.conf` et modifier les lignes "Server" et "ServerActive" en y indiquant l'IP de votre serveur Zabbix  






