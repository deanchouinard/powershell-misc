$found = @()
$not_found = @()
$code = 'CODE'

$references = Import-Csv ./references.csv
$candidates = Import-Csv ./candidates.csv
# $references | gm


# Write-Host $references
# Write-Host $candidates

foreach( $i in $candidates ) {
    if ($i.CODE -in $references) {Write-Host $i.CODE}}

foreach( $i in $candidates ) {
    Write-Host "Candidate Code:" $i.CODE -ForegroundColor Green
    foreach( $r in $references) {
        Write-Host $r
        Write-Host $r.$code
        if ($r.CODE.Contains($i.CODE)) {
            $found += $i.CODE
        }
        # foreach($v in $r) {
        #     Write-Host $v
        #     Write-Host $v.CODE
        # }
        
        #if ($r.ContainsValue($i.CODE)) {Write-Host $i.CODE}}
    }
}
Write-Host "Found:" $found
