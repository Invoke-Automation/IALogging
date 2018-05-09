. $PSScriptRoot\_InitializeTests.ps1

Describe 'Get-LoggingChannelList'  {
	InModuleScope IALogging {
		It 'Should return the value of the LoggingChannelList Parameter' {
			$testValue = 'TestValue'
			Set-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -Value $testValue
			Get-LoggingChannelList | Should -Be $testValue
			Remove-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -ErrorAction SilentlyContinue
		}

		It 'Should return null if the LoggingChannelList Parameter has not been set' {
			Remove-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -ErrorAction SilentlyContinue
			Get-LoggingChannelList | Should -Be $null
		}
	}
}