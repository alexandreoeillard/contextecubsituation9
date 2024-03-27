#=====================================================
#
#NAME: Exercice DHCP1.ps1
#AUTHOR: Oeillard Alexandre
#DATE:27/03/2024
#
#VERSION 1.0
#COMMENTS: Demande info pour créer nouvelle étendue
#=====================================================

# Demander à l'utilisateur les informations pour la nouvelle étendue DHCP
$nomEtendue = Read-Host "Entrez le nom de la nouvelle étendue DHCP"
$adresseReseau = Read-Host "Entrez l'adresse réseau de la nouvelle étendue (par exemple 192.168.1.0)"
$masqueReseau = Read-Host "Entrez le masque de la nouvelle étendue"
$premiereAdresse = Read-Host "Entrez la première adresse à distribuer"
$derniereAdresse = Read-Host "Entrez la dernière adresse à distribuer"
$adressePasserelle = Read-Host "Entrez l'adresse de passerelle à diffuser"

# Afficher les informations entrées par l'utilisateur
Write-Host "Récapitulatif des informations entrées :"-ForegroundColor Yellow
Write-Host "Nom de l'étendue DHCP : $nomEtendue"-ForegroundColor Cyan
Write-Host "Adresse réseau : $adresseReseau"-ForegroundColor Cyan
Write-Host "Masque réseau : $masqueReseau"-ForegroundColor Cyan
Write-Host "Première adresse à distribuer : $premiereAdresse"-ForegroundColor Cyan
Write-Host "Dernière adresse à distribuer : $derniereAdresse"-ForegroundColor Cyan
Write-Host "Adresse de passerelle : $adressePasserelle"-ForegroundColor Cyan

# Demander à l'utilisateur de confirmer la création de l'étendue DHCP
$confirmation = Read-Host "Entrez Oui pour créer l'étendue DHCP..."

if ($confirmation -eq "Oui") {
    # Créer l'étendue DHCP
    Add-DhcpServerv4Scope -Name $nomEtendue -StartRange $premiereAdresse -EndRange $derniereAdresse -SubnetMask $masqueReseau -State Active

    # Ajout Passerelle Options d'étendue
    Set-DhcpServerv4OptionValue -OptionId 3 -Value $adressePasserelle -State Active

    # Afficher un message de confirmation avec les détails de l'étendue créée
    Write-Host "L'étendue DHCP '$nomEtendue' a été créée avec succès."-ForegroundColor Green
    Write-Host "Nom de l'étendue DHCP : $nomEtendue"-ForegroundColor Green
    Write-Host "Adresse réseau : $adresseReseau"-ForegroundColor Green
    Write-Host "Masque réseau : $masqueReseau"-ForegroundColor Green
    Write-Host "Première adresse à distribuer : $premiereAdresse"-ForegroundColor Green
    Write-Host "Dernière adresse à distribuer : $derniereAdresse"-ForegroundColor Green
    Write-Host "Adresse de passerelle : $adressePasserelle"-ForegroundColor Green
}
else {
    Write-Host "Création de l'étendue DHCP annulée. Aucune action effectuée."-ForegroundColor Red
}
