$csv = Import-Csv -Delimiter ',' -Path '.\DashlaneExport MGordon 02.23.21.csv' -Header name, url, username, email, blank, password, desc
Write-Host "Start..."
$filename = 'outfile.csv'
New-Item -Path . -Name $filename -ItemType "file" -Force

foreach($item in $csv)
    {
    # Write-Output $item.url
    if ($item.username -eq "")
        {
        $item.username = $item.email
        # Write-Host $item.name $item.url $item.username $item.email "," "Website"
        }
     $item.desc = $item.desc -replace "`n", " "
     $outline = "$($item.name),$($item.url),$($item.username),$($item.email),$($item.password),$($item.desc),Web Site Accounts"
     Write-Output $outline
     Add-Content $filename $outline
    }

