$month = Read-Host "Enter the month"

$months = @(
    "january",
    "february",
    "march",
    "april",
    "may",
    "june",
    "july",
    "august",
    "september",
    "october",
    "november",
    "december"
)

$monthIndex = $months.IndexOf($month)

Write-Output $monthIndex

if ($monthIndex -eq -1)
{
    Write-Output "No such month!"    
}
else
{

}
