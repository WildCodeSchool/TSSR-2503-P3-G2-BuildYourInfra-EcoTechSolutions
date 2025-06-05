#####################################################################################
#                                                                                   #
# Scripte de désactivation des Services de Télémétrie de Microsoft pour Windows 10  #
#                                                                                   #
# Certaines mises à jour Windows peuvent réactiver la télémétrie.                   #
# Vérifiez régulièrement les paramètres après chaque mise à jour majeure.           #
#                                                                                   #
#####################################################################################


###### Arrêt des Services ######

# DiagTrack
Stop-Service -Name DiagTrack -Force

# diagsvc
Stop-Service -Name diagsvc -Force

# drwappshsvc
Stop-Service -Name drwappshsvc -Force

# dhscs
Stop-Service -Name dhscs -Force

# DcpSvc
Stop-Service -Name DcpSvc -Force

###### Désactivation du redemarage des Services ######

# DiagTrack
Set-Service -Name DiagTrack -StartupType Disable

# diagsvc
Set-Serivce -Name diagsvc -StartupType Disable

# drwappshsvc
Set-Service -Name drwappshsvc -StartupType Disable

# dhscs
Set-Service -Name dhscs -StartupType Disable

# DcpSvc
Set-Service -Name DcpSvc -StartupType Disable

###### Désactivation dans le registre ######

# Sauvegarde du registe avant modification
reg export HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection Backup_Reg.reg

# Désactivation de la télémétrie
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0

###### Supprimez les tâche planifier ######

schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable