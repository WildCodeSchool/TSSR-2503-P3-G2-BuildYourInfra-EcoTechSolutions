## Guide d’installation et configuration – Serveurs et clients - Ecotech Solutions

## Sommaire

1. [Mettre en place du RAID 1 sur un serveur](#Mettre-place-du-RAID-1-sur-un-serveur)
2. [Installer et configurer un pare-feu pfSense](#Installer-et-configurer-un-pare-feu-pfSense)
  




















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









