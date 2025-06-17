Import-Module ActiveDirectory

function New-LogonHours {
    $logonHours = New-Object byte[] 21
    # Du lundi (0) au vendredi (4), on active de 8h30 (demi-heure 17) à 19h30 (demi-heure 39)
    for ($day=0; $day -lt 5; $day++) {
        for ($halfHour=17; $halfHour -le 39; $halfHour++) {
            $byteIndex = $day * 3 + [math]::Floor($halfHour / 8)
            $bitIndex = $halfHour % 8
            $logonHours[$byteIndex] = $logonHours[$byteIndex] -bor (1 -shl $bitIndex)
        }
    }
    return $logonHours
}

$allowedHours = New-LogonHours

# Récupérer tous les utilisateurs dans l'OU Bordeaux
$users = Get-ADUser -SearchBase "OU=Bordeaux,DC=EcoTechSolution,DC=lan" -Filter * -Properties MemberOf

foreach ($user in $users) {
    # Vérifier si l'utilisateur est membre du groupe Grp-Bypass
    if ($user.MemberOf -notcontains "CN=Grp-Bypass,OU=Admin,DC=EcoTechSolution,DC=lan") {
        # Appliquer la restriction horaire
        Set-ADUser -Identity $user.SamAccountName -LogonHours $allowedHours
        Write-Host "Restriction appliquée à $($user.SamAccountName)"
    } else {
        Write-Host "Bypass pour $($user.SamAccountName) (membre Grp-Bypass)"
    }
}
