## Installation serveur web 

Nous allons avoir besoin d'une nouvelle machine pour notre serveur web. Ici nous allons créer un container et installer Debian dessus. 
Une fois créer nous allons nous assurer qu'elle fait bien partie du réseau avec la commande 
```bash
ip a
```
![ipa](Ressources/ip_a.png)

Mettre à jour la Debian avec :
```bash
sudo apt update && sudo apt upgrade -y
```
Puis installer **apache2** :
```bash
apt install apache2 -y
```
