---
URL: https://invoke-automation.github.io/Invoke-Documentation/projects/IALogging/README
index: 0
---
# IALogging

IALogging module is designed to simplify logging to one or more places.
Initially the focus will be on File and EventLog logging, but other options can be considerd in the future.

## Getting started

Install IALogging from the [PowerShell Gallery](https://www.powershellgallery.com/) using `Install-Module`.

```powershell
Install-Module -Name IALogging
```

### Enable logging in your script

Here is a quick example of how to use IALogging in your script:

```powershell
Import-Module IALogging

# Set the source of your logging
Set-LoggingSource 'My Cool Script'
# Add a FileLogChannel to write logging to a file
Add-FileLogChannel -FilePath 'C:\tmp\MyCoolScript.log'
# Add an EventLogChannel to write events to the eventlog (First time this will need admin rights to create the Log and/or Source)
Add-EventLogChannel -LogName 'Application' -Source 'MyCoulSource'

# Every Write-LogInformation,Write-LogWarning,Write-LogError will writ to all registerd Channels (our file and the eventlog in this example)
Write-LogInformation 1 'Start Script'
...
if($someParameter -eq $somethingCrazy){
    Write-LogWarning 8 ('someParameter ({0}) is crazy!' -f $someParameter)
}
...
try{
    Get-CoolStuff
} catch {
    Write-LogError 99 $_.Exception
}
...
Write-LogInformation 1 'Stop Script'
```

## Legal and Licensing

IALogging is licensed under the [MIT license](LICENSE.txt).

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
