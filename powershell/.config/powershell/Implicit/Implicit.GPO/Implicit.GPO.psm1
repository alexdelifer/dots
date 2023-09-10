
<#
 # Implicit remoting module
 # generated on 12/16/2020 8:04:25 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\GPO" -Session (get-pssession -Name WinRM8) -CommandName "*-GP*" -AllowClobber -Force
 #>
        
param(
    <# Optional parameter that can be used to specify the session on which this proxy module works #>    
    [System.Management.Automation.Runspaces.PSSession] $PSSessionOverride,
    [System.Management.Automation.Remoting.PSSessionOption] $PSSessionOptionOverride
)

$script:__psImplicitRemoting_versionOfScriptGenerator = [Microsoft.PowerShell.Commands.ExportPSSessionCommand, Microsoft.PowerShell.Commands.Utility, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]::VersionOfScriptGenerator
if ($script:__psImplicitRemoting_versionOfScriptGenerator.Major -ne 1.0)
{
    throw 'The module cannot be loaded because it has been generated with an incompatible version of the Export-PSSession cmdlet. Generate the module with the Export-PSSession cmdlet from the current session, and try loading the module again.'
}


$script:WriteHost = $executionContext.InvokeCommand.GetCommand('Write-Host', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:WriteWarning = $executionContext.InvokeCommand.GetCommand('Write-Warning', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:WriteInformation = $executionContext.InvokeCommand.GetCommand('Write-Information', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:GetPSSession = $executionContext.InvokeCommand.GetCommand('Get-PSSession', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:NewPSSession = $executionContext.InvokeCommand.GetCommand('New-PSSession', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:ConnectPSSession = $executionContext.InvokeCommand.GetCommand('Connect-PSSession', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:NewObject = $executionContext.InvokeCommand.GetCommand('New-Object', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:RemovePSSession = $executionContext.InvokeCommand.GetCommand('Remove-PSSession', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:InvokeCommand = $executionContext.InvokeCommand.GetCommand('Invoke-Command', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:SetItem = $executionContext.InvokeCommand.GetCommand('Set-Item', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:ImportCliXml = $executionContext.InvokeCommand.GetCommand('Import-CliXml', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:NewPSSessionOption = $executionContext.InvokeCommand.GetCommand('New-PSSessionOption', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:JoinPath = $executionContext.InvokeCommand.GetCommand('Join-Path', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:ExportModuleMember = $executionContext.InvokeCommand.GetCommand('Export-ModuleMember', [System.Management.Automation.CommandTypes]::Cmdlet)
$script:SetAlias = $executionContext.InvokeCommand.GetCommand('Set-Alias', [System.Management.Automation.CommandTypes]::Cmdlet)

$script:MyModule = $MyInvocation.MyCommand.ScriptBlock.Module
        
##############################################################################

function Write-PSImplicitRemotingMessage
{
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]
        $message)
        
    try { & $script:WriteHost -Object $message -ErrorAction SilentlyContinue } catch { }
}

function Get-PSImplicitRemotingSessionOption
{
    if ($PSSessionOptionOverride -ne $null)
    {
        return $PSSessionOptionOverride
    }
    else
    {
        return $(& $script:NewPSSessionOption -Culture 'en-US' -UICulture 'en-US' -CancelTimeOut 60000 -IdleTimeOut 7200000 -OpenTimeOut 180000 -OperationTimeOut 180000 -MaximumReceivedObjectSize 209715200 -MaximumRedirection 0 -ProxyAccessType None -ProxyAuthentication Negotiate )
    }
}

$script:PSSession = $null

function Get-PSImplicitRemotingModuleName { $myInvocation.MyCommand.ScriptBlock.File }

function Set-PSImplicitRemotingSession
{
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [AllowNull()]
        [Management.Automation.Runspaces.PSSession] 
        $PSSession, 

        [Parameter(Mandatory = $false, Position = 1)]
        [bool] $createdByModule = $false)

    if ($PSSession -ne $null)
    {
        $script:PSSession = $PSSession

        if ($createdByModule -and ($script:PSSession -ne $null))
        {
            $moduleName = Get-PSImplicitRemotingModuleName 
            $script:PSSession.Name = 'Session for implicit remoting module at {0}' -f $moduleName
            
            $oldCleanUpScript = $script:MyModule.OnRemove
            $removePSSessionCommand = $script:RemovePSSession
            $script:MyModule.OnRemove = { 
                & $removePSSessionCommand -Session $PSSession -ErrorAction SilentlyContinue
                if ($oldCleanUpScript)
                {
                    & $oldCleanUpScript $args
                }
            }.GetNewClosure()
        }
    }
}

if ($PSSessionOverride) { Set-PSImplicitRemotingSession $PSSessionOverride }

function Get-PSImplicitRemotingSession
{
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string] 
        $commandName
    )

    $savedImplicitRemotingHash = ''

    if (($script:PSSession -eq $null) -or ($script:PSSession.Runspace.RunspaceStateInfo.State -ne 'Opened'))
    {
        Set-PSImplicitRemotingSession `
            (& $script:GetPSSession `
                -InstanceId 2e1eeda9-9b9e-4369-a681-d081fd3354bc `
                -ErrorAction SilentlyContinue )
    }
    if (($script:PSSession -ne $null) -and ($script:PSSession.Runspace.RunspaceStateInfo.State -eq 'Disconnected'))
    {
        # If we are handed a disconnected session, try re-connecting it before creating a new session.
        Set-PSImplicitRemotingSession `
            (& $script:ConnectPSSession `
                -Session $script:PSSession `
                -ErrorAction SilentlyContinue)
    }
    if (($script:PSSession -eq $null) -or ($script:PSSession.Runspace.RunspaceStateInfo.State -ne 'Opened'))
    {
        Write-PSImplicitRemotingMessage ('Creating a new session for implicit remoting of "{0}" command...' -f $commandName)

        Set-PSImplicitRemotingSession `
            -CreatedByModule $true `
            -PSSession ( 
            $( 
                & $script:NewPSSession `
                    -ComputerName $ImplicitGPO `
                    -ApplicationName 'wsman'    -ConfigurationName 'Microsoft.PowerShell' `
                    -SessionOption (Get-PSImplicitRemotingSessionOption) `
                    -Credential $creds `
                     `
                    -Authentication Default `
                     `
            )
 )

        if ($savedImplicitRemotingHash -ne '')
        {
            $newImplicitRemotingHash = [string]($script:PSSession.ApplicationPrivateData.ImplicitRemoting.Hash)
            if ($newImplicitRemotingHash -ne $savedImplicitRemotingHash)
            {
                & $script:WriteWarning -Message 'Commands that are available in the new remote session are different than those available when the implicit remoting module was created.  Consider creating the module again by using the Export-PSSession cmdlet.'
            }
        }

        
    }
    if (($script:PSSession -eq $null) -or ($script:PSSession.Runspace.RunspaceStateInfo.State -ne 'Opened'))
    {
        throw 'No session has been associated with this implicit remoting module.'
    }
    return [Management.Automation.Runspaces.PSSession]$script:PSSession
}

function Modify-PSImplicitRemotingParameters
{
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [hashtable]
        $clientSideParameters,

        [Parameter(Mandatory = $true, Position = 1)]
        $PSBoundParameters,

        [Parameter(Mandatory = $true, Position = 2)]
        [string]
        $parameterName,

        [Parameter()]
        [switch]
        $leaveAsRemoteParameter)
        
    if ($PSBoundParameters.ContainsKey($parameterName))
    {
        $clientSideParameters.Add($parameterName, $PSBoundParameters[$parameterName])
        if (-not $leaveAsRemoteParameter) { 
            $null = $PSBoundParameters.Remove($parameterName) 
        }
    }
}

function Get-PSImplicitRemotingClientSideParameters
{
    param(
        [Parameter(Mandatory = $true, Position = 1)]
        $PSBoundParameters,

        [Parameter(Mandatory = $true, Position = 2)]
        $proxyForCmdlet)

    $clientSideParameters = @{}
    $parametersToLeaveRemote = 'ErrorAction', 'WarningAction', 'InformationAction'

    Modify-PSImplicitRemotingParameters $clientSideParameters $PSBoundParameters 'AsJob'
    if ($proxyForCmdlet)
    {
        foreach($parameter in [System.Management.Automation.Cmdlet]::CommonParameters)
        {
            if($parametersToLeaveRemote -contains $parameter)
            {
                Modify-PSImplicitRemotingParameters $clientSideParameters $PSBoundParameters $parameter -LeaveAsRemoteParameter
            }
            else
            {
                Modify-PSImplicitRemotingParameters $clientSideParameters $PSBoundParameters $parameter
            }
        }
    }

    return $clientSideParameters
}

##############################################################################

& $script:SetItem 'function:script:Get-GPPermission' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    ${TargetName},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('ID')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    ${TargetType},

    [Alias('ov')]
    ${OutVariable},

    [Alias('Domain')]
    ${DomainName},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-GPPermission') `
                            -Arg ('Get-GPPermission', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-GPPermission
    # .ForwardHelpCategory Alias
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-GPPermission' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    ${TargetName},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${Replace},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('ID')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    ${PermissionLevel},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    ${TargetType},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('Domain')]
    ${DomainName},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-GPPermission') `
                            -Arg ('Set-GPPermission', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-GPPermission
    # .ForwardHelpCategory Alias
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Backup-GPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    ${Comment},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ev')]
    ${ErrorVariable},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('backupLocation')]
    ${Path},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Backup-GPO') `
                            -Arg ('Backup-GPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Backup-GPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Copy-GPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${SourceDomainController},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${TargetDomainController},

    [Alias('DomainName')]
    ${SourceDomain},

    ${TargetName},

    [Alias('Id')]
    ${SourceGuid},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${TargetDomain},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${CopyAcl},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DisplayName')]
    ${SourceName},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${MigrationTable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Copy-GPO') `
                            -Arg ('Copy-GPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Copy-GPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-GPInheritance' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('path')]
    ${Target},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-GPInheritance') `
                            -Arg ('Get-GPInheritance', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-GPInheritance
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-GPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-GPO') `
                            -Arg ('Get-GPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-GPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-GPOReport' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Path},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${ReportType},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-GPOReport') `
                            -Arg ('Get-GPOReport', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-GPOReport
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-GPPrefRegistryValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    ${Context},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    ${ValueName},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('FullKeyPath')]
    ${Key},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${Order},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-GPPrefRegistryValue') `
                            -Arg ('Get-GPPrefRegistryValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-GPPrefRegistryValue
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-GPRegistryValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    ${ValueName},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('FullKeyPath')]
    ${Key},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-GPRegistryValue') `
                            -Arg ('Get-GPRegistryValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-GPRegistryValue
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-GPResultantSetOfPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Path},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${Computer},

    ${User},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${ReportType},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-GPResultantSetOfPolicy') `
                            -Arg ('Get-GPResultantSetOfPolicy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-GPResultantSetOfPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-GPStarterGPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-GPStarterGPO') `
                            -Arg ('Get-GPStarterGPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-GPStarterGPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Import-GPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('backupLocation','BackupDirectory')]
    ${Path},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ov')]
    ${OutVariable},

    ${TargetName},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${CreateIfNeeded},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('Id')]
    ${BackupId},

    [Alias('DC')]
    ${Server},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('DisplayName')]
    ${BackupGpoName},

    [Alias('DomainName')]
    ${Domain},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wa')]
    ${WarningAction},

    ${MigrationTable},

    ${TargetGuid},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Import-GPO') `
                            -Arg ('Import-GPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Import-GPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Invoke-GPUpdate' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ov')]
    ${OutVariable},

    [Alias('RandomnessInMinutes')]
    ${RandomDelayInMinutes},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DNSHostName')]
    ${Computer},

    [switch]
    ${Sync},

    [Alias('ev')]
    ${ErrorVariable},

    [switch]
    ${LogOff},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Target},

    [switch]
    ${Force},

    [switch]
    ${Boot})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Invoke-GPUpdate') `
                            -Arg ('Invoke-GPUpdate', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Invoke-GPUpdate
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-GPLink' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Target},

    [Alias('DisplayName')]
    ${Name},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('wv')]
    ${WarningVariable},

    ${LinkEnabled},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('DC')]
    ${Server},

    [Alias('ID')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${Enforced},

    ${Order},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-GPLink') `
                            -Arg ('New-GPLink', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName New-GPLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-GPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    ${Comment},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('Id')]
    ${StarterGpoGuid},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${StarterGpoName},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-GPO') `
                            -Arg ('New-GPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName New-GPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-GPStarterGPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    ${Comment},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-GPStarterGPO') `
                            -Arg ('New-GPStarterGPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName New-GPStarterGPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-GPLink' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('ID','GPOID')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${Target},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-GPLink') `
                            -Arg ('Remove-GPLink', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-GPLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-GPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${KeepLinks},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('ID','GPOID')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-GPO') `
                            -Arg ('Remove-GPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-GPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-GPPrefRegistryValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    ${Context},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    ${ValueName},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('FullKeyPath')]
    ${Key},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${Order},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-GPPrefRegistryValue') `
                            -Arg ('Remove-GPPrefRegistryValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-GPPrefRegistryValue
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-GPRegistryValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    ${ValueName},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('FullKeyPath')]
    ${Key},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-GPRegistryValue') `
                            -Arg ('Remove-GPRegistryValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-GPRegistryValue
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Rename-GPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    ${TargetName},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Rename-GPO') `
                            -Arg ('Rename-GPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Rename-GPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Restore-GPO' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('Id')]
    ${BackupId},

    [Alias('DC')]
    ${Server},

    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('backupLocation','BackupDirectory')]
    ${Path},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Restore-GPO') `
                            -Arg ('Restore-GPO', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Restore-GPO
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-GPInheritance' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('DC')]
    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('path')]
    ${Target},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${IsBlocked},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-GPInheritance') `
                            -Arg ('Set-GPInheritance', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-GPInheritance
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-GPLink' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Target},

    [Alias('DisplayName')]
    ${Name},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('wv')]
    ${WarningVariable},

    ${LinkEnabled},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('DC')]
    ${Server},

    [Alias('ID','GPOID')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('DomainName')]
    ${Domain},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${Enforced},

    ${Order},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-GPLink') `
                            -Arg ('Set-GPLink', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-GPLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-GPPrefRegistryValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Action},

    [Alias('DC')]
    ${Server},

    [Alias('DisplayName')]
    ${Name},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Value},

    [switch]
    ${Disable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Context},

    ${Order},

    ${Type},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    ${ValueName},

    [Alias('DomainName')]
    ${Domain},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('FullKeyPath')]
    ${Key},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-GPPrefRegistryValue') `
                            -Arg ('Set-GPPrefRegistryValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-GPPrefRegistryValue
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-GPRegistryValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DisplayName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    ${Value},

    [switch]
    ${Disable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Type},

    [Alias('DC')]
    ${Server},

    [Alias('Id')]
    ${Guid},

    [Alias('ev')]
    ${ErrorVariable},

    ${ValueName},

    [switch]
    ${Additive},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('FullKeyPath')]
    ${Key},

    [Alias('wa')]
    ${WarningAction},

    ${ValuePrefix},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('DomainName')]
    ${Domain},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${AsJob})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-GPRegistryValue') `
                            -Arg ('Set-GPRegistryValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-GPRegistryValue
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
##############################################################################

& $script:ExportModuleMember -Function @('Get-GPPermission', 'Set-GPPermission', 'Backup-GPO', 'Copy-GPO', 'Get-GPInheritance', 'Get-GPO', 'Get-GPOReport', 'Get-GPPrefRegistryValue', 'Get-GPRegistryValue', 'Get-GPResultantSetOfPolicy', 'Get-GPStarterGPO', 'Import-GPO', 'Invoke-GPUpdate', 'New-GPLink', 'New-GPO', 'New-GPStarterGPO', 'Remove-GPLink', 'Remove-GPO', 'Remove-GPPrefRegistryValue', 'Remove-GPRegistryValue', 'Rename-GPO', 'Restore-GPO', 'Set-GPInheritance', 'Set-GPLink', 'Set-GPPrefRegistryValue', 'Set-GPRegistryValue')
        
##############################################################################

& $script:SetAlias -Name 'Get-GPPermissions' -Value 'Get-GPPermission' -Force -Scope script
        
& $script:SetAlias -Name 'Set-GPPermissions' -Value 'Set-GPPermission' -Force -Scope script
        
& $script:ExportModuleMember -Alias @('Get-GPPermissions', 'Set-GPPermissions')
        
