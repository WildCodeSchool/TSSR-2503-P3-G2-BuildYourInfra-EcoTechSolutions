# 1. INFRASTRUCTURE RÉSEAU HS

Suite à un problème électrique  dans les locaux de l'entreprise **EcoTech Solution**, certains éléments de l'infrastructure ne fonctionnaient plus.


Le MCO (*Maintient en Condition Opérationnelle*) n'était plus respecté et le PRA a été mis en place au sein des équipes du service Exploitation supervisé par la DSI.

Un diagnostic complet de l'infrastructure a été réalisé et les pannes ont été classé selon leur criticité. Notre PRA prévoyait un rétablissement du réseau principal dans la journée et les autres services plus superficiel le lendemain dernier au plus tard.

## a. Évaluation

### 1. Identification des élément critiques HS

Après analyse du réseau, nous avons identifié 7 machines complètements hors service :
- SRV-RDS
- IREDMAIL
- WINCORESERV-ADDS
- ROUTEUR
- BOR-COM-TEST
- BOR-DIR-TEST
- CT-SRV-WEB


### 2. Documentation des dommages subies

Nous avons aussi compté 5 machines fonctionnelles mais défaillantes, la plupart de ces disfonctionnement venait du matériel que nous avions en stock et qui a été changé dans la première matinée :
- SRV-WSUS - Erreur de boot
- DT-DSI-ADMIN - Pas de connexion internet
- WINCORESRV-ADDS - Erreur de boot
- WINSRV-AD-DHCP-DNS - Pas de connexion internet
- CONTENEUR GLPI - Pas de connexion internet


## b. Identification

1. Classification des services critiques et liste des services à rétablir en priorité

Nous avons mis en place un tableau de PRA avec l'ensemble de notre infrastructure informatique. Chaque éléments a un niveau criticité suivant son importance dans notre production et nous avons ajouté un indicateur sur son niveau de fonctionnement. 
Les techniciens se sont vu attribuer les machines. Ils devaient assurer le suivi de la remise en route en se servant de la documentation du GitHub et avec l'aide des collègues.


##### Panne de l'infrastructure EcoTech Solution - État des lieux au 21/07/2025

##### Évolution de la remise en route

| Éléments                       | Catégorie                 | Criticité | Évaluation            | Technicien     | État de remise en route | Date de résolution |
| ------------------------------ | ------------------------- | --------- | --------------------- | -------------- | ----------------------- | ------------------ |
| CONTENEUR 530-DEBIAN-SRV-GLPI  | Application - Supervision | Majeur    | Fonctionnel en partie | Llyod          | Opérationnel            | 22/07/2025         |
| CONTENEUR 532-DEBIAN-SRV-PROXY | Réseau                    | Mineur    | Fonctionnel           | /              | Non Réhabilité          | 21/07/2025         |
| 573-WINSRV-AD-DHCP-DNS         | Serveur AD                | Critique  | Fonctionnel en partie | Sheldon / John | Fonctionnel             | 22/07/2025         |
| 575-WINCORESRV-ADDS            | Serveur AD                | Critique  | Défaillant            | John           | Fonctionnel             | 21/07/2025         |
| 577-DT-DSI-Admin               | Client d'administration   | Mineur    | Fonctionnel en partie | Alan           | Fonctionnel             | 21/07/2025         |
| 578-SRVWIN-RAID                | Serveur Stockage          | Majeur    | Fonctionnel           | /              | Fonctionnel             | 21/07/2025         |
| 580-SNORT                      | Pentesting                | Mineur    | Fonctionnel           | /              | Fonctionnel             | 21/07/2025         |
| 581-KALI                       | Pentesting                | Mineur    | Fonctionnel           | /              | Fonctionnel             | 21/07/2025         |
| 582-DEBSRV-ZABBIX              | Application - Supervision | Mineur    | Fonctionnel           | /              | Fonctionnel             | 21/07/2025         |
| 587-BOR-DSI-DT-Test            | Client                    | Mineur    | Fonctionnel           | /              | Fonctionnel             | 21/07/2025         |
| 588-SRV-WSUS                   | Serveur - MAJ             | Majeur    | Défaillant            | Alan           | Fonctionnel             | 22/07/2025         |
| 584-SRV-BASTION                | Serveur - Administration  | Majeur    | Fonctionnel           | /              | Fonctionnel             |                    |
| CONTENEUR 531-SRV-WEB          | Application - WEB         | Majeur    | Défaillant            | Alan           | Fonctionnel             | 22/07/2025         |
| 576-WINCORESRV-ADDS2           | Serveur AD                | Critique  | Défaillant            | Alan           | Fonctionnel             | 21/07/2025         |
| 589-SRV-RDS                    | Serveur                   | Critique  | Défaillant            | Sheldon        | Fonctionnel             | 22/07/2025         |
| 586-IREDMAIL                   | Application - Mail        | Majeur    | Défaillant            | Florian        | Fonctionnel             | 21/07/2025         |
| 583-FREEPBX                    | Application - VoIP        | Majeur    | Défaillant            | Sheldon        | Fonctionnel             | 21/07/2025         |
| BOR-COM-TEST                   | Client                    | Mineur    | Défaillant            | John           | Fonctionnel             | 21/07/2025         |
| ROUTEUR                        | Reseau                    | Critique  | Défaillant            | John           | Fonctionnel             | 22/07/2025         |
| BOR-DIR-TEST                   | Client                    | Mineur    | Défaillant            | Sheldon        | Fonctionnel             | 21/07/2025         |
| 572-PFSENSE                    | Reseau                    | Critique  | Fonctionnel           | 21/07/2025     | Fonctionnel             |                    |


