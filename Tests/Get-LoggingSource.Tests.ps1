. $PSScriptRoot\_InitializeTests.ps1

Describe 'Get-LoggingSource'  {
	InModuleScope IALogging {
		It 'Should return the value of the LoggingSource Parameter' {
			$testValue = 'TestValue'
			Set-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -Value $testValue
			Get-LoggingSource | Should -Be $testValue
			Remove-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -ErrorAction SilentlyContinue
		}

		It 'Should return null if the LoggingSource Parameter has not been set' {
			Remove-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -ErrorAction SilentlyContinue
			Get-LoggingSource | Should -Be $null
		}
	}
}