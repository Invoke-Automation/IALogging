function Get-LoggingChannelList {
	[CmdletBinding()]
	param ()
	Begin {}
	Process {
		$var = Get-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -ValueOnly -ErrorAction SilentlyContinue

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
