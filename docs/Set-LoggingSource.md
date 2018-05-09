---
external help file: IALogging-help.xml
Module Name: IALogging
online version:
schema: 2.0.0
---

# Set-LoggingSource

## SYNOPSIS
Sets the LoggingSource variable.

## SYNTAX

```
Set-LoggingSource [-LoggingSource] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Set-LoggingSource sets the LoggingSource variable as described in the module Settings.json.

## EXAMPLES

### EXAMPLE 1
```
Set-LoggingSource 'My Cool Script'
```

## PARAMETERS

### -LoggingSource
Specifies the value for the LoggingSource variable.

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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
