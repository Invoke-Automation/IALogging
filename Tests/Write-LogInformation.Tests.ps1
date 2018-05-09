. $PSScriptRoot\_InitializeTests.ps1

Describe 'Write-LogInformation'  {
	InModuleScope -ModuleName IALogging {
		$testLogLevel = 'Information'
		$testLoggingSource = 'PesterTests'
		$testEventID = 1
		$testMessage = 'TestMessage'

		Mock Get-Item -ParameterFilter {
			$Path -eq $Global:fileLogChannelFilePath1
		} { return New-Object -TypeName PSObject -Property @{
				'FullName' = $Global:fileLogChannelFilePath1
			}
		}
		Mock Get-Item -ParameterFilter {
			$Path -eq $Global:fileLogChannelFilePath2
		} { return New-Object -TypeName PSObject -Property @{
				'FullName' = $Global:fileLogChannelFilePath2
			}
		}

		Mock Test-Path -ParameterFilter {
			$Path -in @($Global:fileLogChannelFilePath1,$Global:fileLogChannelFilePath2)
		} { return $true }
		Mock Out-File -ParameterFilter {
			$FilePath -in @($Global:fileLogChannelFilePath1,$Global:fileLogChannelFilePath2) -and
			$InputObject -eq ($Global:fileLogChannelLogFormat2 -f (Get-Date),$testLoggingSource,$testLogLevel,$testEventID,$testMessage) -and
			$Append -eq $true -and
			$Encoding -eq 'unicode'
		}
		Mock Write-EventLog -ParameterFilter {
			$LogName -eq $Global:eventLogChannelEventLogName -and
			$Source -eq $Global:eventLogChannelSourceName -and
			$EntryType -eq $testLogLevel -and
			$EventId -eq $testEventID -and
			$Message -eq ("Source: " + $testLoggingSource + "`nMessage: " + $testMessage)
		}

		Clear-LoggingChannelList -Confirm:$false
		Set-LoggingSource -LoggingSource $testLoggingSource -Confirm:$false
		Add-FileLogChannel -FilePath $Global:fileLogChannelFilePath1 -LogFormat $Global:fileLogChannelLogFormat2
		Add-FileLogChannel -FilePath $Global:fileLogChannelFilePath2 -LogFormat $Global:fileLogChannelLogFormat2
		Add-EventLogChannel -EventLogName $Global:eventLogChannelEventLogName -EventLogSourceName $Global:eventLogChannelSourceName
		Write-LogInformation -EventId $testEventID -Message $testMessage

		It 'Should write to the correct file for all registerd FileLogChannel objects in LoggingChannelList' {
			Assert-MockCalled -CommandName Out-File -Times 2
		}

		It 'Should write to the correct EventLog for all registerd EventLogChannel objects in LoggingChannelList' {
			Assert-MockCalled -CommandName Write-EventLog -Times 1
		}
	}
}