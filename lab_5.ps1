# 1
"--------------------1--------------------" | Out-File ".\lab_5.log"
Test-Connection -ComputerName (hostname) -Count 1  | Select-Object IPV4Address | Out-File -Append ".\lab_5.log"
$nic = Get-WmiObject -computer . -class "win32_networkadapterconfiguration"
"Client Mask: $($nic.ipsubnet | select-object -first 1)" | Out-File -Append ".\lab_5.log"
"Gateway: $($nic.DefaultIPGateway | Select-Object -Last 1)" | Out-File -Append ".\lab_5.log"
Write-Output "task 1 done."

# 2
"--------------------2--------------------" | Out-File -Append ".\lab_5.log"
Getmac | Out-File -Append ".\lab_5.log"
Write-Output "task 2 done."

#  3
"--------------------3--------------------" | Out-File -Append ".\lab_5.log"
ipconfig /all | Out-File -Append ".\lab_5.log"
ping www.bsuir.by | Out-File -Append ".\lab_5.log"
Write-Output "task 3 done."

# 4
"--------------------4--------------------" | Out-File -Append ".\lab_5.log"
ping 192.168.100.1  | Out-File -Append ".\lab_5.log"
ping www.bsuir.by | Out-File -Append ".\lab_5.log"
Write-Output "task 4 done."

# 5
"--------------------5--------------------" | Out-File -Append ".\lab_5.log"
Get-CimInstance -class Win32_PerfFormattedData_Tcpip_NetworkInterface | Out-File -Append ".\lab_5.log"
Write-Output "task 5 done."

# 6
"--------------------6--------------------" | Out-File -Append ".\lab_5.log"
ping -n 1 -r 3 www.bsuir.by | Out-File -Append ".\lab_5.log"
Write-Output "task 6 done."

# 7
"--------------------7--------------------" | Out-File -Append ".\lab_5.log"
tracert www.bsuir.by | Out-File -Append ".\lab_5.log"
Write-Output "task 7 done."

# 8
"--------------------8--------------------" | Out-File -Append ".\lab_5.log"
pathping www.bsuir.by -w 1000 | Out-File -Append ".\lab_5.log"
Write-Output "task 8 done."

# 9
"--------------------9--------------------" | Out-File -Append ".\lab_5.log"
arp -a | Out-File -Append ".\lab_5.log"
Write-Output "task 9 done."

# 10
"--------------------10--------------------" | Out-File -Append ".\lab_5.log"
netstat | Out-File -Append ".\lab_5.log"
Write-Output "task 10 done."

# 11
"--------------------11--------------------" | Out-File -Append ".\lab_5.log"
ping www.bsuir.by -f -l 1452 | Out-File -Append ".\lab_5.log"
Write-Output "task 11 done."
