---
external help file: IALogging-help.xml
Module Name: IALogging
online version:
schema: 2.0.0
---

# Write-LogInformation

## SYNOPSIS
Writes Information to all registerd LoggingChannels in the LoggingChannelList.

## SYNTAX

```
Write-LogInformation [-EventId] <Int32> [-Message] <String> [<CommonParameters>]
```

## DESCRIPTION
The Write-LogInformation calls the WriteInformation method on all registerd LoggingChannels in the LoggingChannelList.

## EXAMPLES

### EXAMPLE 1
```
Write-LogInformation 1 "Some Information you want to log"
```

## PARAMETERS

### -EventId
Specifies the event identifier.
This parameter is required.
The maximum allowed value for the EventId parameter is 65535.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases: ID

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message
Specifies the event message.
This parameter is required.

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
