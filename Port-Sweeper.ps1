$computer = "localhost"  # Replace with the target computer name or IP address
$startPort = 1  # Specify the starting port number
$endPort = 65535  # Specify the ending port number

$colorOffline = "Red"
$colorOnline = "Green"

for ($port = $startPort; $port -le $endPort; $port++) {
    $result = Test-NetConnection -ComputerName $computer -Port $port -InformationLevel "Quiet" -WarningAction SilentlyContinue

    if ($result.TcpTestSucceeded) {
        Write-Host "Port $port is open" -ForegroundColor $colorOnline
    } else {
        Write-Host "Port $port is closed" -ForegroundColor $colorOffline
    }
}