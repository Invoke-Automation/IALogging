function Add-LoggingChannel {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		[Channel]
		$LoggingChannel
	)
	Begin {}
	Process {
		$var = Get-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -ValueOnly -ErrorAction SilentlyContinue
		if($null -eq $var){
			$var = @()
		}
		$var += $LoggingChannel
		Set-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -Value $var
	}
	End {}
}