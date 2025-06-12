# Sommaire

- [Sommaire](#sommaire)
- [Zabbix](#Zabbix)

# Zabbix
<span id="Zabbix"></span>

Dans cette section ont va voir : 
	- Comment ajouté un Hôte sur Zabbix
	- Configuré le Dashboard général

## Ajouté un Hôte sur Zabbix

Pour obtenir les métriques sur une machine sur laquelle ont à installer l'Agent Zabbix, il faut l'ajouté comme Hôtes sur l'interface Web de notre serveur Zabbix.

- Allez sur le menu de gauche, dans Collecte de données/Hôtes, puis cliquez sur "Créer un hôte" en haut à droite.

![zabbix_host1](/S05/Ressources/Zabbix/zabbix_host1.png)

- Dans la fenêtre qui viens de s'ouvrir : 
	- renseignez le nom que vous voulez dans "Nom de l'hôte"
	- Choisissez un groupe pour l'hôte dans "Groupes d'hôte"
	- Dans "Interfaces", cliquez sur "Ajouter". Renseignez l'adresse IP de la machine que vous voulez ajouter comme hôte
	- Pour validé toutes les informations, cliquez sur "Ajouté" en bas à droite de la fenêtre.

![zabbix_host2](/S05/Ressources/Zabbix/zabbix_host2.png)

Pour plus d'information détailler sur la création d'hôte, vous pouvez consulté le documentation officiel [ici](https://www.zabbix.com/documentation/7.0/en/manual/quickstart/host)

## Configuré le Tableau de bord (Dashboard) général

Vous pouvez centraliser les métriques de vos hôtes, les alertes, etc. sur le Tableau de bord.

- Aller sur le menu de gauche, dans Tableau de bord, puis cliquez sur "Editer le tableau de bord" en haut à droite.

![zabbix_dashboard1](/S05/Ressources/Zabbix/zabbix_dashboard1.png)

- Cliquez sur un emplacement vide de votre tableau de bord pour ouvrir la fenêtre d'ajout de widget

![zabbix_dashboard2](/S05/Ressources/Zabbix/zabbix_dashboard2.png)

Dans cette fenêtre, vous pouvez choisir le type de widget (Graphique, Tableau, etc.), le(s) hôte(s) que vous voulez superviser ainsi que les métriques à suivre.

Une fois toutes les information voulu, sélectionner, cliquez sur "Ajouter" en bas à droite de la fenêtre pour créé le Widget.

Vous pouvez déplacer et redimensionner chaque Widget sur votre tableau et vous pouvez modifier le type ou les données d'un widget en cliquant sur l'icone de rouage en au à droit de celui-ci.

Lorsque vous avez fini toutes les ajout/modification souhaiter, valider les modification de votre Tableau de bord en cliquant sur "Enregistrer les modification" en haut à droite.



Pour plus d'information détailler sur le Tableau de bord et les widget, vous pouvez consulté le documentation officiel [ici](https://www.zabbix.com/documentation/7.0/en/manual/web_interface/frontend_sections/dashboards)
