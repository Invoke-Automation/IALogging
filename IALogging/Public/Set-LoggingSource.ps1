function Set-LoggingSource {
	<#
		.SYNOPSIS
			Sets the LoggingSource variable.
		.DESCRIPTION
			The Set-LoggingSource sets the LoggingSource variable as described in the module Settings.json.

		.PARAMETER LoggingSource
			Specifies the value for the LoggingSource variable.

		.EXAMPLE
			Set-LoggingSource 'My Cool Script'
	#>
	[CmdletBinding(
		SupportsShouldProcess=$true,
		ConfirmImpact = 'High'
	)]
	param (
		[Parameter(
			Mandatory=$true,
			Position=1
		)]
		[System.String]
		$LoggingSource
	)
	Begin {}
	Process {
		$var = Get-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -ValueOnly -ErrorAction SilentlyContinue
		if( ($null -eq $var) -or ( ($null -ne $var) -and ($PSCmdlet.ShouldProcess($LoggingSource,"Overwrite current LogSource $var?")) ) ){
			Set-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -Value $LoggingSource
		}
	}
	End {}
}