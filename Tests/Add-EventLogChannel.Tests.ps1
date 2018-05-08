. $PSScriptRoot\_InitializeTests.ps1

Describe 'Add-EventLogChannel'  {
	InModuleScope IALogging {
		$startValue = Get-LoggingChannelList
		Add-LoggingChannel -LoggingChannel ([EventLogChannel]::New($Global:eventLogChannelEventLogName,$Global:eventLogChannelSourceName))
		$firstValue = Get-LoggingChannelList
		Add-LoggingChannel -LoggingChannel ([EventLogChannel]::New($Global:eventLogChannelEventLogName,$Global:eventLogChannelSourceName))
		$secondValue = Get-LoggingChannelList

		Clear-LoggingChannelList -Confirm:$false

		It 'Should add one Channel to the LoggingChannel variable when called once' {
			$firstValue.count | Should -BeExactly ($startValue.count + 1)
			$secondValue.count | Should -BeExactly ($firstValue.count + 1)
		}

		It 'Should add an EventLogChannel to the LoggingChannel variable' {
			($firstValue | Select-Object -Last 1).GetType().Name | Should -Be 'EventLogChannel'
			($secondValue | Select-Object -Last 1).GetType().Name | Should -Be 'EventLogChannel'
		}
	}
}