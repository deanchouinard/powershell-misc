Import-Module Pode.Web

Start-PodeServer {
    # add a simple endpoint
    Add-PodeEndpoint -Address localhost -Port 8090 -Protocol Http

    # set the use of the pode.web templates
    Use-PodeWebTemplates -Title 'Example' -Theme Dark

  
  #New-PodeWebContainer -Content @(
    Add-PodeWebPage -Name Processes -Icon Activity -Layouts @(
  New-PodeWebChart -Name 'Example Chart' -Type Line -AsCard -ScriptBlock {
    return (1..10 | ForEach-Object {
        @{
            Key = $_ # x-axis value
            Values = @(
                @{
                    Key = 'Group1'
                    Value = (Get-Random -Maximum 10) # y-axis value
                }
                @{
                    Key = 'Group2'
                    Value = (Get-Random -Maximum 10) # y-axis value
                }
            )
        }
    })
}
)
}