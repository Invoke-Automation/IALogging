$Global:ModuleName = 'IALogging'
$Global:TestsFolder = Split-Path -Parent $MyInvocation.MyCommand.Path
$Global:ProjectRoot = Split-Path -Parent $Global:TestsFolder
$Global:ModuleRoot = Join-Path $Global:ProjectRoot $Global:ModuleName
$Global:TempTestFolder = Join-Path $Global:ProjectRoot 'Test'
$Global:ModuleManifestPath = Join-Path $Global:ModuleRoot ('{0}.psd1' -f $Global:ModuleName)

if(!(Get-Module $ModuleName)){
	Import-Module $ModuleRoot -Force
}

$Global:fileLogChannelFilePath1 = Join-Path $Global:TempTestFolder 'fileChannelTest1.log'
$Global:fileLogChannelFilePath2 = Join-Path $Global:TempTestFolder 'fileChannelTest2.log'
$Global:fileLogChannelLogFormat1 = '{0:yyMMddhhmmss} [{2}({3})] {4}'
$Global:fileLogChannelLogFormat2 = '[{2}]:{3} - {1} - {4}'

$eventLogs = [System.Diagnostics.EventLog]::GetEventLogs() | Select-Object -ExpandProperty Log
$preferedEventLog = 'Application'
if ($preferedEventLog -in $eventLogs){
	$Global:eventLogChannelEventLogName = $preferedEventLog
} else {
	$Global:eventLogChannelEventLogName = [System.Diagnostics.EventLog]::GetEventLogs() | Select-Object -ExpandProperty Log | Select-Object -First 1
}
$Global:eventLogChannelSourceName = (Get-EventLog -LogName $Global:eventLogChannelEventLogName -Newest 1).Source