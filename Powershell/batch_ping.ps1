$names = Get-content -Path 'C:\Users\shoughton\Documents\Scripts\Powershell\ip.txt'
$Output = foreach ($name in $names) {
    [PSCustomObject]@{
        ComputerName = $name
        Connected = Test-Connection -ComputerName $name -Quiet -Count 1
    }
}
$Output | Export-Csv -Path 'C:\Users\shoughton\Documents\Scripts\Powershell\result.csv' -NoTypeInformation