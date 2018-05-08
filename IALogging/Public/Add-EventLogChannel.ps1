function Add-EventLogChannel {
	<#
		.SYNOPSIS
			Adds an EventLog Channel to the LoggingChannels list
		.DESCRIPTION
			The Add-EventLogChannel cmdlet adds a Channel to the LoggingChannels list that is capable of logging to the EventLog.

			To write an event to an event log, the event log must exist on the computer and the source must be registered for the event log.
			If either the EventLog or the Source don't exist on the computer when this cmdlet is called they will be created.

			Note: Creating an EventLog and/or Source requires administrator privileges

		.PARAMETER EventLogName
			Specifies the event identifier. This parameter is required. The maximum allowed value for the EventId parameter is 65535.

		.PARAMETER EventLogSource
			Specifies the event message. This parameter is required.

		.EXAMPLE
			Write-LogError 1 "Some Error you want to log"
	#>
	[CmdletBinding()]
	param (
		[Parameter(
			Mandatory=$true,
			Position = 1,
			HelpMessage="Specifies the Name of the EventLog."
		)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$EventLogName,
		[Parameter(
			Mandatory=$true,
			Position = 2,
			HelpMessage="Specifies the Name of the EventLog Source"
		)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$EventLogSourceName
	)
	Begin {}
	Process {
		try{
			$sourceExists = [System.Diagnostics.EventLog]::SourceExists($EventLogSourceName)
		} catch [System.Management.Automation.MethodInvocationException] {
			$sourceExists = $false
		}
		if (-not (($EventLogName -in ([System.Diagnostics.EventLog]::GetEventLogs() | Select-Object -ExpandProperty Log)) -and $sourceExists ) ) {
			try {
				$param = @{
					'FilePath'         = 'powershell.exe'
					'WorkingDirectory' = $pwd
					'ArgumentList'     = ('-Command &{{New-EventLog -LogName {0} -Source {1} | Out-Null}}' -f $EventLogName, $EventLogSourceName)
				}
				If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
					$param.Add('Verb','RunAs')
				}
				Start-Process @param
				Write-Information ('{0} has been created as EventLog and {1} as it''s source.' -f $EventLogName, $EventLogSourceName)
			} catch {
				Write-Error 'Could not create EventLog and Source'
				throw $_.Exception
			}
		}
		Add-LoggingChannel -LoggingChannel ([EventLogChannel]::New($EventLogName,$EventLogSourceName))
	}
	End {}
}