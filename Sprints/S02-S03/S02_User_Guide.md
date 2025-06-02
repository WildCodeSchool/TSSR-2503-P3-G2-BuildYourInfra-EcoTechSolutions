#### Trippy

Trippy est un outil de diadnostique réseaux sous licence Apache 2 combinant les fonctionnalités de traceroute et de ping dans une interface en mode texte (TUI) afin d’aider les administrateurs systèmes et réseaux.

Pour utiliser Trippy sur une config Ubuntu :

```bash
sudo trip <adresse IP de la cible ou nom DNS>
```


![capture ecran trippy](/Ressources/Emplacement_libre_2/trippy.png)



Trippy propose plusieurs options personnalisables pour l’analyse réseau :
Mode interactif avec une carte et des graphiques :
Trippy affiche un aperçu visuel dans le terminal. Cela inclut les sauts réseau et leurs temps de réponse.
Personnalisation des paramètres de traçage :
Définir le nombre de paquets envoyés.
Ajuster l’intervalle entre les requêtes.
Statistiques de confidentialité des sauts : il est possible d’anonymiser certaines informations des sauts pour protéger la confidentialité des adresses IP.
Génération de rapports : Trippy peut exporter des résultats pour analyse ultérieure.


#### SSH

SSH, ou Secure Shell, est un protocole utilisé pour se connecter en toute sécurité à des systèmes distants. C’est le moyen le plus courant d’accéder à des serveurs Linux distants.
Pour l'utiliser nous allons utiliser la commande suivante :

```bash
ssh <adresse ip ou nom de la machine>
```

[image illustration utilisation ssh](Ressources/Emplacement_libre_2/ssh.png)

Une fois que vous vous êtes connecté au serveur, il peut vous être demandé de vérifier votre identité en fournissant un mot de passe. Plus tard, nous verrons comment générer des clés à utiliser à la place des mots de passe.

Pour quitter la session ssh et revenir dans votre session shell locale, tapez :
```bash
exit
```



#### WireShark

Lorsque vous ouvrez Wireshark, un écran vous présente la liste de toutes les connexions réseau que vous pouvez surveiller. Vous disposez également d’un champ de filtre de capture vous permettant de capturer uniquement le trafic réseau qui vous intéresse.

![image ouverture de wireshark](Ressources/Emplacement_libre_2/wireshark_home.png)

Vous pouvez sélectionner plusieurs interfaces en maintenant la touche Majuscule enfoncée. Une fois votre interface réseau sélectionnée, vous pouvez démarrer la capture. Plusieurs possibilités s’offrent à vous. Cliquez sur le premier bouton de la barre d’outils intitulé Start Capturing Packets (en haut a gauche).
Une fois que vous avez capturé tous les paquets dont vous avez besoin, utilisez les mêmes boutons ou options de menu pour mettre un terme à l’opération. Il est recommandé d’interrompre la capture de paquets avant de procéder à l’analyse.

![image sur fin de capture réseau](Ressources/Emplacement_libre_2/wireshark_lecture_paquets.png)





#### Cockpit

Pour utiliser Cockpit il faut tout d'abord que notre PC client et notre serveur soit sur le même réseau.
Ensuite nous pouvons acceder a l'interface Cockpit en saissisnat l'adresse IP de notre serveur suivie du port "9090" (port par defaut).

```bash
172.20.16.6:9090
```
Nous devons maintenant nous autentifier pour pouvoir accéder au logiciel.

![image interface web Cockpit](Ressources/Emplacement_libre_2/Cockpit_login.png)

Sur la gauche, on retrouve le menu permettant d'accéder aux différentes sections.

Au centre, un tableau de bord avec différents widgets, ainsi que la date de dernière connexion, ainsi qu'un message "The programs included with the Debian...". En fait, ce sont des informations que l'on retrouve lors d'une connexion en SSH et ce message n'est autre que le contenu du fichier "/etc/motd" : vous pouvez donc le personnaliser.

![home Cockpit]()

Le nom d'hôte du serveur est modifiable à cet endroit, en cliquant sur le bouton "modifier" au sein du widget "Configuration".

En cliquant sur l'onglet "Voir les détails et l'historique" du widget "Utilisation", on peut avoir beaucoup plus d'informations sur l'état actuel du serveur. On peut visualiser l'état du CPU, de la RAM, des disques et du réseau.

Dans la partie "Journaux", vous avez accès aux différents logs de votre serveur. Il est possible de filtrer selon une période, les types d'erreurs (info, avertissements, erreurs, alertes, etc.), mais aussi de créer ses propres filtres de recherche. En cliquant sur une entrée, vous avez accès à différentes propriétés.

La section "Stockage" permet de visualiser des graphiques de performances (lecture et écriture), de visualiser les volumes, les points de montage NFS et les journaux liés au stockage. Sur la droite, on a également une visibilité sur les périphériques physiques (disques physiques, lecteur DVD...).

La partie "Réseau" permet de visualiser les journaux liés au réseau, d'ajouter une interface, de déclarer un VLAN ou encore de voir l'utilisation de vos cartes réseau.

Ensuite, la section "Comptes" liste les comptes utilisateurs présents sur la machine. On peut créer un nouveau compte ou modifier un compte existant (nom complet, verrouiller le compte, modifier le mot de passe, etc.).

Enfin, l'onglet "Terminal" vous permet d'ouvrir un Terminal en mode Web pour administrer votre serveur



    NetData

C’est une solution de monitoring très légère qui affiche via un dashboard l’ensemble des informations sur l’usage des ressources de votre serveur. On y retrouve l’usage CPU, RAM, des disques avec chaque partitions mais également le détail des applications comme memcached, postfix ou redis.

Pour pouvoir utiliser NetData, il faut aller sur cette adresse via un navigateur web :

```
https://www.netdata.cloud
```

[image netdata site avec entour en haut a droite]

Puis remplir les champs disponible avec l'adresse mail __ecotechsolution.wcs@gmail.fr__ pour se connecter.

[image netdata avec les serveurs]

Nous arrivons sur le **home** du site. D'ici nous avons un apercu globale de l'ensemble de nos "__nodes__" (dans **Netdata**, un node est une machine)

Pour avoir plus de détails sur un node en particulier, il suffit de cliquer sur le node qui nous interesse.

[image ou on voit les nodes]

Ensuite il suffit de défiler pour avoir l'ensemble des informations relative au fonctionnement du node.

[image détaillé d'un node]

Nous pouvons également nous connecter sur NetData sur la machine que nous utilisons. Il suffit de se connecter via un navigateur web a l'adresse suivante :

```
http://localhost:19999
```

[image interface web]
