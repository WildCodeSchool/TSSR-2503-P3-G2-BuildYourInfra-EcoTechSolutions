# Trippy

Trippy est un outil de diagnostique réseaux sous licence Apache 2 combinant les fonctionnalités de traceroute et de ping dans le terminal (CLI) afin d’aider les administrateurs systèmes et réseaux.

## Utilisation de Trippy

- Commande de base :

	Par exemple, pour tracer la route jusqu’à google.com :
	> trip google.com

(Ont peux utiliser aussi l'adresse IP de l’hôte cible)

![screen_trippy.gif](/Ressources/Emplacement_libre_2/trippy.png)

- Tracer avec des option personnalisées :
	- Changer le protocole utilisé pour le traçage :
		(Par défaut, Trippy utilise le protocole ICMP.)
		- UDP :
		> 	trip --protocol udp google.com
		- TCP :
		>	trip --protocel tcp google.com

- Limiter le nombre de sauts (TTL) :
	Pour définir le nombre maximal de sauts que Trippy explorera :
	> 	trip --max-flows 15 exemple.com

- Utiliser un port spécifique (exemple port 80 en TCP):
 	> trip --protocol tcp --target-port 80 exemple.com
 	
 Pour d'autre exemple, consultez la documentation officiel [ici](https://trippy.rs/guides/usage/) 

#### SSH

SSH, ou Secure Shell, est un protocole utilisé pour se connecter en toute sécurité à des systèmes distants. C’est le moyen le plus courant d’accéder à des serveurs Linux distants.
Pour l'utiliser nous allons utiliser la commande suivante :

```bash
ssh <adresse ip ou nom de la machine>
```

![image illustration utilisation ssh](/Ressources/Emplacement_libre_2/ssh.png)

Une fois que vous vous êtes connecté au serveur, il peut vous être demandé de vérifier votre identité en fournissant un mot de passe. Plus tard, nous verrons comment générer des clés à utiliser à la place des mots de passe.

Pour quitter la session ssh et revenir dans votre session shell locale, tapez :
```bash
exit
```



#### WireShark

Lorsque vous ouvrez Wireshark, un écran vous présente la liste de toutes les connexions réseau que vous pouvez surveiller. Vous disposez également d’un champ de filtre de capture vous permettant de capturer uniquement le trafic réseau qui vous intéresse.

![image ouverture de wireshark](/Ressources/Emplacement_libre_2/wireshark_home.png)

Vous pouvez sélectionner plusieurs interfaces en maintenant la touche Majuscule enfoncée. Une fois votre interface réseau sélectionnée, vous pouvez démarrer la capture. Plusieurs possibilités s’offrent à vous. Cliquez sur le premier bouton de la barre d’outils intitulé Start Capturing Packets (en haut a gauche).
Une fois que vous avez capturé tous les paquets dont vous avez besoin, utilisez les mêmes boutons ou options de menu pour mettre un terme à l’opération. Il est recommandé d’interrompre la capture de paquets avant de procéder à l’analyse.

![image sur fin de capture réseau](/Ressources/Emplacement_libre_2/wireshark_lecture_paquets.png)





#### Cockpit

Pour utiliser Cockpit il faut tout d'abord que notre PC client et notre serveur soit sur le même réseau.
Ensuite nous pouvons acceder a l'interface Cockpit en saissisnat l'adresse IP de notre serveur suivie du port "9090" (port par defaut).

```bash
172.20.16.6:9090
```
Nous devons maintenant nous autentifier pour pouvoir accéder au logiciel.

![image interface web Cockpit](/Ressources/Emplacement_libre_2/Cockpit_login.png)

Sur la gauche, on retrouve le menu permettant d'accéder aux différentes sections.

Au centre, un tableau de bord avec différents widgets, ainsi que la date de dernière connexion, ainsi qu'un message "The programs included with the Debian...". En fait, ce sont des informations que l'on retrouve lors d'une connexion en SSH et ce message n'est autre que le contenu du fichier "/etc/motd" : vous pouvez donc le personnaliser.

![home Cockpit](/Ressources/Emplacement_libre_2/cockpit_home.png)

Le nom d'hôte du serveur est modifiable à cet endroit, en cliquant sur le bouton "modifier" au sein du widget "Configuration".

En cliquant sur l'onglet "Voir les détails et l'historique" du widget "Utilisation", on peut avoir beaucoup plus d'informations sur l'état actuel du serveur. On peut visualiser l'état du CPU, de la RAM, des disques et du réseau.

Dans la partie "Journaux", vous avez accès aux différents logs de votre serveur. Il est possible de filtrer selon une période, les types d'erreurs (info, avertissements, erreurs, alertes, etc.), mais aussi de créer ses propres filtres de recherche. En cliquant sur une entrée, vous avez accès à différentes propriétés.

![log cockpit](/Ressources/Emplacement_libre_2/cockpit_log.png)

La section "Stockage" permet de visualiser des graphiques de performances (lecture et écriture), de visualiser les volumes, les points de montage NFS et les journaux liés au stockage. Sur la droite, on a également une visibilité sur les périphériques physiques (disques physiques, lecteur DVD...).

![stockage cockpit](/Ressources/Emplacement_libre_2/cockpit_stockage.png)

La partie "Réseau" permet de visualiser les journaux liés au réseau, d'ajouter une interface, de déclarer un VLAN ou encore de voir l'utilisation de vos cartes réseau.

![reseau cockpit](/Ressources/Emplacement_libre_2/cockpit_reseau.png)

Ensuite, la section "Comptes" liste les comptes utilisateurs présents sur la machine. On peut créer un nouveau compte ou modifier un compte existant (nom complet, verrouiller le compte, modifier le mot de passe, etc.).

![comptes cockpit](/Ressources/Emplacement_libre_2/cockpit_utilisateurs.png)

Enfin, l'onglet "Terminal" vous permet d'ouvrir un Terminal en mode Web pour administrer votre serveur

![terminal cockpit](/Ressources/Emplacement_libre_2/cockpit_terminal.png)


#### NetData

C’est une solution de monitoring très légère qui affiche via un dashboard l’ensemble des informations sur l’usage des ressources de votre serveur. On y retrouve l’usage CPU, RAM, des disques avec chaque partitions mais également le détail des applications comme memcached, postfix ou redis.

Pour pouvoir utiliser NetData, il faut aller sur cette adresse via un navigateur web :

```
https://www.netdata.cloud
```

![image netdata site avec entour en haut a droite](/Ressources/Emplacement_libre_2/home_netdata.png)

Puis remplir les champs disponible avec l'adresse mail __ecotechsolution.wcs@gmail.fr__ pour se connecter.

![image netdata avec les serveurs](/Ressources/Emplacement_libre_2/node_detaille.png)

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
