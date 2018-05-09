function Get-LoggingChannelList {
	<#
		.SYNOPSIS
			Gets the LoggingChannelList variable.
		.DESCRIPTION
			The Get-LoggingChannelList gets the LoggingChannelList variable as described in the module Settings.json.

		.EXAMPLE
			Get-LoggingChannelList
	#>
	[CmdletBinding()]
	param ()
	Begin {}
	Process {
		$var = Get-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -ValueOnly -ErrorAction SilentlyContinue

		if($null -ne $var){
			if(($var).GetType().BaseType.Name -eq 'Array'){
				$var.GetEnumerator()
			} else {
				$var
			}
		} else {
			$var
		}
	}
	End {}
}
