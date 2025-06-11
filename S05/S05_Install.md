## Guide d’installation et configuration – Serveurs et clients - Ecotech Solutions

## Sommaire

1. [Mettre en place une sauvegarde de données](#sauvegarde-de-donnees)
2. [Mise en place d'une supervision de l'infrastructure réseau](#supervision-zabbix)

  
  
  
  
  
  
## 1 - Mettre en place une sauvegarde de données  
<span id="sauvegarde-de-donnes"></span>  







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
Une fois connecté, vous arrivez sur le dashboard 
  
![dashboard](https://github.com/user-attachments/assets/f8b9587b-04f9-4f67-8829-45d6d10ffcae)  
 

  






