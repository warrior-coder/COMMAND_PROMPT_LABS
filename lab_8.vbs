Do
    attempt = 0
    Randomize ' initialize the Rnd() function generator
    Number = Int(Rnd() * 9 + 1)
    Call MsgBox("Guess the number from 1 to 10", vbInformation, "Guessing game")
    Do
        ' gey the input value
        inputValue = InputBox("Guess the number" & vbCrLf & vbCrLf & "Attempt: " & attempt & vbCrLf & vbCrLf & vbCrLf & vbCrLf,"Guessing game")
        
        If inputValue <> "" Then
            If IsNumeric(inputValue) = True Then
                attempt = attempt + 1
                If CInt(inputValue) < Number Then Call MsgBox("Not " & inputValue & vbCrLf & "I wished a greater number ", vbInformation, "Guessing game")
                If CInt(inputValue) > Number Then Call MsgBox("Not " & inputValue & vbCrLf & "I wished a less number", vbInformation, "Guessing game")
                If CInt(inputValue) = Number Then
                    If MsgBox("Right!" & vbCrLf & "The number was " & inputValue & vbCrLf & "Attempts number: " & attempt & vbCrLf & "Reatart?", 36, "Guessing game") = vbYes Then Exit Do Else WScript.Quit
                End If
            Else
                Call MsgBox("Not a number!", vbCritical, "Guessing game")
            End If
        Else
            If MsgBox("Exit the program?", 36, "Guessing game") = vbYes Then WScript.Quit
        End If
    Loop
Loop