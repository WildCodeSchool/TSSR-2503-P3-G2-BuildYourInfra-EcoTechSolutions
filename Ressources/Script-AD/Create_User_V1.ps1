$CSVFile = "C:\Scripts\Utilisateurs.csv"
$CSVData = Import-CSV -Path $CSVFile -Delimiter ";" -Encoding UTF8

Foreach($Utilisateur in $CSVData){

    $UtilisateurPrenom = $Utilisateur.Prenom
    $UtilisateurNom = $Utilisateur.Nom
    $UtilisateurMotDePasse = "Azerty1*"
    $UtilisateurLogin = ($UtilisateurPrenom).Substring(0,1) + "." + $UtilisateurNom

    # VÃ©rifier la prÃ©sence de l'utilisateur dans l'AD
    if (Get-ADUser -Filter {SamAccountName -eq $UtilisateurLogin})
    {
        Write-Warning "L'identifiant $UtilisateurLogin existe déja  dans l'AD"
    }
    else
    {
        New-ADUser -Name "$UtilisateurPrenom $UtilisateurNom" `
                    -DisplayName "$UtilisateurPrenom $UtilisateurNom" `
                    -GivenName $UtilisateurPrenom `
                    -Surname $UtilisateurNom `
                    -UserPrincipalName $UtilisateurLogin `
                    -Path "OU=Personnels,DC=ECOTECHSOLUTION, DC=LAN" `
                    -AccountPassword(ConvertTo-SecureString $UtilisateurMotDePasse -AsPlainText -Force) `
                    -ChangePasswordAtLogon $true `
                    -Enabled $true

        Write-Output "Création de l'utilisateur : $UtilisateurLogin ($UtilisateurNom $UtilisateurPrenom)"
    }
}
