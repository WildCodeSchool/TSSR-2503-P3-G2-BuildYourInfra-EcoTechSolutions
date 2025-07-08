## Guide d’installation et configuration – Lynis, KnightCastle, HardenSysvol

## Sommaire

1. [Installation et configuration de l'outil **Lynis**](#lynis)

2. [Installation et configuration de l'outil **KnightCastle**](#knight)

3. [Installation et configuration de l'outil **HardenSysvol**](#harden)


## 1 - Installation et configuration de l'outil **Lynis**
<span id="lynis"/><span> 

Lynis est un utilitaire en ligne de commande qui va permettre d'analyser la configuration d'une machine Linux (ici nous allons l'utiliser sur un serveur Débian hébergeant notre service mail). Cela va nous permettre d'avoir un apercu de la sécurité de notre serveur. 

Pour l'installer il suffit de taper ceci :
```bash
sudo apt-get update 
sudo apt-get install lynis -y
```

Pour être sur que l'utilitaire est sur notre machine, nous pouvons vérifier en tapant : 
```bash
lynis update info
```

![image update info](S09/Ressources/Lynis/update_info.png)

Maintenant nous allons utiliser Lydis pour faire un audit de notre système pour voir ce qui est bien configurer et ce qui peut être amélioé : 
```bash
sudo lynis audit system
```

Au premier audit nous avons un score de **63**. Plus le score est haut et mieux la machine est sécurisée. 

![image debut audit](S09/Ressources/Lynis/Lynis-Score-audit-de-securite.jpg)















