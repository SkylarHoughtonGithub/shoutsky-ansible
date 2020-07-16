$DNS1 = Read-Host "Enter DNS1: "
$DNS2 = Read-Host "Enter DNS2: "

Set-DnsClientServerAddress -InterfaceAlias *Ethernet* -ServerAddresses ($DNS1, $DNS2)