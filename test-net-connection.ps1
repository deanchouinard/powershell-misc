$i = 0
while ($i -eq "0") {
if ((test-netconnection citrixv.adfam.com -port 443).tcptestsucceeded -like "*False*") {
    write-host -for red "Citrix doesn't work"
    }
if ((test-netconnection lvgadfp01.adf.local -port 445).tcptestsucceeded -like "*False*") {
    write-host -for red "File Server doesn't work"
    }
start-sleep -seconds 5
}