@echo off
cls

set /P month = "Enter month: "

IF "%month%"=="june" (
    echo Study time!
) ELSE IF "%month%"=="july" (
    echo Holydays time!
) ELSE (
    echo No such month.
)
