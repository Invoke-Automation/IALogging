function Get-LoggingSource {
	[CmdletBinding()]
	param ()
	Begin {}
	Process {
		Get-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -ValueOnly -ErrorAction SilentlyContinue
	}
	End {}
}