Set FSO = CreateObject("Scripting.FileSystemObject")
Set f = FSO.CreateTextFile("lab7.txt", True)
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set IPConfigSet = objWMIService.ExecQuery("Select * from Win32_NetworkAdapterConfiguration")

' 1
f.WriteLine("--------------------1--------------------")
For Each IPConfig in IPConfigSet
        If Not IsNull(IPConfig.IPAddress) Then
            For i = LBound(IPConfig.IPAddress) to UBound(IPConfig.IPAddress)
                If Not (IPConfig.IPAddress(i) = "0.0.0.0") Then
                        If IPAddr = "" Then
                            IPAddr = IPAddr + IPConfig.IPAddress(i) + vbNewLine
                        End If
                End If
            Next
        End If
    If Not IsNull(IPConfig.DefaultIPGateway) Then
    For i=LBound(IPConfig.DefaultIPGateway) to UBound(IPConfig.DefaultIPGateway)
        If Not (IPConfig.DefaultIPGateway(i) = "0.0.0.0") Then
            If IPGate = "" Then
                IPGate = IPGate + IPConfig.DefaultIPGateway(i) + vbNewLine
            End If
        End If
    Next
End If
If Not IsNull(IPConfig.IPSubnet) Then
    For i=LBound(IPConfig.IPSubnet) to UBound(IPConfig.IPSubnet)
        If Not (IPConfig.IPSubnet(i) = "0.0.0.0") Then
            If IPMask="" Then
                IPMask = IPMask + IPConfig.IPSubnet(i) + vbNewLine
            End If
        End If
    Next
End If
Next
f.WriteLine("IP Adress")
f.WriteLine(IPAddr)
f.WriteLine("Default Gateway")
f.WriteLine(IPGate)
f.WriteLine("Subnet Mask")
f.WriteLine(IPMask)

' 2
f.WriteLine("--------------------2--------------------")
Set objLocator = CreateObject("WbemScripting.SWbemLocator")
Set objWMIService = objLocator.ConnectServer(".", "root\cimv2")
Set HostNameSet = objWMIService.ExecQuery("Select * From Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")
For Each objitem in HostNameSet
   f.WriteLine "MAC address: " & objitem.MACAddress & VbCrLf
Next

' 3
f.WriteLine("--------------------3--------------------")
For Each objNetAdapter In HostNameSet
    errEnable = objNetAdapter.EnableDHCP()
    f.WriteLine("DHCPServer")
    f.WriteLine(errEnable)
Next
f.WriteLine("DNSServerSearchOrder")
For Each IPConfig in IPConfigSet
    errDNSServerSearchOrder = IPConfig.SetDNSServerSearchOrder(strDNSServerSearchOrder)
Next
f.WriteLine(errDNSServerSearchOrder)

Dim hostname
hostname = "www.bsuir.by"
Set WshShell = WScript.CreateObject("WScript.Shell")
Ping = WshShell.Run("ping -n 1 " & hostname, 0, True)
Select Case Ping
Case 0 
    f.WriteLine ("Remote host '" & hostname & "' is online")
Case 1 
    f.WriteLine ("Remote host '" & hostname & "' is offline")
End Select

f.WriteLine(vbCrLf & "--------------------4--------------------")
Set WshShell = WScript.CreateObject("WScript.Shell")
Ping = WshShell.Run("ping -a 1" &IPGate, 0, True)
Select Case Ping
Case 0 
   f.WriteLine ("Default gateway '" & IPGate & "' is available")
Case 1 
    f.WriteLine ("Default gateway '" & IPGate & "' is unavailable")
End Select
    f.WriteLine ("Remote node availability www.bsuir.by")
Dim host
host = " www.bsuir.by"
Set WshShell = WScript.CreateObject("WScript.Shell")
Ping = WshShell.Run("ping -n 1 " & host, 0, True)
Select Case Ping
Case 0 
    f.WriteLine ("Remote host '" & host & "' is online")
Case 1 
    f.WriteLine ("Remote host '" & host & "' is offline")
End Select

' 5
f.WriteLine(vbCrLf & "--------------------5--------------------")
f.WriteLine("Network capacity")
set objWSH = CreateObject("WScript.Shell")
strCommand = "wmic nic where netEnabled=true get name, speed"
set objA = objWSH.Exec(strCommand)
strMsg = objA.StdOut.ReadAll()
f.WriteLine(strMsg)

' 6
f.WriteLine("--------------------6--------------------")
strCommand2 = "tracert -h 3 www.bsuir.by"
set objA2 = objWSH.Exec(strCommand2)
strMsg2 = objA2.StdOut.ReadAll()
f.WriteLine(strMsg2)

' 7
f.WriteLine("--------------------7--------------------")
strCommand = "tracert www.bsuir.by"
set objA = objWSH.Exec(strCommand)
strMsg = objA.StdOut.ReadAll()
f.WriteLine(strMsg)

' 8
f.WriteLine("--------------------8--------------------")
f.WriteLine("The slowest sections")
strCommand = "tracert www.bsuir.by"
set objA = objWSH.Exec(strCommand)
strMsg = objA.StdOut.ReadAll()
f.WriteLine(strMsg)

' 9
f.WriteLine("--------------------9--------------------")
strCommand = "arp -a"
set objA = objWSH.Exec(strCommand)
strMsg = objA.StdOut.ReadAll()
f.WriteLine(strMsg)

' 10
f.WriteLine("--------------------10--------------------")
strComputer = "."
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colShares = objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapter")
Set NetConnStat = CreateObject("Scripting.Dictionary")
NetConnStat.Add 0, "Disconnected"
NetConnStat.Add 1, "Connecting"
NetConnStat.Add 2, "Connected"
NetConnStat.Add 3, "Disconnecting"
NetConnStat.Add 4, "Hardware not present"
NetConnStat.Add 5, "Hardware disabled"
NetConnStat.Add 6, "Hardware malfunction"
NetConnStat.Add 7, "Media disconnected"
NetConnStat.Add 8, "Authenticating"
NetConnStat.Add 9, "Authentication succeeded"
NetConnStat.Add 10, "Authentication failed"
NetConnStat.Add 11, "Invalid address"
NetConnStat.Add 12, "Credentials required"
NetConnStat.Add Null, "Null"
For Each objShare In colShares
    f.WriteLine objshare.Description
Next

' 11
f.WriteLine("--------------------11--------------------")
strCommand = "ping www.bsuir.by -f -l 1452"
set objA = objWSH.Exec(strCommand)
strMsg = objA.StdOut.ReadAll()
f.WriteLine(strMsg)
