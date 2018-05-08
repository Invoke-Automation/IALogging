. $PSScriptRoot\_InitializeTests.ps1

Describe 'Get-LoggingChannelList'  {
	InModuleScope IALogging {
		It 'Should return the value of the LoggingChannels Parameter' {
			$testValue = 'TestValue'
			Set-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -Value $testValue
			Get-LoggingChannelList | Should -Be $testValue
			Remove-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -ErrorAction SilentlyContinue
		}

		It 'Should return null if the LoggingChannels Parameter has not been set' {
			Remove-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -ErrorAction SilentlyContinue
			Get-LoggingChannelList | Should -Be $null
		}
	}
}