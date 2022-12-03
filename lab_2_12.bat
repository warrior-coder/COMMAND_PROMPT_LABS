@echo off
echo ‚ўҐ¤ЁвҐ Їгвм [C:] [C:\Folder]
set /p w=
set q=0
 
echo ?йг д*©«л...
for /f "tokens=*" %%a in ('dir /b /s "%w%\*.txt"') do if exist %%a set /a q+=1
 
cls
@echo %q%
pause