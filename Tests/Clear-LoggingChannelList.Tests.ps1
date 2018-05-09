. $PSScriptRoot\_InitializeTests.ps1

Describe 'Clear-LoggingChannelList'  {
	InModuleScope IALogging {
		It 'Should remove the value of the LoggingChannelList Parameter' {
			$testValue = 'TestValue'
			Set-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -Value $testValue
			Clear-LoggingChannelList -Confirm:$false
			Get-LoggingChannelList | Should -Be $null
			Remove-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -ErrorAction SilentlyContinue
		}

		It 'Should not throw if the LoggingChannelList Parameter has not been set' {
			Remove-Variable -Name $SETTINGS.Parameters.LoggingChannelList.Name -Scope $SETTINGS.Parameters.LoggingChannelList.Scope -ErrorAction SilentlyContinue
			{Clear-LoggingChannelList -Confirm:$false} | Should -Not -Throw
			Get-LoggingChannelList | Should -Be $null
		}
	}
}