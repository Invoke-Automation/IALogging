---
external help file: IALogging-help.xml
Module Name: IALogging
online version:
schema: 2.0.0
---

# Add-FileLogChannel

## SYNOPSIS
Adds a File Channel to the LoggingChannelList list

## SYNTAX

```
Add-FileLogChannel [-FilePath] <String> [[-LogFormat] <String>] [-Append] [-Force] [<CommonParameters>]
```

## DESCRIPTION
The Add-FileLogChannel cmdlet adds a Channel to the LoggingChannelList list that is capable of logging to a file.

If the file does not exist an empty file will be created.
If the file exists and the Append switch is not specified the file will be removed and a new empty file will be created.

## EXAMPLES

### EXAMPLE 1
```
Add-FileLogChannel "C:\tmp\script.log" -Force
```

### EXAMPLE 2
```
Add-FileLogChannel "C:\tmp\script.log" '{0:yyMMddhhmmss} [{2}({3})] {4}'
```

## PARAMETERS

### -FilePath
Specifies the path of the file to which the logging should be writen.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogFormat
Specifies the format of the logging.
The LogFormat string will be formatted using the String format operator.
(default: '{0:yyyy-MM-dd hh:mm:ss.fff} - {1} \[{2}\] ({3}): {4}')
0:DateTime, 1:Source, 2:LogLevel, 3:ID, 4:Message

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: {0:yyyy-MM-dd hh:mm:ss.fff} - {1} [{2}] ({3}): {4}
Accept pipeline input: False
Accept wildcard characters: False
```

### -Append
Specifies that if the file exists all logging should be appended to it.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Specifies that if the file exists it should be forcefully removed.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
