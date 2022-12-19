:: отключает дублирование последующих исполняемых команд
:: @ - не дублирует команду текущй строки
@ECHO OFF

CLS

:: /P - ввод из командной строки (prompt string)
SET /P m="Enter month: "

:: значение переменной var доступно при %var%
IF "%m%" EQU "jan" GOTO study
IF "%m%" EQU "feb" GOTO study
IF "%m%" EQU "mar" GOTO study
IF "%m%" EQU "apr" GOTO study
IF "%m%" EQU "may" GOTO study
IF "%m%" EQU "jun" GOTO study
IF "%m%" EQU "jul" GOTO holydays
IF "%m%" EQU "aug" GOTO holydays
IF "%m%" EQU "sep" GOTO study
IF "%m%" EQU "oct" GOTO study
IF "%m%" EQU "nov" GOTO study
IF "%m%" EQU "dec" GOTO study

ECHO No such month.
GOTO :exit

:study
ECHO Study time!
GOTO :exit

:holydays
ECHO Holydays time!
GOTO :exit

:exit
ECHO.
PAUSE