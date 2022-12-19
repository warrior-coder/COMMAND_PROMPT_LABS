# возвращает считанную строку с консоли
$path = Read-Host "Enter directory path: "
$ext = Read-Host "Enter extension: "

Write-Host "Counting files..."

# Measure-Object - вычисляет числовые свойства объектов
# Get-ChildItem - получает дочерние элементы в указанных путях
# concept of the pipeline: Get-ChildItem возвращает объект, который передается (pipes) командлету Measure-Object с помощью | (pipe operator)
$n = (Get-ChildItem -path $path -recurse -filter *.$ext | Measure-Object).Count

Write-Host "Done."

# командлет Out-File отправляет выходные данные в файл
"Directory $path contains $n files with $ext extension" | Out-File .\lab_4.log
Start-Process Notepad .\lab_4.log

Write-Host ""
Pause
