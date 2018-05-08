function Clear-LoggingChannelList {
	[CmdletBinding(
		SupportsShouldProcess=$true,
		ConfirmImpact = 'High'
	)]
	param ()
	Begin {}
	Process {
		if($PSCmdlet.ShouldProcess((Get-LoggingChannelList),"Remove these registerd LoggingChannels")){
			Set-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -Value $null
		}
	}
	End {}
}