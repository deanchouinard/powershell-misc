<#
.SYNOPSIS
Add-Reading adds a record to the gw (gluecose and weight) database.
.DESCRIPTION
Add-Reading adds a gluecose, body weight, and date of reading to
the gw (gluecose and weight) database. It returns true if the insert
was successful.
.PARAMETER date_of_reading
The date of the gluecose and body weitht reading. Default: None.
.PARAMETER gluecose
Reading from gluecose meter. Default: None.
.PARAMETER body_weight
Body weight from scale.
.EXAMPLE
Add-Reading -date_of_reading "2023-02-08" -gluecose 140 -body-weight 180
#>
[CmdletBinding()]
param (
  [Parameter(Mandatory=$True, Position=0)]
  [string]$date_of_reading,
  [Parameter(Position=1)]
  [int]$gluecose,
  [Parameter(Position=2)]
  [int]$body_weight
)

Write-Host $date_of_reading

#Import the module, create a data source and a table
Import-Module PSSQLite

$Database = "./gw.db"

$Query = "select * from readings"
$Query = "insert into readings (reading_date, gluecose, b_weight)
values ('$date_of_reading', $gluecose, $body_weight)"

Write-Host $Query

#SQLite will create Names.SQLite for us
$sel = Invoke-SqliteQuery -Query $Query -DataSource $Database

Write-Host $sel
