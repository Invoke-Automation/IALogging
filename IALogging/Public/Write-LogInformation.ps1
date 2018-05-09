Function Write-LogInformation{
	<#
		.SYNOPSIS
			Writes Information to all registerd LoggingChannels in the LoggingChannelList.
		.DESCRIPTION
			The Write-LogInformation calls the WriteInformation method on all registerd LoggingChannels in the LoggingChannelList.

		.PARAMETER EventId
			Specifies the event identifier. This parameter is required. The maximum allowed value for the EventId parameter is 65535.

		.PARAMETER Message
			Specifies the event message. This parameter is required.

		.EXAMPLE
			Write-LogInformation 1 "Some Information you want to log"
	#>
    [CmdletBinding()]
	Param(
		[Parameter(
			Mandatory = $true,
			Position = 1,
			HelpMessage="Specifies the event identifier. (between 0 and 65535)"
		)]
		[ValidateRange(0,65535)]
		[Alias("ID")]
		[Int] $EventId,
		[Parameter(
			Mandatory = $true,
			Position = 2,
			HelpMessage="Specifies the event message."
		)]
		[String] $Message
	)
	Begin {}
	Process {
		if($null -eq (Get-LoggingSource)){
			Write-Warning -Message 'No LoggingSource has been specified.'
		}
		Get-LoggingChannelList | ForEach-Object {
			$_.WriteInformation((Get-LoggingSource),$EventId,$Message)
		}
	}
	End {}
}