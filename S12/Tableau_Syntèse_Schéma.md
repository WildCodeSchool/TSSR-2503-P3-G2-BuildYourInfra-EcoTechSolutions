# Tableau détaillé de l'infrastructure - Matériel et Configuration

| ID du matériel | Nom du matériel dans la GUI Proxmox | Nom du matériel dans la machine | Type d'objet Proxmox (VM ou CT) | OS | Fonction principal | N° de carte réseau (vmb) | Adresse IP CIDR | Nombre de disques, et par disque | RAM |
|:-------------:|:----------------------------------:|:-------------------------------:|:-------------------------------:|:--:|:-----------------:|:----------------------:|:---------------:|:-------------------------------:|:---:|
| | | | | | | | | Taille totale (en Go) | Espace libre (en Go) | Espace libre (%) | Taille totale (en Go) | Taille utilisée du serveur (En Go) |
| 532 | SRV-PROXY | SRV-PROXY | CT | Debian 12 | Proxy web | 210 | 172.20.20.4/24 | 8 | 8 | 100 | 1 | 1.68 |
| 533 | SRV-WEB | SRV-WEB | CT | Debian 12 | Serveur web | 210 | 172.20.20.3/24 | 16 | 15 | 93.75 | 2 | 2.54 |
| 534 | SRV-GLPI | SRV-GLPI | CT | Debian 12 | Supervision | 210 | 172.20.20.2/24 | 10 | 6.2 | 62 | 0.512 | 50 |
| 572 | G2-pfsense | pfsense.home.arpa | VM | Debian 12 | Pare-feu | 2 : 200 ; 210 | INTERFACE WAN : 192.168.3/24 (vmb2)<br>INTERFACE LAN : 172.16.20.254/24 (vmb200)<br>INTERFACE DMZ : 172.20.20.254/24 (vmb210) | 10 | 7.7 | 77 | 2 | 51 |
| 573 | G2-WINSRV-AD-DHCP-DNS | WINSRV-AD-DHCP-DNS | VM | Windows Server 2022 | Contrôleur de domaine | 200 | 172.16.20.3/24 | 32 | 6.95 | 21.7 | 4 | 74 |
| 575 | G2-WINCORESRV-ADDS | WINCORESRV-ADDS | VM | Windows Server 2022 Core | Contrôleur de domaine | 200 | 172.16.20.5/24 | 20 | 19 | 50 | 1 | 48 |
| 576 | G2-WINCORESRV-ADDS2 | WINCORESRV2 | VM | Windows Server 2022 Core | Contrôleur de domaine | 200 | 172.16.20.6/24 | 20 | 10.7 | 53.5 | 2 | 64 |
| 577 | G2-DT-DSI-Admin | D1-DSI-Admin | VM | Ubuntu 24.04 LTS | Administration | 200 | 172.16.20.7/24 | 25 | 2.5 | 10 | 1 | 50 |
| 578 | G2-SRVWIN-RAID | SRVWIN-RAID | VM | Windows Server 2022 | Serveur de stockage | 200 | 172.16.20.2/24 | 32(C) 75(E) | 9.5(C) 5(E) | 29.6(C) 5(E) | 4 | 57 |
| 580 | G2-SNORT | snort3 | VM | Ubuntu 24.06.2 LTS | Pentest défense | 200 | 172.16.20.9/24 | 50 | 35 | 70 | 8 | 87 |
| 581 | KALI | kali | VM | Kali-linux-2023 | Pentest attaque | 200 | 172.16.20.10/24 | 100 | 1 | 1 | 4 | 58 |
| 582 | G2-DEBSRV-ZABBIX | debianserver | VM | Debian 12 | Supervision | 200 | 172.16.20.11/24 | 10 | 5 | 50 | 2 | 45 |
| 583 | G2-FREEPBX | freepbx.sangoma.local | VM | | Téléphonie | 200 | 172.16.20.12/24 | 32 | 26.5 | 83 | 4 | 48 |
| 584 | SRV-BASTION | SRV-BASTION | VM | Debian 12 | Serveur Bastion | 210 | 172.20.20.7/24 | 10 | 4.4 | 44 | 2 | 38 |
| 585 | G2-ROUTEUR | vvos | VM | Vyos 1.5 | Routage | 200 ; 220 | INTERFACE SERVEUR : 172.16.20.253/24 (vmb200)<br>INTERFACE LAN COM : 172.16.20.253/24 (vmb220) | 4 | 2.4 | 60 | 1 | 37 |
| 586 | G2-SRV-IREDMAIL | ecotechsolution.mail.lan | VM | Debian 12 | Serveur de messagerie | 210 | 172.20.20.7/24 | 10 | 3.5 | 35 | 2 | 25 |
| 587 | G2-BOR-DSI-DT-Test | BOR-DSI-DT-Test | VM | Windows 10 Pro | Machine client DSI Test | 200 | 172.16.20.25/24 | 32 | 7 | 87.5 | 4 | 80 |
| 588 | G2-SRV-WSUS | WIN-WSUS | VM | Windows Server 2022 | Serveur de mise à jour | 200 | 172.16.20.13/24 | 32(C) 25(E) | 7.4(C) 0(E) | 23(C) 0(E) | 4 | 76 |
| 589 | G2-SRV-RDS | | VM | Windows Server 2022 | Prise en main à distance | 200 | 172.16.20.8/24 | 32 | 25 | 50 | 4 | 24 |
| 590 | G2-RDS | WINSRV-RDS | VM | Windows Server 2022 | Prise en main à distance | 200 | 172.16.20.9/24 | 32 | 17 | 53 | 4 | 80 |
| 591 | G2-BOR-COM-CLIENT | BOR-COM-CLIENT | VM | Windows 10 Pro | Client test routage | 220 | 172.16.50.5/24 | 50 | 23.5 | 47 | 4 | 80 |
