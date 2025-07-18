## Guide d'utilisation des logiciels – Exegol, Suricata  
  
## Sommaire  
### 1) Guide d’utilisation Exegol, Suricata  
a. [Guide d'utilisation  de l'outil **Exegol**](#exegol)  
    [ Partie 1 - La reconnaissance ](exegol_reconnaissance)  
    [ Partie 2 - L' exploitation ](exegol_exploitation)  
    [ Partie 3 - L'escalade de privilèges ](exegol_privileges)  
    [ Partie 4 - La perturbation ](exegol_perturbation)  
    
  

b. [Guide d'utilisation de l'outil **Suricata**](#suricata)  
  


### Guide d'utilisation  de l'outil **Exegol**  
<span id="exegol"/><span>   
  
### Plan d'attaque

  | Attaque                                     | Type              | Cible                                                      | Outils Alternatifs |
| ------------------------------------------- | ----------------- | ---------------------------------------------------------- | ------------------ |
| Scan de ports                               | Reconnaissance    | N'importe quelle machine avec des ports ouverts            | Nmap               |
| Escalade de privilèges                      | Post-exploitation | Windows 10                                                 | -                  |
| Attaques par Force Brute                    | Authentification  | Serveur Debian (avec SSH activé)                           | Medusa             |
| Attaque Man-in-the-Middle (MITM)            | Interception      | Windows ou Linux                                           | Wireshark          |
| Exploitation de Serveur Web Apache Tomcat   | Exploitation      | Serveur Linux avec Apache Tomcat                           | -                  |
| Attaques de réinitialisation de session TCP | Perturbation      | Serveur Linux Debian ou Windows (avec services TCP actifs) | hping3             |
| Attaques FTP par injection de commande      | Exploitation      | Serveur Linux Debian ou Windows (avec vsFTPd 2.3.4)        | -                  |

#### Partie 1 - La reconnaissance  
<span id="exegol_reconnaissance"/><span>  

##### Identifier les vulnérabilités, choisir un vecteur d'attaque
###### Logiciels / commandes utilisés :
- whois
- nslookup
- nmap
- enum4linux
- smbclient
- gobuster

Etape 1 :
Récupération d'une adresse IP dans le réseau par DHCP.
Notre adresse ==> 172.16.20.12/24

Etape 2 :
`ip a` pour avoir les informations sur le réseau où nous sommes, (adresse IP, DNS, idée de plage, passerelle)

Etape 3 :
Ouverture d'un conteneur Exegol

- commande nmap -sN 172.16.20.0/24 pour scanner les machines

![](/S10/Ressources/Attaque/01_nmap_sN.png)  

![](/S10/Ressources/Attaque/02_nmap_sN.png)  

![](/S10/Ressources/Attaque/03_nmap_sN.png)  


Récupération de plusieurs adresses IP de machines différentes. (WINDOWS ADDS-DHCP-DNS, SERVEUR ZABBIX, SRV RAID)

- Scan des top ports 100 avec nmap sur l'ADDS
`nmap -sV --top-ports 100 172.16.20.3`

![](/S10/Ressources/Attaque/01_nmap--top-ports_ADDS.png)



- Scan des versions des ports 
`nmap -sS -sV -p 22,53,80,88,135,139,389,445 <172.16.20.3>`

Test des dossiers SMB et recherche d'identifiants
`enum4linux -U(pour users) ou -G(pour groupe) / 172.16.20.3`

Pas de résultat, acced denied pour tout. La machine ADDS semble bien vérouillé.

Le premier scan nmap nous a donné une machine avec un DNS DT-DSI-Admin qui semble correspondre à une machine d'administration de la direction des services informatiques.

Nous avons lancé un scan approfondi des ports `nmap -p- -sV -A 172.16.20.7` et il en ressort un port 22 ouvert avec 2 ssh-hotkey. Nous allons exploité cette information.

![](/S10/Ressources/Attaque/01_scan_pc_admin.png)  

Utilisation de script nmap pour récupérer plus d'informations.

![](/S10/Ressources/Attaque/02_scriptssh.png)  

Test de brute force sur le port 22 du pc admin.
Il y a eu 2800 tentatives qui se sont soldés en échec.


#### Partie 2 - L' exploitation  
<span id="exegol_exploitation"/><span>  
  

#### Partie 3 - L'escalade de privilèges  
<span id="exegol_privileges"/><span>  
  

#### Partie 4 - La perturbation  
<span id="exegol_perturbation"/><span>  
  
  
  
  

### Guide d'utilisation  de l'outil **Suricata**  
<span id="suricata"/><span>   
