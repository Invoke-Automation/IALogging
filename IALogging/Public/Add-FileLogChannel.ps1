function Add-FileLogChannel {
	<#
		.SYNOPSIS
			Adds a File Channel to the LoggingChannelList list
		.DESCRIPTION
			The Add-FileLogChannel cmdlet adds a Channel to the LoggingChannelList list that is capable of logging to a file.

			If the file does not exist an empty file will be created.
			If the file exists and the Append switch is not specified the file will be removed and a new empty file will be created.

		.PARAMETER FilePath
			Specifies the path of the file to which the logging should be writen.

		.PARAMETER LogFormat
			Specifies the format of the logging.
			The LogFormat string will be formatted using the String format operator. (default: '{0:yyyy-MM-dd hh:mm:ss.fff} - {1} [{2}] ({3}): {4}')
			0:DateTime, 1:Source, 2:LogLevel, 3:ID, 4:Message

		.PARAMETER Append
			Specifies that if the file exists all logging should be appended to it.

		.PARAMETER Force
			Specifies that if the file exists it should be forcefully removed.

		.EXAMPLE
			Add-FileLogChannel "C:\tmp\script.log" -Force

		.EXAMPLE
			Add-FileLogChannel "C:\tmp\script.log" '{0:yyMMddhhmmss} [{2}({3})] {4}'
	#>
	[CmdletBinding()]
	param (
		# Specifies a path to one or more locations.
		[Parameter(Mandatory=$true)]
		[ValidateNotNullOrEmpty()]
		[System.String]
		$FilePath,
		# 0:DateTime, 1:Source, 2:LogLevel, 3:ID, 4:Message
		[Parameter()]
		[System.String]
		$LogFormat = '{0:yyyy-MM-dd hh:mm:ss.fff} - {1} [{2}] ({3}): {4}',
		[Parameter()]
		[switch]
		$Append,
		[Parameter()]
		[switch]
		$Force
	)
	Begin {}
	Process {
		# if the file does not exist or if it does but the append switch is given
		$fileExists = (Test-Path $FilePath)
		if( (-not $fileExists) -or ($fileExists -and $Append) ){
			if($fileExists){
				Remove-Item -Path $FilePath -Force:$Force | Out-Null
			}
			$file = New-Item -Path $FilePath -ItemType File
		} else {
			$file = Get-Item -Path $FilePath
		}
		Add-LoggingChannel -LoggingChannel ([FileLogChannel]::New($file.FullName,$LogFormat))
	}
	End {}
}