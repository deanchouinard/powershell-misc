#Import the module, create a data source and a table
Import-Module PSSQLite

$Database = "./gw.db"
$Query = "CREATE TABLE NAMES (
    Fullname VARCHAR(20) PRIMARY KEY,
    Surname TEXT,
    Givenname TEXT,
    Birthdate DATETIME)"

$Query = "select * from readings"

#SQLite will create Names.SQLite for us
$sel = Invoke-SqliteQuery -Query $Query -DataSource $Database
$sel | ft
#Write-Host "after select"
# We have a database, and a table, let's view the table info
# $prag = Invoke-SqliteQuery -DataSource $Database -Query "PRAGMA table_info(READINGS)"

#Write-Host "after pragma"
#write-table $sel
# write-host $prag

"select * from readings;" | sqlite3 ./gw.db

# $sel | Get-Member

