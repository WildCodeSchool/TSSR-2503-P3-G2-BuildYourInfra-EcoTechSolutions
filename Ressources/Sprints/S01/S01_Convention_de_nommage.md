## 1 - Nom de Domaine
--------------

=> FQDN = ``EcoTechSolution.lan``

## 2 - Unités Organisationnelles (OU)
------------


##### Exemple de structure (à perfectionner) :
- **Plusieurs niveaux :**
	- Niveau 1 => Par société (Ex: ``EcoTechSolution`` | ``Studio Dlight`` …)  
	- Niveau 2 => Par département (Ex: ``Finance et Comptabilité`` | ``DSI`` …)  
	- Niveau 3 => Par site (Ex: ``Bordeaux``… )  
	- Niveau 4 => Par type (Ex: ``Ordinateurs`` | ``Utilisateurs`` …)   
	- Niveau 5 => Par fonction indépendante non inclus dans un service (Ex: ``Responsable Média`` | ``Directeur adjoint`` …)  
-  **Exemple de Hiérarchie** :   
	- **Par Département :**  
	Bordeaux  
	  ├── Direction   
	  ├── Directtion des Ressources Humaines  
	  ├── DSI  
	  ├── Communication  
	  ├── Developpement  
	  ├── Finance et Comptabilité  
	  └── Service Commercial
   
### 3 - Groupe de Sécurité  
-----------------  
  
  
  
### 4 - Ordinateurs  
--------------------  
##### Placement :  
- **Organisation des ordinateurs par :**  
	-  Site (Ex: ``Bordeaux\\Ordinateur``)  
	-  Departement (Ex: ``DSI\\Computer``)  
  
##### Convention de nommage :  
- **Format** => `` [Site]_Département]_[Type]_[ID]``  
	- **Sites**  
		- Paris => ``PAR``  
		- Bordeaux => ``BOR``  
		- Nantes => ``NAN``  
	- **Départements**  
		- Communication => ``COM``  
		- Développement => ``DEV``  
		- Direction => ``DIR``  
		- Direction des Ressources Humaines => ``DRH``  
		- Finances et Comptabilité => ``FINC``  
		- Service Commercial => ``SERCO``  
	- **Type**  
		- Desktops => ``DT``  
		- Laptops (Si on en garde) => ``LT``  
		- Serveur suivi par la fonction (DHCP, DNS …) => ``SRV_[FONCTION]``  
		- Routeur => ``RT``  
		- Imprimante => ``IMP``
      
**NB : ID => Nom Ordinateur**  
EX :  
- ``BOR_DEV_DT_PA82474``  
  
### 5 - Utilisateurs  

  
  
  
  
  
  
### 6 - GPO  
  
  
  
  
  
