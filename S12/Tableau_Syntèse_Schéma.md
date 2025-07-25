# Tableau infrastructure - Partie 2 (Serveurs Windows et Administration)

| | Nom du matériel dans la GUI Proxmox | G2-WINSRV-AD-DHCP-DNS | G2-WINCORESRV-ADDS | G2-WINCORESRV-ADDS2 | G2-SRV-WSUS | G2-WINSRV-RDS | G2-SRVWIN-RAID | G2-ROUTEUR | G2-DT-DSI-Admin | SRV-BASTION |
|:---|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| | **Nom du matériel dans la machine** | WINSRV-AD-DHCP-DNS | WINCORESRV-ADDS | WINCORESRV2 | SRV-WSUS | WINSRV-RDS | SRVWIN-RAID | vyos | DT-DSI-Admin | SRV-BASTION |
| | **ID du matériel** | 573 | 575 | 576 | 588 | 590 | 578 | 585 | 577 | 584 |
| | **Type d'objet Proxmox (VM ou CT)** | VM | VM | VM | VM | VM | VM | VM | VM | VM |
| | **OS** | Windows Server 2022 | Windows Server 2022 Core | Windows Server 2022 Core | Windows Server 2022 | Windows Server 2022 | Windows Server 2022 | Vyos 1.5 | Ubuntu 24.04.02 LTS | Debian 12 |
| | **Fonction principal** | Contrôleur de domaine | Contrôleur de domaine | Contrôleur de domaine | Serveur de mise à jour | Prise en main à distance | Serveur de stockage | Routage | Administration | Serveur Bastion |
| | **N° de carte réseau (vmb)** | 200 | 200 | 200 | 200 | 200 | 200 | 200 ; 220<br>INTERFACE SERVEUR<br>: 172.16.20.253/24<br>(vmb200)<br>INTERFACE LAN COM<br>: 172.16.50.253/24<br>(vmb220) | 200 | 210 |
| | **Adresse IP, CIDR** | 172.16.20.3/24 | 172.16.20.5/24 | 172.16.20.6/24 | 172.16.20.13/24 | 172.16.20.9/24 | 172.16.20.2/24 | | 172.16.20.7/24 | 172.20.20.7/24 |
| **Nombre de disques, et par disque :** | **Taille totale (en Go)** | 32 | 20 | 20 | 32(C) / 25(E) | 32 | 32(C) / 5(E) | 4 | 25 | 10 |
| | **Espace libre (en Go)** | 6.95 | 10 | 10.7 | 7.4(C) 0(E) | 17 | 9.5(C) 5(E) | 2.4 | 2.5 | 4.4 |
| | **Espace libre (en %)** | 21.7 | 50 | 53.5 | 23(C) 0(E) | 53 | 29.6(C) 5(E) | 60 | 10 | 44 |
| **RAM :** | **Taille totale (En Go)** | 4 | 1 | 2 | 4 | 4 | 4 | 1 | 1 | 2 |
| | **Taille utilisée, en moyenne (en %)** | 74 | 48 | 64 | 76 | 80 | 57 | 37 | 50 | 38 |
