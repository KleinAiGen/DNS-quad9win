# Set DNS servers to Quad9
$adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
foreach ($adapter in $adapters) {
    Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses '9.9.9.9', '149.112.112.112' -PassThru
}

# Flush DNS cache
Clear-DnsClientCache

# Open ipleak.net in the default browser
Start-Process "https://ipleak.net/"
