## Guide d’installation et configuration – Serveurs et clients - Ecotech Solutions

## Sommaire

1. [Mettre en place du RAID 1 sur un serveur](#Mettre-place-du-RAID-1-sur-un-serveur)
2. [Installer et configurer un pare-feu pfSense](#Installer-et-configurer-un-pare-feu-pfSense)
3. [Installation des logiciels](#installation-des-logiciels)
  
  
  
  
  
  
  
  
  
## 1 - Mettre en place du RAID 1
<span id="Mettre-place-du-RAID-1-sur-un-serveur"></span>

#### A°) Pour éviter une possibilité de pertes des données  sur l'infrastructure nous avons choisi d'intégrer du **RAID 1** sur l'un de nos serveur ou se situe également le partage de fichier avec tout les collaborateurs. Ainsi nos données sont sauvegarder et récupérable en cas de panne d'un de nos disque de stockage. Pour ce faire vous aurez besoins:

> D'un serveur Windows sur lequel vous avez au minimum deux disque durs afin de permettre le **mirroring**

- Une fois que vous avez la configuration requise, lancer votre serveur puis allez dans la gestion des disque. Si vous êtes sur un serveur windows anglais taper :
``Computer Management``

![](/S04/Ressources/Capture-Raid/Computer-Management.png)

> Vous arriverez sur le menu de gestion des disques ou est rassembler tout les disques de votre système

![](/S04/Ressources/Capture-Raid/Main-Menu-Disque.png)

#### B°) Initialiser vos deux disques en les séléctionnants et en choisissant la partition **GPT(GUID Partition Table)**

![](/S04/Ressources/Capture-Raid/Init-Disque.png)


- Rendez-vous ensuite dans l'onglet ``Storage`` -> ``Disk Management`` vous verrez alors tout les disques que vous avez mis sur votre serveur.

#### C°) Faites un clic droit sur vos deux nouveau disque et convertissez les en **disque dynamique** 

![](/S04/Ressources/Capture-Raid/Conversion-Dynamique.png)


#### D°) Une fois les disques en dynamique, cliquer droit sur l'un des deux disque puis séléctionner ``New Mirrored Volume`` 

![](/S04/Ressources/Capture-Raid/Volume-Mirroir.png)


#### E°) Choisissez le second disque à ajouter au **volume mirroire** en le séléctionnant puis cliquer sur ``Add`` puis ``Next``

![](/S04/Ressources/Capture-Raid/Selection-disque.png)


#### F°) Choisisser ensuite une lettre à votre disque (**Optionnel**)

![](/S04/Ressources/Capture-Raid/Assignation.png)

#### G°) Passer ensuite jusqu'au résumé des options précédemments choisi et cliquer sur ``Finish``

![](/S04/Ressources/Capture-Raid/RAID-Finish.png)

#### H°) Votre RAID 1 est désormais crée ! vous pouvez voir dans le menu des disques que vos deux disques sont maintenant sous l'étiquettes ``Mirrored Volume``

![](/S04/Ressources/Capture-Raid/RAID-active.png)

#### I°) Rejoindre le domain AD:  
  
Etape 1 - Aller dans Network & Internet settings  
Etape 2 - Change adapter options  
Etape 3 - Clique droit sur la carte réseau Ethernet > Properties  
Etape 4 - Protocole Internet version 4 (TCP/IPv4) > Properties  
Etape 5-  Use the Following DNS server addresses  
Etape 6 - Dans Preferred DNS server , noter l'adresse du contrôleur de domaine 172.16.20.3  
Etape 7 - Dans le server manager, cliquer sur "workgroup"  
Etape 8 - cliquer sur "Change"  
Etape 9 - Dans "Member of", sélectionner "Domain"  
Etape 10 - Entrer le nom de domaine EcoTechSolution.lan, puis Entrée  
Etape 11 - Saisissez "Administrator" et le mot de passe Azerty1*  
Etape 12 - Un message vous indique que vous avez bien rejoint le domaine  




## 2 - Installer et configurer un pare-feu pfSense
<span id="Installer-et-configurer-un-pare-feu-pfSense"></span>

#### Installation pfSense

Nous allons installer le pare feu pfSense sur une machine dédié. Celle ci aura trois carte réseau : 
- WAN => em0 (bc:24:11:e5:43:8b)
- LAN => em1 (bc:24:11:e0:07:ea)
- DMZ => em2 (bc:24:11:e8:ac:43)



Une fois installer, nous pouvons administrer notre pare-feu en graphique avec un navigateur web d'une machine connecté a son réseau : ici le réseau 172.16.20.0/24.
Pour se connecter, il suffit de taper dans notre navigateur web l'adresse ip de la machine hebergeant pfSense 

![image navigateur](/S04/Ressources/navigateur_pfsense.png)

### Configuration pfSense 

Maintenant nous allons pouvoir le configurer en graphique. Pour se faire, nous allons aller dans la catégorie **Firewall**, puis dans **Rules**.

![image de firewall_rules](/S04/Ressources/pfsense_rules.png)

Nous allons commencer a ajouter des règles pour le réseau LAN selon le guide des bonnes pratiques de **Netgate Docs** (https://docs.netgate.com/pfsense/en/latest/recipes/example-basic-configuration.html)

![image des regle de la lan](/S04/Ressources/pfsense_regle_lan.png)

Nous allons faire la même chose avec le WAN et le DMZ. 


## 3 - Installation des logiciels  
<span id="installation-des-logiciels"></span> 
  
**OpenSSH** 

#### Etape 1 : Installation  
> commande : sudo apt install openssh-server openssh-client  
   
#### Etape 2 : Vérification du service SSH  
Afin de s'assurer que le système SSH soit actif:  
> commande : sudo systemctl status ssh  
  
Vous devriez avoir une ligne : Active: active (running)  
Si ce n'est pas le cas :  
 Démarrer le système avec la commande:  
> sudo systemctl start ssh  
  
Pour l'activer au démarrage :  
> commande : sudo systemctl enable ssh  
  
#### Etape 3 : Activation du pare-feu  
> commande : sudo ufw enable  
  
#### Etape 4 : Autoriser la connexion SSH au niveau du pare-feu:  
> commande : sudo ufw allow ssh  
  
#### Etape 5 : Vérification d'autorisation  
> commande : sudo ufw status  
  
Tester la connexion SSH  
  
#### Etape 1 : A faire sur le server Windows Server 2022 (WINSRV-AD-DHCP-DNS)  
- Ouvrir PowerShell en tant qu'administrateur  
- taper la commande : ssh wilder@172.16.20.7  
- un message s'affichera, valider en tapant : yes  
![message_de_connexion](https://github.com/user-attachments/assets/601e29e7-2feb-4f4a-8d61-c45d247ebf0f)  
  
- Saisissez le mot de passe (ici : Azerty1*) et valider  
![mot_de_passe](https://github.com/user-attachments/assets/834dab43-63fe-4f6e-b80c-c33a06737594)  
  
- Vous êtes maintenant connecté en ssh sur le server admin  
![connexion_win_ubu_etablie](https://github.com/user-attachments/assets/ad60d024-753f-44ab-9c6f-f3135a090048)  
  
  
  
Installation de OpenSSH (Server) sur le PC (WINSRV-AD-DHCP-DNS)  
  
#### Etape 1 : Installation de OpenSSH  
> commande : Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0  
![Ubu_Win_SSH_01](https://github.com/user-attachments/assets/c81c0430-de32-4347-a909-0f218a661ec0)  
   
  
#### Etape 2 : Vérification de l'activation du service sshd  
> commande : Get-Service sshd  
  
Si le service est arrêté, le démarrer avec les commandes :  
> Start-Service sshd  
> Set-Service -Name sshd -StartupType Automatic  
  
Puis revérifier l'activation avec la commande :
> Get-Service sshd  
  
#### Etape 3 : Vérifier que le port 22 est bien à l'écoute 
> commande : netstat -an | findstr :22  
  
A Faire sur le PC Admin:  
  
#### Etape 1 : Générer une paire de clés SSH  
> commande : ssh-keygen -t ed25519    
  
Appuyer sur Entrée à chaque question, sauf vous voulez un mot de passe pour la clé.  
  
#### Etape 2 : Copier la clé publique sur Windows Server  
- Depuis le PC Admin, entrer la commande:  
> scp ~/.ssh/id_ed25519.pub Administrator@172.16.20.3:/Users/Administrator/  
  
- Ensuite, sur le PC WINSRV-AD-DHCP-DNS, déplacer la clé publique reçue avec la commande :  
  
> move C:\Users\Administrator\id_ed25519.pub C:\Users\Administrator\.ssh\authorized_keys  
  
#### Etape 3 : Tester la connexion SSH  
- sur le PC Admin, entrer la commande:  
> ssh Administrator@172.16.20.3  
- Vous êtes maintenant connecté en ssh sur le server AD  
![test](https://github.com/user-attachments/assets/e4556ccb-159a-433d-b93e-dc9c139aeb72)  


**Wireshark**   
  
#### Etape 1 : Installation  
> commande : sudo apt install wireshark  
   
Lors de l'installation, au message :  
"Should non-superusers be able to capture packets ?" Sélectionner "Oui".   
![wireshark_common](https://github.com/user-attachments/assets/4c6536e4-e5ad-4648-92e7-f57078ff6dfe)  
  
#### Etape 2 : Vérification de la création du groupe "wireshark"   
> commande : getent group wireshark  
   
#### Etape 3 : Ajouter un utilisateur au groupe "wireshark" (ex: wilder)  
> commande : sudo usermod -aG wireshark wilder    
  
#### Etape 4 : Redémarrer la machine  
> commande : sudo reboot  
  
#### Etape 5 : Tester les droits   
- Se connecter avec l'utilisateur ajouté au groupe  
- Vérifier les groupes avec la commande : groups (Wireshark devrait apparaître dans la liste)  
- Lancer Wireshark sans sudo avec la commande : wireshark  
- Sélectionner la carte réseau ens18 et démarrer la capture de paquets en cliquant sur l'aileron bleau en haut à gauche  
![test](https://github.com/user-attachments/assets/eb692970-ec84-444c-8f43-d2e08313db39) 






