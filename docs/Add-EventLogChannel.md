---
external help file: IALogging-help.xml
Module Name: IALogging
online version:
schema: 2.0.0
---

# Add-EventLogChannel

## SYNOPSIS
Adds an EventLog Channel to the LoggingChannelList list

## SYNTAX

```
Add-EventLogChannel [-EventLogName] <String> [-EventLogSourceName] <String> [<CommonParameters>]
```

## DESCRIPTION
The Add-EventLogChannel cmdlet adds a Channel to the LoggingChannelList list that is capable of logging to the EventLog.

To write an event to an event log, the event log must exist on the computer and the source must be registered for the event log.
If either the EventLog or the Source don't exist on the computer when this cmdlet is called they will be created.

Note: Creating an EventLog and/or Source requires administrator privileges

## EXAMPLES

### EXAMPLE 1
```
Write-LogError 1 "Some Error you want to log"
```

## PARAMETERS

### -EventLogName
Specifies the event identifier.
This parameter is required.
The maximum allowed value for the EventId parameter is 65535.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EventLogSourceName
Specifies the Name of the EventLog Source

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
