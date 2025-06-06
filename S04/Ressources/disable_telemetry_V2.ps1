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
if($?) 
{
     write-Host -ForegroundColor Green "Service diagTrack Désactiver"  
}
else
{
       write-Host -ForegroundColor red "Service diagTrack NON Désactiver"
}

Get-Service DiagTrack | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?)
{
       write-Host -ForegroundColor Green "Service DiagTrack Désactiver"  
}
else
{
       write-Host -ForegroundColor red "Service DiagTrack NON Désactiver" 
} 

# drwappshsvc
Get-Service dmwappushservice | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?)
{
       write-Host -ForegroundColor Green "Windows Keylogger Désactiver"  
}
else
{
       write-Host -ForegroundColor red "Windows Keylogger NON Désactiver" 
}

# diagnosticshub
Get-Service diagnosticshub.standardcollector.service | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?)
{
       write-Host -ForegroundColor Green "diagnosticshub Désactiver"  
}
else
{
       write-Host -ForegroundColor red "diagnosticshub NON Désactiver"
}

###### Désactivation dans le registre ######

### Sauvegarde du registe avant 1er modification ###
if(Test-Path C:\Registre\Backup_Reg.reg)
{
    Write-Host -ForegroundColor Green "Sauvegarde original du registre déjà présente dans C:\Registre"
}
else 
{
    New-Item -Path C:\ -Name Registre -ItemType Directory > $null
    reg export HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection C:\Registre\Backup_Reg.reg
}

# Désactivation de la télémétrie
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f | Out-Null
if($?)
{
       write-Host -ForegroundColor Green "Télémétrie Windows Désactiver"  
}
else
{
       write-Host -ForegroundColor red "Télémétrie Windows NON Désactiver" 
} 

###### Supprimez les tâche planifier ######

schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
