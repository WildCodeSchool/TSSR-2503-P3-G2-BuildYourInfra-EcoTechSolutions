## Guide d’installation et configuration – Serveur WSUS et des rôles FSMO sur les DC - Ecotech Solutions

## Sommaire

1. [Mise en place du serveur WSUS](#Srv-WSUS)  
     [Partie 1 - Intégration du serveur WSUS au domaine](#WSUS-AD)  
     [Partie 2 - Liaison des groupes](#liaison-groupes)  
     [Partie 3 - Liaison des MAJ](#liaison-maj)  
      - [A - Les clients](#maj-clients)  
      - [B - Les serveurs](#maj-serveurs)  
      - [C - Les DC](#maj-dc)  
2. [Rôles FSMO](#fsmo)  


## 1.Mise en place du serveur WSUS  
<span id="Srv-WSUS"/><span>  

Nous avons créer une nouvelle machine en faisant un clone intégrale d'un serveur Windows Server 2022. 
Sur cette machine, nous avons rajouter un deuxieme disque dure de 25 Go consacré au rôle WSUS. 
Pour l'activer, nous avons utilisé **Computeur Management** dans **Tools**. Puis aller dans **Disk Management**. Visualise le nouveau disque, clique droit **Simple Volume** puis suivant jusqu'a **Finish**. 

![image wsus disque](Ressources/SRV-WSUS/wsus_disk.png)

Une fois le disque opérationnel, créer un dossier **WSUS** dessus.

![image dossier wsus](Ressources/SRV-WSUS/wsus_dossier.png)

À partir du **Server Manager**, installe le rôle **Windows Server Update Services**. Valide les fonctionnalités supplémentaires qui vont s'ajouter automatiquement. Indique le dossier que tu as créer pour l'emplacement du stockage des mises à jour.
Termine l'installation et redémarre le serveur. 

Quand le serveur est redémarré, clique sur l'icône avec le panneau orange sur **Server Manager** et lance la tâche **Post Deployment Configuration for WSUS**.

Une fois fait, va dans **Windows Server Update Services** via **Tools** du **Server Manager**. Clique sur **Next** jusqu'a **Start Connecting**. 

Après, sélectionne les langues **English** et **French**. 
Dans la fenêtre d'après, sélectionne les produits pour lesquels tu souhaites avoir des mises à jour. Ici nous avons choisit peu de mise a jour pour pouvoir synchroniser les machines rapidements : 

![image maj](Ressources/SRV-WSUS/wsus_maj.png)

Il suffit ensuite de choisir combien de synchronisation on souhaite faire. Ici nous avons choisit 4 synchonisations par jour.
Enfin coche la case **Begin initial synchronization**. 
Cela peut prendre plusieurs heures. Pour voir l'avancement, il faut aller dans **Synchronisation Status**.

Une fois la synchronisation terminée, clique sur **Option** => **Automatic Approval**. Cocher **Default Automatic Approval Rule.**.

![image automatic approval](Ressources/SRV-WSUS/wsus_automatic_approval.png)

Puis clique sur **Run Rules**.

Encore dans les **Options** => **Computeurs**, clique sur **Use Group Policy or registry settings on computers**.

Maintenant nous allons créer des groupes pour organiser les ordinateurs selon leur fonction. Clique sur **Computers** puis clique droit sur **All Computers** => **Add Computers Group..**. Ici nous allons créer 3 groupes : 
- DC
- Serveurs
- Utilisateurs

![image groupe ordinateurs](Ressources/SRV-WSUS/wsus_grp_computers.png)


### Partie 1 - Intégration du serveur WSUS au domaine  
<span id="WSUS-AD"/><span>  

Nous l'avons ensuite intégrer au domaine EcoTechSolution (pour rappel, pour intégrer un domaine il faut être sur le même réseau, et changer le nom de domaine sur **Server Manager** et utiliser le compte **Administrator** avec mot de passe **Azerty1*** pour intégrer le domaine)

![image wsus](Ressources/SRV-WSUS/wsus_ecotechsolution.png)
  
  
### Partie 2 - Liaison des groupes  
<span id="liaison-groupes"/><span>  

Pour liéer les groupes que nous venons de faire, nous allons créer des GPO sur notre domaine AD-DS. Une pour chaque groupe.
La premiere pour les utilisateurs :

![image_gpo-utilisateur](Ressources/SRV-WSUS/wsus_gpo_users.png)

Pour configurer cette GPO : 
**Computer Configuration** --> **Policies** --> **Administrative Templates** --> **Windows Components** --> **Windows update**

Dans Specify intranet Microsoft update service location (qui indiquera où est le serveur de mise à jour)
Coche **Enabled**.
Dans les options, pour les 2 premiers champs, mettre l'URL avec le nom du serveur sous sa forme FQDN, ajouter le numéro du port 8530
Ici nous allons utiliser :
```
http://WINSRV-WSUS.ecotechsolution.lan
```
           
Ensuite va dans **Do not connect to any Windows Update Internet locations** (qui bloque la connexion aux serveurs de Microsoft)
Coche **Enabled**.

Puis va dans **Configure Automatic Updates** (pour savoir a quelle fréquence les mises a jours sont téléchargées)
Coche **Enabled**
Dans les options mets :
Dans Configure automatic updating sélectionne 4- Auto Download and schedule the install
Dans Scheduled install day mets 0 - Every day
Dans Scheduled install time mets 09:00
Cocher Every week
Cocher Install updates for other Microsoft Products

Puis, aller dans **Enable client-side targeting** (qui fait la liaison avec les groupes crées dans WSUS)
Coche **Enabled**
Dans les options, mettre le nom du groupe WSUS pour les ordinateurs cible, donc **UTILISATEURS**
Valide la configuration

Enfin, aller dans **Turn off auto-restart for updates during active hours** (qui permet d'empêcher les machines de redémarrer après l'installation d'une mise à jour pendant leurs heures d'utilisations)
Coche **Enabled**
Dans les options, mettre (par exemple) 8 AM - 6 PM (les horaires ou les clients travaillent).




### Partie 3 - Liaison des MAJ  
<span id="liaison-maj"/><span>    
  
  


## 2.Rôles FSMO  
<span id="fsmo"/><span>  

#### Création serveur Windows Core 

Nous avons créer deux autres serveurs Windows Core pour avoir trois Domain Controler sur notre domaine AD.
Pour les mettres en DC, il a fallu leur attribuer une IP pour qu'elles fassent partie du réseau de l'AD (grâce au rôle DHCP cela c'est fait automatiquement).
Puis rensigner le nom de domaine pour leur faire intégrer notre AD **EcoTechSolution.lan**.

![image serveur core](Ressources/FSMO/ad_domaine.png)

#### Distributions des rôles FSMO

Une fois que nous avons nos trois DC sur notre AD ( 1 GUI et 2 CLI), nous avons réparties les rôles FSMO entre eux.  
Pour ce faire nous avons utilisé l'utilitaire **ntdsutil.exe**.
Pour accéder a cet outil, il suffit d'utiliser la console PowerShell. Ici nous allons l'utiliser sur notre serveur Windows GUI.
```PowerShell
ntdsutil.exe
```

Une fois l'utilitaire lancée, nous allons passé en mode **fsmo maintenance** : 
```PowerShell
role
```

Maintenant nous allons établir une connexion avec le serveurs sur lequel on veut transférer un ou des rôles : 
```powershell
connections
```

Nous sommes maintenant en mode **server connections**, nous allons nous connecter à un serveur Windows Core : 

```powershell
connect to server WINCORESRV-ADDS
```

Enfin nous allons transférer le rôle FSMO **RID Master** a ce serveur : 
```powershell
transfert RID master
```

![image fsmo](Ressources/FSMO/fsmo.png)

Une fois cela fait nous allons faire de même avec notre deuxieme serveur Windows Core et lui attribuer le rôle FSMO **Emulateur PDC**

![fsmo_2](Ressources/FSMO/fsmo_2.png)

Pour finir nous allons vérifier si tout à été bien configurer : 

![qwery](Ressources/FSMO/qwery.png)





