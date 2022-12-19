@ECHO OFF
CLS

SET /P path="Enter directory path: "
SET /P ext="Enter extension: "
SET n=0
 
ECHO Counting files...

:: /F - разбор содержимого текстового файла, строки, результата другой команды
:: DIR - просмотр содержимого папки
:: /B - вывод только имен файлов
:: /S - вывод списка файлов из указанного каталога и его подкаталогов
FOR /F %%a IN ('DIR /B /S "%path%\*.%ext%"') DO (
    :: /A - вычисляемое выражение (expression)
    IF EXIST %%a SET /A n+=1
)

ECHO Done.

:: > записывает данные на выходе команды в указанное место (вместо окна командной строки)
ECHO Directory %path% contains %n% files with %ext% extension. > .\lab_2.log
START Notepad .\lab_2.log

:: вывод пустой строки
ECHO.
PAUSE
