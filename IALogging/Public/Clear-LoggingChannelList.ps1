function Clear-LoggingChannelList {
	<#
		.SYNOPSIS
			Clears the LoggingChannelList variable.
		.DESCRIPTION
			The Clear-LoggingChannelList clears the LoggingChannelList variable as described in the module Settings.json.

		.EXAMPLE
			Clear-LoggingChannelList
	#>
	[CmdletBinding(
		SupportsShouldProcess=$true,
		ConfirmImpact = 'High'
	)]
	param ()
	Begin {}
	Process {
		if($PSCmdlet.ShouldProcess((Get-LoggingChannelList),"Remove these registerd LoggingChannelList")){
			Set-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -Value $null
		}
	}
	End {}
}