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
Get-Service diagtrack | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "Windows Diagnostics Tracking Service Disabled"  }else{   write-Host -ForegroundColor red "Windows Diagnostics Tracking Service not Disabled" }
Get-Service DiagTrack | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "Windows Diagnostics Tracking Service Disabled"  }else{   write-Host -ForegroundColor red "Windows Diagnostics Tracking Service not Disabled" } 

# drwappshsvc
Get-Service dmwappushservice | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "Windows Keylogger Disabled"  }else{   write-Host -ForegroundColor red "Windows Keylogger not Disabled" }

# diagnosticshub
Get-Service diagnosticshub.standardcollector.service | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "diagnosticshub Disabled"  }else{   write-Host -ForegroundColor red "diagnosticshub not Disabled" }

# DcpSvc
Get-Service DcpSvc | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "DcpSvc Disabled"  }else{   write-Host -ForegroundColor red "DcpSvc not Disabled" }

###### Désactivation dans le registre ######

# Sauvegarde du registe avant modification ()
reg export HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection Backup_Reg.reg

# Désactivation de la télémétrie
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f | Out-Null
if($?){   write-Host -ForegroundColor Green "Windows Telemetry Disabled"  }else{   write-Host -ForegroundColor red "Windows Telemetry not Disabled" } 

###### Supprimez les tâche planifier ######

schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable