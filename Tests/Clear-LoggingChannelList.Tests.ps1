. $PSScriptRoot\_InitializeTests.ps1

Describe 'Clear-LoggingChannelList'  {
	InModuleScope IALogging {
		It 'Should remove the value of the LoggingChannels Parameter' {
			$testValue = 'TestValue'
			Set-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -Value $testValue
			Clear-LoggingChannelList -Confirm:$false
			Get-LoggingChannelList | Should -Be $null
			Remove-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -ErrorAction SilentlyContinue
		}

		It 'Should not throw if the LoggingChannels Parameter has not been set' {
			Remove-Variable -Name $SETTINGS.Parameters.LoggingChannels.Name -Scope $SETTINGS.Parameters.LoggingChannels.Scope -ErrorAction SilentlyContinue
			{Clear-LoggingChannelList -Confirm:$false} | Should -Not -Throw
			Get-LoggingChannelList | Should -Be $null
		}
	}
}