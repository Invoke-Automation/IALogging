. $PSScriptRoot\_InitializeTests.ps1

Describe 'Add-FileLogChannel'  {
	InModuleScope IALogging {
		Mock Test-Path -ParameterFilter {
			$Path -in @($Global:fileLogChannelFilePath1,$Global:fileLogChannelFilePath2)
		} { return $true }

		$startValue = Get-LoggingChannelList
		Add-LoggingChannel -LoggingChannel ([FileLogChannel]::New($Global:fileLogChannelFilePath1,$Global:fileLogChannelLogFormat1))
		$firstValue = Get-LoggingChannelList
		Add-LoggingChannel -LoggingChannel ([FileLogChannel]::New($Global:fileLogChannelFilePath2,$Global:fileLogChannelLogFormat2))
		$secondValue = Get-LoggingChannelList

		Clear-LoggingChannelList -Confirm:$false

		It 'Should add one Channel to the LoggingChannel variable when called once' {
			$firstValue.count | Should -BeExactly ($startValue.count + 1)
			$secondValue.count | Should -BeExactly ($firstValue.count + 1)
		}

		It 'Should add a FileLogChannel to the LoggingChannel variable' {
			($firstValue | Select-Object -Last 1).GetType().Name | Should -Be 'FileLogChannel'
			($secondValue | Select-Object -Last 1).GetType().Name | Should -Be 'FileLogChannel'
		}
	}
}