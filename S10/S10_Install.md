## Guide d’installation et configuration – Exegol, Suricata, Snort

  
## Sommaire  
### 1) Guide d’installation et configuration Exegol Suricata    
a. [Installation et configuration de l'outil **Exegol**](#exegol)  
  
b. [Installation et configuration de l'outil **Suricata**](#suricata)  
  
### 2) [Guide d'installation de Snort](#snort) 
 
## 1) Guide d’installation et configuration Exegol  
  
### a - Installation et configuration de l'outil **Exegol**  
<span id="exegol"/><span>   
   
Exegol est un environnement de pentest basé sur Docker, offrant une alternative moderne et flexible aux traditionnels Kali Linux, Parrot OS, et BlackArch. Exegol vise à fournir un environnement isolé et reproductible adapté à divers besoins en cybersécurité.
Une multitude d’outils pré-installés et pré-configurés sont déjà présents, tels que Nmap,  Bloodhound, Hydra, metasploit, etc)    
  
Exegol peut être installé sur les systèmes d'exploitation les plus courants : Ubuntu/Debian, macOS ou Windows. 
Ici, nous allons l'installer sur Ubuntu.  

Prérecquis:  

Avant d'installer Exegol, il nous faut :  
- Git  
- Python 3  
- Docker  
- Stockage : au moins 100 Go  
  
#### Installez Git et Python s'ils ne sont pas déjà installés :  
  
> sudo apt update && sudo apt install -y git python3 pipx  
  
#### Assurez-vous que pipx est dans PATH et rechargez le shell:  
  
> pipx ensurepath && exec $SHELL  
  
#### Installation de Docker:  
> sudo apt install docker.io  
  
#### Installation du wrapper:  
> pipx install exegol  
> echo "alias exegol='sudo -E $(echo ~/.local/bin/exegol)'" >> ~/.bash_aliases && source ~/.bash_aliases  

#### Installation de l'image:  
> exegol install  

#### Exécutez Exegol:    
> exegol start



## Installation de Snort
<span id="snort"/><span>

Pour installer **Snort**, nous avons créer une nouvelle VM Ubuntu faisant partie du rseau de EcoTechSolution. 
Son IP est 172.16.20.8/24.
Tout d'abord nous allons mettre a jours les paquets :
```bash
sudo apt update && sudo apt upgrade -y
```

Une fois cela fait nous allons installer **Snort** :
```bash
sudo apt install snort
```

Mettre l'adresse de réseau 172.16.20.0/24
Pour vérifier si Snort est bien installé :
```bash
systemctl status snort
```

Maintenant que **Snort** est bien installé, nous allons le configurer pour qu'il reçcoit les paquets de l'ensemble du réseau :

![ipa]()

```bash
# Avec ens18 la carte réseau du réseau interne
ip link set dev ens18 promisc on
```

Puis nous allons désactiver le déchargement d'interface (pour eviter que Snort tronque les gros paquets de données) :

```bash
sudo ethtool -K ens18 gro off lro off
```

Pour vérifier que les changement ont bien été pris en compte, utiliser cette commande :
```bash
ethtool -k enp0s8 | grep receive-offload
```

Malheureusement ces changements ne sont valable que durant cette session. Pour contrer cela nous allons créer un ficher :
![fichier_snort3-nic]()

Pour le rendre actif, nous allons le recharger et l'activer au démarrage :
```bash
sudo systemctl daemon-reload
sudo systemctl enable --now snort3-nic.service
```

Le logiciel est maintenant fonctionnel.
A présent nous allons lui rajouter des règles pour le rendre plus efficient. 








