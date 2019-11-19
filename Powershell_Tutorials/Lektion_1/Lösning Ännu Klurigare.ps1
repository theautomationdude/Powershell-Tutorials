$Servers = Import-Csv -Path .\Servers.csv
$ServersOut =@()
ForEach($Server in $Servers)
    {
    $Servername = $Server.Name.Split("#")[1]
    $ObjServer = Get-AdComputer -Filter {name -eq $Servername  -and Created -gt "2019-01-01 00:00:00"} -Properties IPv4Address,Created | Select-Object Name,IPv4Address,Created
    $ServersOut += $ObjServer
    }
$ServersOut | Export-Csv -Path .\ServersOut.csv -NoTypeInformation -Delimiter ";"   