# Run as administrator inside the analysis VM. Adjust the interface name if needed.
$if = (Get-NetAdapter | Where-Object Status -eq 'Up' | Select-Object -First 1).Name
New-NetIPAddress -InterfaceAlias $if -IPAddress 10.0.0.10 -PrefixLength 24 -DefaultGateway 10.0.0.1
Set-DnsClientServerAddress -InterfaceAlias $if -ServerAddresses 10.0.0.1
Get-NetIPConfiguration -InterfaceAlias $if
