function Add-LoggingChannel {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true)]
		[Channel]
		$LoggingChannel
	)
	Begin {}
	Process {
		$var = Get-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -ValueOnly -ErrorAction SilentlyContinue
		if($null -eq $var){
			$var = @()
		}
		$var += $LoggingChannel
		Set-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -Value $var
	}
	End {}
}