## Guide d’installation et configuration – Serveurs et clients - Ecotech Solutions

## Sommaire

1. [Mettre en place du RAID 1 sur un serveur](#Mettre-place-du-RAID-1-sur-un-serveur)
  




















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

