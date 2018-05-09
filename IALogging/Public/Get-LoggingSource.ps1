function Get-LoggingSource {
	<#
		.SYNOPSIS
			Gets the LoggingSource variable.
		.DESCRIPTION
			The Get-LoggingSource gets the LoggingSource variable as described in the module Settings.json.

		.EXAMPLE
			Get-LoggingSource
	#>
	[CmdletBinding()]
	param ()
	Begin {}
	Process {
		Get-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -ValueOnly -ErrorAction SilentlyContinue
	}
	End {}
}