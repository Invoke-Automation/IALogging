. $PSScriptRoot\_InitializeTests.ps1

Describe 'Set-LoggingSource'  {
	InModuleScope IALogging {
		It 'Should set the value of the LoggingSource Parameter' {
			$testValue = 'TestValue'
			Set-LoggingSource -LoggingSource $testValue
			Get-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -ValueOnly -ErrorAction SilentlyContinue | Should -Be $testValue
			Remove-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -ErrorAction SilentlyContinue
		}

		It 'Should not throw if the LoggingSource Parameter has already been set' {
			$firstTestValue = 'TestValue'
			$secondTestValue = 'OtherTestValue'
			Set-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -Value $firstTestValue -ErrorAction SilentlyContinue
			Set-LoggingSource -LoggingSource $secondTestValue -Confirm:$false
			Get-LoggingSource | Should -Be $secondTestValue
			Remove-Variable -Name $SETTINGS.Parameters.LoggingSource.Name -Scope $SETTINGS.Parameters.LoggingSource.Scope -ErrorAction SilentlyContinue
		}
	}
}