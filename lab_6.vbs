Dim path
Dim file
Dim count
Dim ext

path = InputBox("Enter directory path:")
ext = InputBox("Enter extension: ")
Set FSO = WScript.CreateObject("Scripting.FileSystemObject")

If FSO.FolderExists(path) Then
    ' count files
    count = 0
    For Each file In FSO.GetFolder(path).Files
        If LCase(FSO.GetExtensionName(file.Name)) = LCase(ext) Then
            count = count + 1
        End If
    Next

    ' write result in file
    Set textFile = FSO.CreateTextFile("lab_6.log", True)
    textFile.WriteLine("Directoty " & CStr(path) & " contains " & CStr(count) & " files with " & CStr(ext) & " extension.")
    textFile.Close
    
    ' open file in Notepad.exe
    Set SHO = WScript.CreateObject( "WScript.Shell" )
    SHO.Run("Notepad.exe .\lab_6.log")
Else
    ' echo error
    WScript.Echo "Directoty does not exist"
End if