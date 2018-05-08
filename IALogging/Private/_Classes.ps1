enum LogLevel {
	Information = 0
	Warning = 1
	Error = 2
}
enum ChannelType {
	File = 0
	EventLog = 1
}


class Channel {
	hidden [ChannelType] $ChannelType

	Channel([ChannelType]$ChannelType) {
		$this.ChannelType = $ChannelType
	}

	[Void] WriteInformation([System.String]$Source, [int32]$ID, [System.String]$Message) {
		$this.Log($Source, [LogLevel]'Information', $ID, $Message)
	}
	[Void] WriteWarning([System.String]$Source, [int32]$ID, [System.String]$Message) {
		$this.Log($Source, [LogLevel]'Warning', $ID, $Message)
	}
	[Void] WriteError([System.String]$Source, [int32]$ID, [System.String]$Message) {
		$this.Log($Source, [LogLevel]'Error', $ID, $Message)
	}

	[System.String] ToString() {
		return ('{0} Log Channel' -f $this.ChannelType)
	}
}

class FileLogChannel : Channel {
	[System.String] $FilePath
	[System.String] $FileLogFormat

	# Default setting is being handled in cmdlet
	# FileLogChannel ([System.String]$FilePath) : base ([ChannelType]'File') {
	# 	$this.FileLogFormat = '{0:yyyy-MM-dd hh:mm:ss.fff} - {1} [{2}] ({3}): {4}'
	# 	$this.FilePath = $FilePath
	# }
	FileLogChannel ([System.String] $FilePath, [System.String]$FileLogFormat) : base ([ChannelType]'File') {
		if(-not (Test-Path -Path $FilePath)){
			throw 'FilePath does not exist'
		}
		$this.FilePath = $FilePath
		$this.FileLogFormat = $FileLogFormat
	}

	hidden [Void] Log([System.String]$Source, [LogLevel]$Level, [int32]$ID, [System.String]$Message) {
		Out-File -FilePath $this.FilePath -InputObject ($this.FileLogFormat -f (Get-Date),$Source, $Level, $ID, $Message) -Encoding unicode -Append
	}
}

class EventLogChannel : Channel {
	[System.String] $EventLogSourceName
	[System.String] $EventLogName

	EventLogChannel ([System.String] $EventLogName, [System.String]$EventLogSourceName) : base ([ChannelType]'EventLog') {
		# If either the EventLog or the EventSource dont't exist admin permissions will be required
		try{
			$sourceExists = [System.Diagnostics.EventLog]::SourceExists($EventLogSourceName)
		} catch [System.Management.Automation.MethodInvocationException] {
			$sourceExists = $false
		}
		if (-not (($EventLogName -in ([System.Diagnostics.EventLog]::GetEventLogs() | Select-Object -ExpandProperty Log)) -and $sourceExists ) ) {
			throw 'EventLog and/or EventSource does not exist'
			# Logic is being handled in the cmdlet
			# try {
			# 	If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
			# 		$param = @{
			# 			'FilePath'         = 'powershell.exe'
			# 			'WorkingDirectory' = $pwd
			# 			'Verb'             = 'RunAs'
			# 			'ArgumentList'     = ('-Command &{{New-EventLog -LogName {0} -Source {1} | Out-Null}}' -f $EventLogName, $EventLogSourceName)
			# 		}
			# 		Start-Process @param #-FilePath 'powershell.exe' -WorkingDirectory $pwd -Verb RunAs -ArgumentList ('-Command &{New-EventLog -LogName {0} -Source {1} | Out-Null}' -f $EventLogName,$EventLogSourceName)
			# 	} else {
			# 		New-EventLog -LogName $EventLogName -Source $EventLogSourceName | Out-Null
			# 	}
			# 	Write-Information ('{0} has been created as EventLog and {1} as it''s source.' -f $EventLogName, $EventLogSourceName)
			# } catch {
			# 	Write-Error 'Could not create EventLog and Source'
			# 	throw $_.Exception
			# }
		}
		$this.EventLogSourceName = $EventLogSourceName
		$this.EventLogName = $EventLogName
	}

	hidden [Void] Log([System.String]$Source, [LogLevel]$Level, [int32]$ID, [System.String]$Message) {
		$param = @{
			'LogName' = $this.EventLogName
			'Source' = $this.EventLogSourceName
			'EntryType' = [System.String]$Level
			'EventId' = $ID
			'Message' = ("Source: " + $Source + "`nMessage: " + $Message)
		}
		Write-EventLog @param
	}
}