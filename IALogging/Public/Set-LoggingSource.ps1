function Set-LoggingSource {
	[CmdletBinding(
		SupportsShouldProcess=$true,
		ConfirmImpact = 'High'
	)]
	param (
		[Parameter(Mandatory=$true)]
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