## c. Rétablissement du MCO

1. Réparation/remplacement des éléments Si le temps de remise en état est trop long, mettre en place une solution temporaire

Nous avons fait le choix de ne pas remettre en place le proxy qui avait une utilité très superficielle.

2. Vérification que le statut de chaque élément est opérationnel

Selon le tableau de PRA et les tests des techniciens, les machines ont été parfaitement réhabilitées.
## d. Documentation

1. MAJ des documents ou création si non-existant

Il manquait la documentation du serveur web qui a été rajouté par Sheldon. Tous les summary de Proxmox ont été revu et le GitHub a été actualisé.

Pour les réparations physiques des machines :
- SRV-WSUS - Erreur de boot ==> Reconnexion du disque SATA
- DT-DSI-ADMIN - Pas de connexion internet ==> Changement de la carte réseau VMBR200
- WINCORESRV-ADDS - Erreur de boot ==> Changement des barrettes de RAM
- WINSRV-AD-DHCP-DNS - Pas de connexion internet ==> Changement de la carte réseau VMBR200
- CONTENEUR GLPI - Pas de connexion internet ==> Changement de la carte réseau VMBR210

1. Rapport de fin de crise avec les points d'amélioration :

	1. Faiblesse découvertes
	Les GPO et groupes de sécurité nous ont posés de véritables problèmes au début de la  résolution du conteneur GLPI et de l'intégration du serveur WINSRVCORE2. 
	Un audit complet avait été fait au sprint 10 augmentant drastiquement la sécurité de notre  infrastructure. Par exemple, le groupe DSI faisait par de "Protected User" qui empêchait l'utilisation des crédentials de l'AD vers d'autre service (comme GLPI avec l'intégration LDAP). Cette même règle nous empêché d'ajouter le WINCORESERV2 au domaine.
	
	2. Documentation non à jour
	Dans l'ensemble la documentation était de qualité ce qui nous a permis d'être réactif. Quelques détails ont retenu notre attention avec des IP erroné par un changement de machine /DHCP. Et le serveur web qui n'était pas documenté.

# 2. Conclusion

  Le réseau a été complètement réparé en 2 jours pleins avec une nette amélioration sur la documentation et la véracité des informations présentes sur Proxmox / Github. L'organisation et le suivi propre par tableau nous a beaucoup aidé dans la tâche. Cela a aussi permit à l'équipe de travailler des éléments du réseau qui avaient été fait pas d'autres membres.
