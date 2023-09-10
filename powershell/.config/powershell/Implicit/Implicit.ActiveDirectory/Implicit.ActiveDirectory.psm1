
<#
 # Implicit remoting module
 # generated on 12/16/2020 6:59:07 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\Implicit\ActiveDirectory" -Session (get-pssession -Name WinRM1) -CommandType Cmdlet -CommandName "*-AD*" -AllowClobber -Force
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
                -InstanceId 81c7c2b9-9fe2-4719-93a3-cc6d6119fa48 `
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
                    -ComputerName $ImplicitAD `
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

& $script:SetItem 'function:script:Add-ADCentralAccessPolicyMember' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Members},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-ADCentralAccessPolicyMember') `
                            -Arg ('Add-ADCentralAccessPolicyMember', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-ADCentralAccessPolicyMember
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-ADComputerServiceAccount' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${ServiceAccount},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Computer')]
    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-ADComputerServiceAccount') `
                            -Arg ('Add-ADComputerServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-ADComputerServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-ADDomainControllerPasswordReplicationPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${AllowedList},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${DeniedList},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-ADDomainControllerPasswordReplicationPolicy') `
                            -Arg ('Add-ADDomainControllerPasswordReplicationPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-ADDomainControllerPasswordReplicationPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-ADFineGrainedPasswordPolicySubject' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Subjects},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-ADFineGrainedPasswordPolicySubject') `
                            -Arg ('Add-ADFineGrainedPasswordPolicySubject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-ADFineGrainedPasswordPolicySubject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-ADGroupMember' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${MemberTimeToLive},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${DisablePermissiveModify},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Members},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-ADGroupMember') `
                            -Arg ('Add-ADGroupMember', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-ADGroupMember
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-ADPrincipalGroupMembership' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${MemberOf},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-ADPrincipalGroupMembership') `
                            -Arg ('Add-ADPrincipalGroupMembership', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-ADPrincipalGroupMembership
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-ADResourcePropertyListMember' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Members},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-ADResourcePropertyListMember') `
                            -Arg ('Add-ADResourcePropertyListMember', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-ADResourcePropertyListMember
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Clear-ADAccountExpiration' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Clear-ADAccountExpiration') `
                            -Arg ('Clear-ADAccountExpiration', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Clear-ADAccountExpiration
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Clear-ADClaimTransformLink' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    ${TrustRole},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Policy},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Clear-ADClaimTransformLink') `
                            -Arg ('Clear-ADClaimTransformLink', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Clear-ADClaimTransformLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disable-ADAccount' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disable-ADAccount') `
                            -Arg ('Disable-ADAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Disable-ADAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disable-ADOptionalFeature' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    ${Scope},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Target},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disable-ADOptionalFeature') `
                            -Arg ('Disable-ADOptionalFeature', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Disable-ADOptionalFeature
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Enable-ADAccount' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Enable-ADAccount') `
                            -Arg ('Enable-ADAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Enable-ADAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Enable-ADOptionalFeature' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    ${Scope},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Target},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Enable-ADOptionalFeature') `
                            -Arg ('Enable-ADOptionalFeature', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Enable-ADOptionalFeature
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Find-AdmPwdExtendedRights' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${SchemaNotUpdated},

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

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('OrgUnit')]
    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [switch]
    ${IncludeComputers},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Find-AdmPwdExtendedRights') `
                            -Arg ('Find-AdmPwdExtendedRights', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Find-AdmPwdExtendedRights
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADAccountAuthorizationGroup' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADAccountAuthorizationGroup') `
                            -Arg ('Get-ADAccountAuthorizationGroup', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADAccountAuthorizationGroup
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADAccountResultantPasswordReplicationPolicy' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${DomainController},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADAccountResultantPasswordReplicationPolicy') `
                            -Arg ('Get-ADAccountResultantPasswordReplicationPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADAccountResultantPasswordReplicationPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADAuthenticationPolicy' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADAuthenticationPolicy') `
                            -Arg ('Get-ADAuthenticationPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADAuthenticationPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADAuthenticationPolicySilo' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADAuthenticationPolicySilo') `
                            -Arg ('Get-ADAuthenticationPolicySilo', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADAuthenticationPolicySilo
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADCentralAccessPolicy' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADCentralAccessPolicy') `
                            -Arg ('Get-ADCentralAccessPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADCentralAccessPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADCentralAccessRule' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADCentralAccessRule') `
                            -Arg ('Get-ADCentralAccessRule', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADCentralAccessRule
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADClaimTransformPolicy' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADClaimTransformPolicy') `
                            -Arg ('Get-ADClaimTransformPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADClaimTransformPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADClaimType' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADClaimType') `
                            -Arg ('Get-ADClaimType', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADClaimType
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADComputer' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${SearchScope},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

    ${SearchBase},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADComputer') `
                            -Arg ('Get-ADComputer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADComputer
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADComputerServiceAccount' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADComputerServiceAccount') `
                            -Arg ('Get-ADComputerServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADComputerServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADDCCloningExcludedApplicationList' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${GenerateXml},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Path},

    [switch]
    ${Force},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADDCCloningExcludedApplicationList') `
                            -Arg ('Get-ADDCCloningExcludedApplicationList', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADDCCloningExcludedApplicationList
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADDefaultDomainPasswordPolicy' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Current},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADDefaultDomainPasswordPolicy') `
                            -Arg ('Get-ADDefaultDomainPasswordPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADDefaultDomainPasswordPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADDomain' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Current},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADDomain') `
                            -Arg ('Get-ADDomain', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADDomain
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADDomainController' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${ForceDiscover},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${NextClosestSite},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${Writable},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${MinimumDirectoryServiceVersion},

    [switch]
    ${AvoidSelf},

    [Alias('ev')]
    ${ErrorVariable},

    ${Service},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${Server},

    [switch]
    ${Discover},

    ${SiteName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADDomainController') `
                            -Arg ('Get-ADDomainController', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADDomainController
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADDomainControllerPasswordReplicationPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${Allowed},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${AuthType},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    ${Credential},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [switch]
    ${Denied},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADDomainControllerPasswordReplicationPolicy') `
                            -Arg ('Get-ADDomainControllerPasswordReplicationPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADDomainControllerPasswordReplicationPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADDomainControllerPasswordReplicationPolicyUsage' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [switch]
    ${RevealedAccounts},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [switch]
    ${AuthenticatedAccounts},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADDomainControllerPasswordReplicationPolicyUsage') `
                            -Arg ('Get-ADDomainControllerPasswordReplicationPolicyUsage', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADDomainControllerPasswordReplicationPolicyUsage
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADFineGrainedPasswordPolicy' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${SearchScope},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

    ${SearchBase},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADFineGrainedPasswordPolicy') `
                            -Arg ('Get-ADFineGrainedPasswordPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADFineGrainedPasswordPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADFineGrainedPasswordPolicySubject' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADFineGrainedPasswordPolicySubject') `
                            -Arg ('Get-ADFineGrainedPasswordPolicySubject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADFineGrainedPasswordPolicySubject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADForest' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Current},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADForest') `
                            -Arg ('Get-ADForest', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADForest
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADGroup' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${SearchScope},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [switch]
    ${ShowMemberTimeToLive},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

    ${SearchBase},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADGroup') `
                            -Arg ('Get-ADGroup', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADGroup
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADGroupMember' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    [switch]
    ${Recursive},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADGroupMember') `
                            -Arg ('Get-ADGroupMember', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADGroupMember
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-AdmPwdPassword' `
{
    param(
    
    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    ${ComputerName},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-AdmPwdPassword') `
                            -Arg ('Get-AdmPwdPassword', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-AdmPwdPassword
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADObject' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    ${SearchBase},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${SearchScope},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

    [switch]
    ${IncludeDeletedObjects},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADObject') `
                            -Arg ('Get-ADObject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADObject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADOptionalFeature' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${SearchScope},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

    ${SearchBase},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADOptionalFeature') `
                            -Arg ('Get-ADOptionalFeature', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADOptionalFeature
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADOrganizationalUnit' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${SearchScope},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

    ${SearchBase},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADOrganizationalUnit') `
                            -Arg ('Get-ADOrganizationalUnit', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADOrganizationalUnit
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADPrincipalGroupMembership' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    ${ResourceContextPartition},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${ResourceContextServer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADPrincipalGroupMembership') `
                            -Arg ('Get-ADPrincipalGroupMembership', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADPrincipalGroupMembership
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationAttributeMetadata' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Property','Attribute','Attributes')]
    ${Properties},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [switch]
    ${ShowAllLinkedValues},

    ${Object},

    [switch]
    ${IncludeDeletedObjects},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationAttributeMetadata') `
                            -Arg ('Get-ADReplicationAttributeMetadata', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationAttributeMetadata
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationConnection' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Property')]
    ${Properties},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationConnection') `
                            -Arg ('Get-ADReplicationConnection', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationConnection
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationFailure' `
{
    param(
    
    ${AuthType},

    ${EnumeratingServer},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ev')]
    ${ErrorVariable},

    ${Filter},

    [Alias('ReplicationSite')]
    ${Scope},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Name','HostName','Site','Domain','Forest')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationFailure') `
                            -Arg ('Get-ADReplicationFailure', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationFailure
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationPartnerMetadata' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${EnumerationServer},

    ${PartnerType},

    [Alias('ev')]
    ${ErrorVariable},

    ${Filter},

    ${Scope},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('NC','NamingContext')]
    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Name','HostName','Site','Domain','Forest')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationPartnerMetadata') `
                            -Arg ('Get-ADReplicationPartnerMetadata', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationPartnerMetadata
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationQueueOperation' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('NC','NamingContext')]
    ${Partition},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationQueueOperation') `
                            -Arg ('Get-ADReplicationQueueOperation', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationQueueOperation
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationSite' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Property')]
    ${Properties},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationSite') `
                            -Arg ('Get-ADReplicationSite', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationSite
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationSiteLink' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Property')]
    ${Properties},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationSiteLink') `
                            -Arg ('Get-ADReplicationSiteLink', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationSiteLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationSiteLinkBridge' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Property')]
    ${Properties},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationSiteLinkBridge') `
                            -Arg ('Get-ADReplicationSiteLinkBridge', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationSiteLinkBridge
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationSubnet' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Property')]
    ${Properties},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationSubnet') `
                            -Arg ('Get-ADReplicationSubnet', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationSubnet
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADReplicationUpToDatenessVectorTable' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${EnumerationServer},

    [Alias('ev')]
    ${ErrorVariable},

    ${Filter},

    [Alias('ReplicationSite')]
    ${Scope},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('NC','NamingContext')]
    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Name','HostName','Site','Domain','Forest')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADReplicationUpToDatenessVectorTable') `
                            -Arg ('Get-ADReplicationUpToDatenessVectorTable', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADReplicationUpToDatenessVectorTable
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADResourceProperty' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADResourceProperty') `
                            -Arg ('Get-ADResourceProperty', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADResourceProperty
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADResourcePropertyList' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADResourcePropertyList') `
                            -Arg ('Get-ADResourcePropertyList', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADResourcePropertyList
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADResourcePropertyValueType' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADResourcePropertyValueType') `
                            -Arg ('Get-ADResourcePropertyValueType', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADResourcePropertyValueType
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADRootDSE' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Property')]
    ${Properties},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADRootDSE') `
                            -Arg ('Get-ADRootDSE', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADRootDSE
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADServiceAccount' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${SearchScope},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

    ${SearchBase},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADServiceAccount') `
                            -Arg ('Get-ADServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADTrust' `
{
    param(
    
    ${AuthType},

    ${InputObject},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADTrust') `
                            -Arg ('Get-ADTrust', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADTrust
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADUser' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Property')]
    ${Properties},

    ${SearchScope},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${LDAPFilter},

    ${Filter},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${ResultSetSize},

    ${ResultPageSize},

    ${SearchBase},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADUser') `
                            -Arg ('Get-ADUser', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADUser
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-ADUserResultantPasswordPolicy' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-ADUserResultantPasswordPolicy') `
                            -Arg ('Get-ADUserResultantPasswordPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-ADUserResultantPasswordPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Grant-ADAuthenticationPolicySiloAccess' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Account},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Grant-ADAuthenticationPolicySiloAccess') `
                            -Arg ('Grant-ADAuthenticationPolicySiloAccess', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Grant-ADAuthenticationPolicySiloAccess
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Install-ADServiceAccount' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${Force},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PromptForPassword},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${AccountPassword},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Install-ADServiceAccount') `
                            -Arg ('Install-ADServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Install-ADServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Move-ADDirectoryServer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Site},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Move-ADDirectoryServer') `
                            -Arg ('Move-ADDirectoryServer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Move-ADDirectoryServer
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Move-ADDirectoryServerOperationMasterRole' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${Force},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${OperationMasterRole},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Move-ADDirectoryServerOperationMasterRole') `
                            -Arg ('Move-ADDirectoryServerOperationMasterRole', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Move-ADDirectoryServerOperationMasterRole
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Move-ADObject' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${TargetPath},

    [Alias('pv')]
    ${PipelineVariable},

    ${TargetServer},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Move-ADObject') `
                            -Arg ('Move-ADObject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Move-ADObject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADAuthenticationPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ComputerTGTLifetimeMins},

    ${RollingNTLMSecret},

    [switch]
    ${ServiceAllowedNTLMNetworkAuthentication},

    ${Instance},

    ${Name},

    [switch]
    ${Enforce},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Description},

    [Alias('wv')]
    ${WarningVariable},

    ${UserAllowedToAuthenticateFrom},

    ${UserTGTLifetimeMins},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    [Alias('ev')]
    ${ErrorVariable},

    ${AuthType},

    ${ServiceAllowedToAuthenticateTo},

    ${ServiceTGTLifetimeMins},

    ${ServiceAllowedToAuthenticateFrom},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${OtherAttributes},

    ${ComputerAllowedToAuthenticateTo},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [switch]
    ${UserAllowedNTLMNetworkAuthentication},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${UserAllowedToAuthenticateTo},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADAuthenticationPolicy') `
                            -Arg ('New-ADAuthenticationPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADAuthenticationPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADAuthenticationPolicySilo' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    ${ServiceAuthenticationPolicy},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${ProtectedFromAccidentalDeletion},

    [switch]
    ${Enforce},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    ${UserAuthenticationPolicy},

    [Alias('wa')]
    ${WarningAction},

    ${ComputerAuthenticationPolicy},

    ${OtherAttributes},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADAuthenticationPolicySilo') `
                            -Arg ('New-ADAuthenticationPolicySilo', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADAuthenticationPolicySilo
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADCentralAccessPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADCentralAccessPolicy') `
                            -Arg ('New-ADCentralAccessPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADCentralAccessPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADCentralAccessRule' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ProposedAcl},

    ${CurrentAcl},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    ${ResourceCondition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${ProtectedFromAccidentalDeletion},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADCentralAccessRule') `
                            -Arg ('New-ADCentralAccessRule', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADCentralAccessRule
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADClaimTransformPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${DenyAll},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    ${AllowAllExcept},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${AllowAll},

    [Alias('ev')]
    ${ErrorVariable},

    ${DenyAllExcept},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    [Alias('wa')]
    ${WarningAction},

    ${Rule},

    ${Server},

    ${ProtectedFromAccidentalDeletion},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADClaimTransformPolicy') `
                            -Arg ('New-ADClaimTransformPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADClaimTransformPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADClaimType' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${SuggestedValues},

    ${Description},

    ${IsSingleValued},

    ${DisplayName},

    ${Enabled},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${ValueType},

    ${SourceOID},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    ${ID},

    ${AppliesToClasses},

    [switch]
    ${SourceTransformPolicy},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${OtherAttributes},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${RestrictValues},

    [Alias('ob')]
    ${OutBuffer},

    ${SourceAttribute},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADClaimType') `
                            -Arg ('New-ADClaimType', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADClaimType
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADComputer' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${TrustedForDelegation},

    ${Description},

    ${OperatingSystemServicePack},

    ${OperatingSystemHotfix},

    ${AccountPassword},

    ${DisplayName},

    ${AuthenticationPolicy},

    ${Instance},

    ${KerberosEncryptionType},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Location},

    ${SAMAccountName},

    [Alias('wv')]
    ${WarningVariable},

    ${Path},

    ${AccountExpirationDate},

    ${UserPrincipalName},

    ${OperatingSystem},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${ServicePrincipalNames},

    ${Credential},

    ${CannotChangePassword},

    ${AuthType},

    ${PrincipalsAllowedToDelegateToAccount},

    ${PasswordNeverExpires},

    ${AccountNotDelegated},

    ${PasswordNotRequired},

    ${OtherAttributes},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${AuthenticationPolicySilo},

    ${AllowReversiblePasswordEncryption},

    ${Certificates},

    ${ChangePasswordAtLogon},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${OperatingSystemVersion},

    ${Enabled},

    [Alias('ob')]
    ${OutBuffer},

    ${HomePage},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${DNSHostName},

    ${CompoundIdentitySupported},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADComputer') `
                            -Arg ('New-ADComputer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADComputer
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADDCCloneConfigFile' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${Static},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    ${IPv6DNSResolver},

    [Alias('infa')]
    ${InformationAction},

    ${IPv4SubnetMask},

    ${IPv4DNSResolver},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${AlternateWINSServer},

    [Alias('ev')]
    ${ErrorVariable},

    ${IPv4DefaultGateway},

    ${SiteName},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('cn')]
    ${CloneComputerName},

    [Alias('wa')]
    ${WarningAction},

    ${IPv4Address},

    [switch]
    ${Offline},

    ${Path},

    ${PreferredWINSServer},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADDCCloneConfigFile') `
                            -Arg ('New-ADDCCloneConfigFile', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADDCCloneConfigFile
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADFineGrainedPasswordPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${LockoutObservationWindow},

    ${ComplexityEnabled},

    ${Description},

    ${ReversibleEncryptionEnabled},

    ${DisplayName},

    ${MinPasswordLength},

    ${Instance},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    ${LockoutDuration},

    [Alias('wv')]
    ${WarningVariable},

    ${Precedence},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    [Alias('db')]
    [switch]
    ${Debug},

    ${MaxPasswordAge},

    [Alias('ov')]
    ${OutVariable},

    ${MinPasswordAge},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${PasswordHistoryCount},

    [switch]
    ${PassThru},

    ${OtherAttributes},

    ${ProtectedFromAccidentalDeletion},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${LockoutThreshold},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADFineGrainedPasswordPolicy') `
                            -Arg ('New-ADFineGrainedPasswordPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADFineGrainedPasswordPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADGroup' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${DisplayName},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Instance},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${SamAccountName},

    [Alias('wv')]
    ${WarningVariable},

    ${Path},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    [Alias('ov')]
    ${OutVariable},

    ${GroupScope},

    ${GroupCategory},

    [switch]
    ${PassThru},

    ${OtherAttributes},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${HomePage},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADGroup') `
                            -Arg ('New-ADGroup', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADGroup
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADObject' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    ${Type},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${DisplayName},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ProtectedFromAccidentalDeletion},

    ${Name},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Path},

    ${OtherAttributes},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADObject') `
                            -Arg ('New-ADObject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADObject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADOrganizationalUnit' `
{
    param(
    
    ${PostalCode},

    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${DisplayName},

    ${Instance},

    ${Path},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${City},

    ${Credential},

    ${Name},

    ${AuthType},

    ${Country},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${StreetAddress},

    [switch]
    ${PassThru},

    ${OtherAttributes},

    ${State},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADOrganizationalUnit') `
                            -Arg ('New-ADOrganizationalUnit', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADOrganizationalUnit
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADReplicationSite' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${TopologyMinimumHopsEnabled},

    ${Description},

    ${WindowsServer2003KCCIgnoreScheduleEnabled},

    ${Instance},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    ${InterSiteTopologyGenerator},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ScheduleHashingEnabled},

    ${AutomaticTopologyGenerationEnabled},

    ${WindowsServer2000KCCISTGSelectionBehaviorEnabled},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${WindowsServer2000BridgeheadSelectionMethodEnabled},

    ${Credential},

    ${TopologyDetectStaleEnabled},

    ${AuthType},

    ${RedundantServerTopologyEnabled},

    ${ReplicationSchedule},

    ${WindowsServer2003KCCBehaviorEnabled},

    ${TopologyCleanupEnabled},

    ${WindowsServer2003KCCSiteLinkBridgingEnabled},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${UniversalGroupCachingRefreshSite},

    [switch]
    ${PassThru},

    ${OtherAttributes},

    ${AutomaticInterSiteTopologyGenerationEnabled},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${UniversalGroupCachingEnabled},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADReplicationSite') `
                            -Arg ('New-ADReplicationSite', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADReplicationSite
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADReplicationSiteLink' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    ${Cost},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${InterSiteTransportProtocol},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    ${SitesIncluded},

    [Alias('wa')]
    ${WarningAction},

    ${ReplicationSchedule},

    ${Server},

    ${ReplicationFrequencyInMinutes},

    ${OtherAttributes},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADReplicationSiteLink') `
                            -Arg ('New-ADReplicationSiteLink', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADReplicationSiteLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADReplicationSiteLinkBridge' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${InterSiteTransportProtocol},

    ${SiteLinksIncluded},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${OtherAttributes},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADReplicationSiteLinkBridge') `
                            -Arg ('New-ADReplicationSiteLinkBridge', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADReplicationSiteLinkBridge
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADReplicationSubnet' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Site},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Location},

    ${OtherAttributes},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADReplicationSubnet') `
                            -Arg ('New-ADReplicationSubnet', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADReplicationSubnet
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADResourceProperty' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${SuggestedValues},

    ${SharesValuesWith},

    ${Description},

    ${DisplayName},

    ${IsSecured},

    ${Enabled},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${ResourcePropertyValueType},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${AppliesToResourceTypes},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    ${ID},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${OtherAttributes},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADResourceProperty') `
                            -Arg ('New-ADResourceProperty', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADResourceProperty
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADResourcePropertyList' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADResourcePropertyList') `
                            -Arg ('New-ADResourcePropertyList', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADResourcePropertyList
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADServiceAccount' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ManagedPasswordIntervalInDays},

    ${Description},

    ${AccountPassword},

    ${DisplayName},

    ${Enabled},

    ${Instance},

    ${KerberosEncryptionType},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${RestrictToSingleComputer},

    ${SamAccountName},

    [switch]
    ${RestrictToOutboundAuthenticationOnly},

    [Alias('wv')]
    ${WarningVariable},

    ${Path},

    ${AccountExpirationDate},

    ${PrincipalsAllowedToRetrieveManagedPassword},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${ServicePrincipalNames},

    ${Credential},

    ${AuthType},

    ${PrincipalsAllowedToDelegateToAccount},

    ${AccountNotDelegated},

    ${OtherAttributes},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${AuthenticationPolicySilo},

    ${TrustedForDelegation},

    ${Certificates},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${AuthenticationPolicy},

    [Alias('ob')]
    ${OutBuffer},

    ${HomePage},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${DNSHostName},

    ${CompoundIdentitySupported},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADServiceAccount') `
                            -Arg ('New-ADServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-ADUser' `
{
    param(
    
    ${ServicePrincipalNames},

    ${Initials},

    ${AuthenticationPolicy},

    ${Department},

    ${AccountPassword},

    [Alias('wa')]
    ${WarningAction},

    ${PasswordNotRequired},

    ${Type},

    ${Country},

    ${Company},

    ${CannotChangePassword},

    ${Organization},

    ${Fax},

    ${Path},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${HomeDirectory},

    ${SamAccountName},

    ${UserPrincipalName},

    ${OfficePhone},

    ${ScriptPath},

    ${GivenName},

    [Alias('ov')]
    ${OutVariable},

    ${Server},

    ${PrincipalsAllowedToDelegateToAccount},

    ${ProfilePath},

    [Alias('db')]
    [switch]
    ${Debug},

    ${DisplayName},

    [Alias('pv')]
    ${PipelineVariable},

    ${Credential},

    ${SmartcardLogonRequired},

    ${Enabled},

    ${HomeDrive},

    [Alias('iv')]
    ${InformationVariable},

    ${Description},

    ${LogonWorkstations},

    [Alias('infa')]
    ${InformationAction},

    ${AccountExpirationDate},

    ${Manager},

    ${Surname},

    ${KerberosEncryptionType},

    ${EmailAddress},

    ${PostalCode},

    ${Name},

    ${POBox},

    [switch]
    ${PassThru},

    ${AuthenticationPolicySilo},

    ${Division},

    ${StreetAddress},

    ${CompoundIdentitySupported},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Certificates},

    ${MobilePhone},

    ${OtherAttributes},

    ${Title},

    ${Office},

    [Alias('wv')]
    ${WarningVariable},

    ${City},

    ${AuthType},

    [Alias('ea')]
    ${ErrorAction},

    ${State},

    ${AllowReversiblePasswordEncryption},

    ${HomePhone},

    ${PasswordNeverExpires},

    ${OtherName},

    ${AccountNotDelegated},

    ${TrustedForDelegation},

    ${EmployeeID},

    ${ChangePasswordAtLogon},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    ${EmployeeNumber},

    ${HomePage},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-ADUser') `
                            -Arg ('New-ADUser', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName New-ADUser
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADAuthenticationPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADAuthenticationPolicy') `
                            -Arg ('Remove-ADAuthenticationPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADAuthenticationPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADAuthenticationPolicySilo' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADAuthenticationPolicySilo') `
                            -Arg ('Remove-ADAuthenticationPolicySilo', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADAuthenticationPolicySilo
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADCentralAccessPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADCentralAccessPolicy') `
                            -Arg ('Remove-ADCentralAccessPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADCentralAccessPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADCentralAccessPolicyMember' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Members},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADCentralAccessPolicyMember') `
                            -Arg ('Remove-ADCentralAccessPolicyMember', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADCentralAccessPolicyMember
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADCentralAccessRule' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADCentralAccessRule') `
                            -Arg ('Remove-ADCentralAccessRule', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADCentralAccessRule
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADClaimTransformPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADClaimTransformPolicy') `
                            -Arg ('Remove-ADClaimTransformPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADClaimTransformPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADClaimType' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${Force},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADClaimType') `
                            -Arg ('Remove-ADClaimType', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADClaimType
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADComputer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADComputer') `
                            -Arg ('Remove-ADComputer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADComputer
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADComputerServiceAccount' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${ServiceAccount},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('Computer')]
    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADComputerServiceAccount') `
                            -Arg ('Remove-ADComputerServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADComputerServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADDomainControllerPasswordReplicationPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${AllowedList},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${DeniedList},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADDomainControllerPasswordReplicationPolicy') `
                            -Arg ('Remove-ADDomainControllerPasswordReplicationPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADDomainControllerPasswordReplicationPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADFineGrainedPasswordPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADFineGrainedPasswordPolicy') `
                            -Arg ('Remove-ADFineGrainedPasswordPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADFineGrainedPasswordPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADFineGrainedPasswordPolicySubject' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Subjects},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADFineGrainedPasswordPolicySubject') `
                            -Arg ('Remove-ADFineGrainedPasswordPolicySubject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADFineGrainedPasswordPolicySubject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADGroup' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADGroup') `
                            -Arg ('Remove-ADGroup', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADGroup
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADGroupMember' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${DisablePermissiveModify},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Members},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADGroupMember') `
                            -Arg ('Remove-ADGroupMember', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADGroupMember
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADObject' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    [switch]
    ${Recursive},

    [switch]
    ${IncludeDeletedObjects},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADObject') `
                            -Arg ('Remove-ADObject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADObject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADOrganizationalUnit' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    [switch]
    ${Recursive},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADOrganizationalUnit') `
                            -Arg ('Remove-ADOrganizationalUnit', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADOrganizationalUnit
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADPrincipalGroupMembership' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${MemberOf},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADPrincipalGroupMembership') `
                            -Arg ('Remove-ADPrincipalGroupMembership', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADPrincipalGroupMembership
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADReplicationSite' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADReplicationSite') `
                            -Arg ('Remove-ADReplicationSite', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADReplicationSite
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADReplicationSiteLink' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADReplicationSiteLink') `
                            -Arg ('Remove-ADReplicationSiteLink', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADReplicationSiteLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADReplicationSiteLinkBridge' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADReplicationSiteLinkBridge') `
                            -Arg ('Remove-ADReplicationSiteLinkBridge', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADReplicationSiteLinkBridge
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADReplicationSubnet' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADReplicationSubnet') `
                            -Arg ('Remove-ADReplicationSubnet', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADReplicationSubnet
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADResourceProperty' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADResourceProperty') `
                            -Arg ('Remove-ADResourceProperty', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADResourceProperty
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADResourcePropertyList' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADResourcePropertyList') `
                            -Arg ('Remove-ADResourcePropertyList', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADResourcePropertyList
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADResourcePropertyListMember' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Members},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADResourcePropertyListMember') `
                            -Arg ('Remove-ADResourcePropertyListMember', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADResourcePropertyListMember
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADServiceAccount' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADServiceAccount') `
                            -Arg ('Remove-ADServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-ADUser' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-ADUser') `
                            -Arg ('Remove-ADUser', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-ADUser
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Rename-ADObject' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${NewName},

    [Alias('wa')]
    ${WarningAction},

    ${Partition},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Rename-ADObject') `
                            -Arg ('Rename-ADObject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Rename-ADObject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Reset-AdmPwdPassword' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${WhenEffective},

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

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${ComputerName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Reset-AdmPwdPassword') `
                            -Arg ('Reset-AdmPwdPassword', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Reset-AdmPwdPassword
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Reset-ADServiceAccountPassword' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Reset-ADServiceAccountPassword') `
                            -Arg ('Reset-ADServiceAccountPassword', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Reset-ADServiceAccountPassword
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Restore-ADObject' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${TargetPath},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${NewName},

    [Alias('wa')]
    ${WarningAction},

    ${Partition},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Restore-ADObject') `
                            -Arg ('Restore-ADObject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Restore-ADObject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Revoke-ADAuthenticationPolicySiloAccess' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Account},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Revoke-ADAuthenticationPolicySiloAccess') `
                            -Arg ('Revoke-ADAuthenticationPolicySiloAccess', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Revoke-ADAuthenticationPolicySiloAccess
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Search-ADAccount' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [switch]
    ${AccountInactive},

    ${DateTime},

    ${Server},

    ${ResultPageSize},

    ${AuthType},

    [switch]
    ${PasswordNeverExpires},

    [switch]
    ${AccountExpired},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeSpan},

    [switch]
    ${PasswordExpired},

    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${AccountExpiring},

    ${Credential},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ResultSetSize},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${SearchScope},

    [switch]
    ${AccountDisabled},

    [switch]
    ${UsersOnly},

    ${SearchBase},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${ComputersOnly},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    [switch]
    ${LockedOut},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Search-ADAccount') `
                            -Arg ('Search-ADAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Search-ADAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADAccountAuthenticationPolicySilo' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${AuthenticationPolicy},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${AuthenticationPolicySilo},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Identity},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADAccountAuthenticationPolicySilo') `
                            -Arg ('Set-ADAccountAuthenticationPolicySilo', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADAccountAuthenticationPolicySilo
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADAccountControl' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${TrustedForDelegation},

    ${TrustedToAuthForDelegation},

    ${PasswordNotRequired},

    ${Identity},

    ${Enabled},

    [Alias('ev')]
    ${ErrorVariable},

    ${PasswordNeverExpires},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${UseDESKeyOnly},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${CannotChangePassword},

    ${AuthType},

    [Alias('infa')]
    ${InformationAction},

    ${AccountNotDelegated},

    ${HomedirRequired},

    [Alias('ov')]
    ${OutVariable},

    ${Partition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${AllowReversiblePasswordEncryption},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${MNSLogonAccount},

    [Alias('ob')]
    ${OutBuffer},

    ${DoesNotRequirePreAuth},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADAccountControl') `
                            -Arg ('Set-ADAccountControl', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADAccountControl
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADAccountExpiration' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    ${DateTime},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    [switch]
    ${PassThru},

    ${TimeSpan},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADAccountExpiration') `
                            -Arg ('Set-ADAccountExpiration', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADAccountExpiration
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADAccountPassword' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${Reset},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${OldPassword},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${NewPassword},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADAccountPassword') `
                            -Arg ('Set-ADAccountPassword', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADAccountPassword
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADAuthenticationPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ComputerTGTLifetimeMins},

    ${Description},

    ${ServiceAllowedNTLMNetworkAuthentication},

    ${Identity},

    ${Replace},

    ${RollingNTLMSecret},

    ${Instance},

    ${UserAllowedToAuthenticateTo},

    ${Enforce},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${UserAllowedToAuthenticateFrom},

    ${UserTGTLifetimeMins},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    [Alias('ev')]
    ${ErrorVariable},

    ${AuthType},

    ${ServiceAllowedToAuthenticateTo},

    ${Add},

    ${ServiceTGTLifetimeMins},

    ${ServiceAllowedToAuthenticateFrom},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${ComputerAllowedToAuthenticateTo},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${UserAllowedNTLMNetworkAuthentication},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADAuthenticationPolicy') `
                            -Arg ('Set-ADAuthenticationPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADAuthenticationPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADAuthenticationPolicySilo' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${Identity},

    ${UserAuthenticationPolicy},

    ${Instance},

    ${Enforce},

    ${ComputerAuthenticationPolicy},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${ServiceAuthenticationPolicy},

    ${Credential},

    [Alias('ev')]
    ${ErrorVariable},

    ${AuthType},

    ${Add},

    [Alias('ov')]
    ${OutVariable},

    ${ProtectedFromAccidentalDeletion},

    ${Replace},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADAuthenticationPolicySilo') `
                            -Arg ('Set-ADAuthenticationPolicySilo', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADAuthenticationPolicySilo
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADCentralAccessPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Instance},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    ${Clear},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Replace},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ProtectedFromAccidentalDeletion},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Add},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADCentralAccessPolicy') `
                            -Arg ('Set-ADCentralAccessPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADCentralAccessPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADCentralAccessRule' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${Identity},

    ${CurrentAcl},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${Instance},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${ProposedAcl},

    ${AuthType},

    ${Add},

    [Alias('ov')]
    ${OutVariable},

    ${ProtectedFromAccidentalDeletion},

    ${Replace},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${ResourceCondition},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADCentralAccessRule') `
                            -Arg ('Set-ADCentralAccessRule', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADCentralAccessRule
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADClaimTransformLink' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Server},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    ${TrustRole},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Policy},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADClaimTransformLink') `
                            -Arg ('Set-ADClaimTransformLink', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADClaimTransformLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADClaimTransformPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${Identity},

    ${Replace},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${Rule},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${DenyAllExcept},

    [switch]
    ${DenyAll},

    ${Credential},

    ${AuthType},

    ${Add},

    [switch]
    ${AllowAll},

    ${ProtectedFromAccidentalDeletion},

    ${AllowAllExcept},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADClaimTransformPolicy') `
                            -Arg ('Set-ADClaimTransformPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADClaimTransformPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADClaimType' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${SuggestedValues},

    ${Description},

    ${Identity},

    ${Replace},

    ${DisplayName},

    ${Enabled},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${Add},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    ${AppliesToClasses},

    [switch]
    ${SourceTransformPolicy},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${SourceOID},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${RestrictValues},

    ${SourceAttribute},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADClaimType') `
                            -Arg ('Set-ADClaimType', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADClaimType
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADComputer' `
{
    param(
    
    ${Replace},

    [Alias('wa')]
    ${WarningAction},

    ${HomePage},

    ${TrustedForDelegation},

    ${Description},

    ${OperatingSystemServicePack},

    ${Identity},

    ${OperatingSystemHotfix},

    ${DisplayName},

    ${AuthenticationPolicy},

    ${Instance},

    ${KerberosEncryptionType},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Location},

    ${SAMAccountName},

    [Alias('wv')]
    ${WarningVariable},

    ${AccountExpirationDate},

    ${OperatingSystem},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${ServicePrincipalNames},

    ${Credential},

    ${CannotChangePassword},

    ${AuthType},

    ${PrincipalsAllowedToDelegateToAccount},

    ${Add},

    ${PasswordNeverExpires},

    ${AccountNotDelegated},

    ${PasswordNotRequired},

    ${UserPrincipalName},

    [Alias('ov')]
    ${OutVariable},

    ${Partition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${AuthenticationPolicySilo},

    ${AllowReversiblePasswordEncryption},

    ${Certificates},

    ${ChangePasswordAtLogon},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${OperatingSystemVersion},

    ${Enabled},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

    ${DNSHostName},

    ${CompoundIdentitySupported},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADComputer') `
                            -Arg ('Set-ADComputer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADComputer
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADDefaultDomainPasswordPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${LockoutObservationWindow},

    ${ComplexityEnabled},

    ${Identity},

    ${ReversibleEncryptionEnabled},

    ${MinPasswordLength},

    ${PasswordHistoryCount},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    ${LockoutDuration},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    [Alias('db')]
    [switch]
    ${Debug},

    ${MaxPasswordAge},

    [Alias('ov')]
    ${OutVariable},

    ${MinPasswordAge},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${LockoutThreshold},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADDefaultDomainPasswordPolicy') `
                            -Arg ('Set-ADDefaultDomainPasswordPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADDefaultDomainPasswordPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADDomain' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${PublicKeyRequiredPasswordRolling},

    ${LastLogonReplicationInterval},

    ${Identity},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${Add},

    [Alias('ov')]
    ${OutVariable},

    ${Replace},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

    ${AllowedDNSSuffixes},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADDomain') `
                            -Arg ('Set-ADDomain', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADDomain
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADDomainMode' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    ${DomainMode},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    [switch]
    ${PassThru},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADDomainMode') `
                            -Arg ('Set-ADDomainMode', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADDomainMode
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADFineGrainedPasswordPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${LockoutObservationWindow},

    ${ComplexityEnabled},

    ${Description},

    ${Identity},

    ${Replace},

    ${ReversibleEncryptionEnabled},

    ${DisplayName},

    ${MinPasswordLength},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    ${LockoutDuration},

    [Alias('wv')]
    ${WarningVariable},

    ${Precedence},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${Add},

    ${MaxPasswordAge},

    [Alias('ov')]
    ${OutVariable},

    ${MinPasswordAge},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${PasswordHistoryCount},

    [switch]
    ${PassThru},

    ${ProtectedFromAccidentalDeletion},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${LockoutThreshold},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADFineGrainedPasswordPolicy') `
                            -Arg ('Set-ADFineGrainedPasswordPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADFineGrainedPasswordPolicy
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADForest' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${UPNSuffixes},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    ${SPNSuffixes},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADForest') `
                            -Arg ('Set-ADForest', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADForest
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADForestMode' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${ForestMode},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADForestMode') `
                            -Arg ('Set-ADForestMode', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADForestMode
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADGroup' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Clear},

    ${Description},

    ${Identity},

    ${Replace},

    ${DisplayName},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${SamAccountName},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${Add},

    [Alias('ov')]
    ${OutVariable},

    ${Partition},

    ${GroupScope},

    ${GroupCategory},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${HomePage},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADGroup') `
                            -Arg ('Set-ADGroup', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADGroup
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-AdmPwdAuditing' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

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

    ${AuditType},

    ${AuditedPrincipals},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('OrgUnit')]
    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-AdmPwdAuditing') `
                            -Arg ('Set-AdmPwdAuditing', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-AdmPwdAuditing
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-AdmPwdComputerSelfPermission' `
{
    param(
    
    [Alias('wv')]
    ${WarningVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ov')]
    ${OutVariable},

    [Alias('OrgUnit')]
    ${Identity},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-AdmPwdComputerSelfPermission') `
                            -Arg ('Set-AdmPwdComputerSelfPermission', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-AdmPwdComputerSelfPermission
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-AdmPwdReadPasswordPermission' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${AllowedPrincipals},

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

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('OrgUnit')]
    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-AdmPwdReadPasswordPermission') `
                            -Arg ('Set-AdmPwdReadPasswordPermission', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-AdmPwdReadPasswordPermission
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-AdmPwdResetPasswordPermission' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${AllowedPrincipals},

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

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('OrgUnit')]
    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-AdmPwdResetPasswordPermission') `
                            -Arg ('Set-AdmPwdResetPasswordPermission', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-AdmPwdResetPasswordPermission
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADObject' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${Identity},

    ${DisplayName},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${Add},

    [Alias('ov')]
    ${OutVariable},

    ${ProtectedFromAccidentalDeletion},

    ${Replace},

    ${Partition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADObject') `
                            -Arg ('Set-ADObject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADObject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADOrganizationalUnit' `
{
    param(
    
    ${PostalCode},

    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${Identity},

    ${Replace},

    ${DisplayName},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${City},

    ${Credential},

    ${AuthType},

    ${Add},

    ${Country},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    ${Partition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${StreetAddress},

    [switch]
    ${PassThru},

    ${State},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADOrganizationalUnit') `
                            -Arg ('Set-ADOrganizationalUnit', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADOrganizationalUnit
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADReplicationConnection' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Instance},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    ${Clear},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Replace},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ReplicateFromDirectoryServer},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Add},

    [Alias('wa')]
    ${WarningAction},

    ${ReplicationSchedule},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADReplicationConnection') `
                            -Arg ('Set-ADReplicationConnection', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADReplicationConnection
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADReplicationSite' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${TopologyMinimumHopsEnabled},

    ${Description},

    ${Identity},

    ${Replace},

    ${WindowsServer2003KCCIgnoreScheduleEnabled},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    ${InterSiteTopologyGenerator},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ScheduleHashingEnabled},

    ${AutomaticTopologyGenerationEnabled},

    ${WindowsServer2000KCCISTGSelectionBehaviorEnabled},

    [Alias('wv')]
    ${WarningVariable},

    ${WindowsServer2003KCCBehaviorEnabled},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${WindowsServer2000BridgeheadSelectionMethodEnabled},

    ${Credential},

    ${TopologyDetectStaleEnabled},

    ${AuthType},

    ${RedundantServerTopologyEnabled},

    ${ReplicationSchedule},

    ${Add},

    ${TopologyCleanupEnabled},

    ${WindowsServer2003KCCSiteLinkBridgingEnabled},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${UniversalGroupCachingRefreshSite},

    [switch]
    ${PassThru},

    ${AutomaticInterSiteTopologyGenerationEnabled},

    [Alias('pv')]
    ${PipelineVariable},

    ${ManagedBy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${UniversalGroupCachingEnabled},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADReplicationSite') `
                            -Arg ('Set-ADReplicationSite', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADReplicationSite
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADReplicationSiteLink' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${Identity},

    ${SitesIncluded},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${Cost},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${ReplicationSchedule},

    ${Add},

    [Alias('ov')]
    ${OutVariable},

    ${Replace},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

    ${ReplicationFrequencyInMinutes},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADReplicationSiteLink') `
                            -Arg ('Set-ADReplicationSiteLink', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADReplicationSiteLink
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADReplicationSiteLinkBridge' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Instance},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    ${Clear},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Replace},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    ${SiteLinksIncluded},

    [Alias('ob')]
    ${OutBuffer},

    ${Add},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADReplicationSiteLinkBridge') `
                            -Arg ('Set-ADReplicationSiteLinkBridge', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADReplicationSiteLinkBridge
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADReplicationSubnet' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Instance},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    ${Clear},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Replace},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Site},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Add},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Location},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADReplicationSubnet') `
                            -Arg ('Set-ADReplicationSubnet', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADReplicationSubnet
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADResourceProperty' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${SuggestedValues},

    ${SharesValuesWith},

    ${Description},

    ${Identity},

    ${Replace},

    ${DisplayName},

    ${Enabled},

    ${Instance},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Credential},

    ${AuthType},

    ${Add},

    ${AppliesToResourceTypes},

    ${ProtectedFromAccidentalDeletion},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADResourceProperty') `
                            -Arg ('Set-ADResourceProperty', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADResourceProperty
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADResourcePropertyList' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Instance},

    ${Description},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    ${Clear},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Replace},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ProtectedFromAccidentalDeletion},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Add},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

    ${Remove},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADResourcePropertyList') `
                            -Arg ('Set-ADResourcePropertyList', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADResourcePropertyList
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADServiceAccount' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${HomePage},

    ${TrustedForDelegation},

    ${Description},

    ${Identity},

    ${Replace},

    ${DisplayName},

    ${AuthenticationPolicy},

    ${Instance},

    ${KerberosEncryptionType},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${SamAccountName},

    [Alias('wv')]
    ${WarningVariable},

    ${AccountExpirationDate},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${ServicePrincipalNames},

    ${Credential},

    ${AuthType},

    ${PrincipalsAllowedToDelegateToAccount},

    ${Add},

    ${AccountNotDelegated},

    ${PrincipalsAllowedToRetrieveManagedPassword},

    [Alias('ov')]
    ${OutVariable},

    ${Partition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${AuthenticationPolicySilo},

    ${Certificates},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${Enabled},

    [Alias('ob')]
    ${OutBuffer},

    ${Clear},

    [Alias('iv')]
    ${InformationVariable},

    ${Server},

    ${Remove},

    ${DNSHostName},

    ${CompoundIdentitySupported},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADServiceAccount') `
                            -Arg ('Set-ADServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-ADUser' `
{
    param(
    
    ${ServicePrincipalNames},

    ${Initials},

    ${Organization},

    ${AuthenticationPolicy},

    ${Department},

    [Alias('wa')]
    ${WarningAction},

    ${PasswordNotRequired},

    ${Country},

    ${Company},

    ${CannotChangePassword},

    ${Clear},

    ${Fax},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${HomeDirectory},

    ${SamAccountName},

    ${UserPrincipalName},

    ${OfficePhone},

    ${ScriptPath},

    ${GivenName},

    [Alias('ov')]
    ${OutVariable},

    ${HomePage},

    ${Replace},

    ${PrincipalsAllowedToDelegateToAccount},

    ${ProfilePath},

    [Alias('db')]
    [switch]
    ${Debug},

    ${DisplayName},

    [Alias('pv')]
    ${PipelineVariable},

    ${Credential},

    ${SmartcardLogonRequired},

    ${Enabled},

    ${HomeDrive},

    [Alias('iv')]
    ${InformationVariable},

    ${Description},

    ${LogonWorkstations},

    [Alias('infa')]
    ${InformationAction},

    ${AccountExpirationDate},

    ${Manager},

    ${Surname},

    ${KerberosEncryptionType},

    ${EmailAddress},

    ${PostalCode},

    ${Add},

    ${POBox},

    [switch]
    ${PassThru},

    ${AuthenticationPolicySilo},

    ${Division},

    ${StreetAddress},

    ${CompoundIdentitySupported},

    ${Partition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Certificates},

    ${MobilePhone},

    ${Title},

    ${Office},

    [Alias('wv')]
    ${WarningVariable},

    ${City},

    ${AuthType},

    ${Remove},

    [Alias('ea')]
    ${ErrorAction},

    ${State},

    ${Server},

    ${AllowReversiblePasswordEncryption},

    ${HomePhone},

    ${PasswordNeverExpires},

    ${OtherName},

    ${AccountNotDelegated},

    ${TrustedForDelegation},

    ${EmployeeID},

    ${ChangePasswordAtLogon},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Instance},

    ${EmployeeNumber},

    [Alias('ev')]
    ${ErrorVariable},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-ADUser') `
                            -Arg ('Set-ADUser', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-ADUser
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Show-ADAuthenticationPolicyExpression' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${AllowedToAuthenticateFrom},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${AllowedToAuthenticateTo},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${SDDL},

    [Alias('ev')]
    ${ErrorVariable},

    ${Title},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Show-ADAuthenticationPolicyExpression') `
                            -Arg ('Show-ADAuthenticationPolicyExpression', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Show-ADAuthenticationPolicyExpression
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Sync-ADObject' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    ${Source},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('Server','HostName','IPv4Address')]
    ${Destination},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${Credential},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ev')]
    ${ErrorVariable},

    ${Object},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [switch]
    ${PassThru},

    [switch]
    ${PasswordOnly},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Sync-ADObject') `
                            -Arg ('Sync-ADObject', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Sync-ADObject
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Test-ADServiceAccount' `
{
    param(
    
    ${AuthType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Test-ADServiceAccount') `
                            -Arg ('Test-ADServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Test-ADServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Uninstall-ADServiceAccount' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${ForceRemoveLocal},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Uninstall-ADServiceAccount') `
                            -Arg ('Uninstall-ADServiceAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Uninstall-ADServiceAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Unlock-ADAccount' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Credential},

    ${AuthType},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Identity},

    [Alias('ob')]
    ${OutBuffer},

    ${Partition},

    [Alias('wa')]
    ${WarningAction},

    ${Server},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Unlock-ADAccount') `
                            -Arg ('Unlock-ADAccount', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Unlock-ADAccount
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Update-AdmPwdADSchema' `
{
    param(
    
    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Update-AdmPwdADSchema') `
                            -Arg ('Update-AdmPwdADSchema', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Update-AdmPwdADSchema
    # .ForwardHelpCategory Cmdlet
    # .RemoteHelpRunspace PSSession
}
        
##############################################################################

& $script:ExportModuleMember -Function @('Add-ADCentralAccessPolicyMember', 'Add-ADComputerServiceAccount', 'Add-ADDomainControllerPasswordReplicationPolicy', 'Add-ADFineGrainedPasswordPolicySubject', 'Add-ADGroupMember', 'Add-ADPrincipalGroupMembership', 'Add-ADResourcePropertyListMember', 'Clear-ADAccountExpiration', 'Clear-ADClaimTransformLink', 'Disable-ADAccount', 'Disable-ADOptionalFeature', 'Enable-ADAccount', 'Enable-ADOptionalFeature', 'Find-AdmPwdExtendedRights', 'Get-ADAccountAuthorizationGroup', 'Get-ADAccountResultantPasswordReplicationPolicy', 'Get-ADAuthenticationPolicy', 'Get-ADAuthenticationPolicySilo', 'Get-ADCentralAccessPolicy', 'Get-ADCentralAccessRule', 'Get-ADClaimTransformPolicy', 'Get-ADClaimType', 'Get-ADComputer', 'Get-ADComputerServiceAccount', 'Get-ADDCCloningExcludedApplicationList', 'Get-ADDefaultDomainPasswordPolicy', 'Get-ADDomain', 'Get-ADDomainController', 'Get-ADDomainControllerPasswordReplicationPolicy', 'Get-ADDomainControllerPasswordReplicationPolicyUsage', 'Get-ADFineGrainedPasswordPolicy', 'Get-ADFineGrainedPasswordPolicySubject', 'Get-ADForest', 'Get-ADGroup', 'Get-ADGroupMember', 'Get-AdmPwdPassword', 'Get-ADObject', 'Get-ADOptionalFeature', 'Get-ADOrganizationalUnit', 'Get-ADPrincipalGroupMembership', 'Get-ADReplicationAttributeMetadata', 'Get-ADReplicationConnection', 'Get-ADReplicationFailure', 'Get-ADReplicationPartnerMetadata', 'Get-ADReplicationQueueOperation', 'Get-ADReplicationSite', 'Get-ADReplicationSiteLink', 'Get-ADReplicationSiteLinkBridge', 'Get-ADReplicationSubnet', 'Get-ADReplicationUpToDatenessVectorTable', 'Get-ADResourceProperty', 'Get-ADResourcePropertyList', 'Get-ADResourcePropertyValueType', 'Get-ADRootDSE', 'Get-ADServiceAccount', 'Get-ADTrust', 'Get-ADUser', 'Get-ADUserResultantPasswordPolicy', 'Grant-ADAuthenticationPolicySiloAccess', 'Install-ADServiceAccount', 'Move-ADDirectoryServer', 'Move-ADDirectoryServerOperationMasterRole', 'Move-ADObject', 'New-ADAuthenticationPolicy', 'New-ADAuthenticationPolicySilo', 'New-ADCentralAccessPolicy', 'New-ADCentralAccessRule', 'New-ADClaimTransformPolicy', 'New-ADClaimType', 'New-ADComputer', 'New-ADDCCloneConfigFile', 'New-ADFineGrainedPasswordPolicy', 'New-ADGroup', 'New-ADObject', 'New-ADOrganizationalUnit', 'New-ADReplicationSite', 'New-ADReplicationSiteLink', 'New-ADReplicationSiteLinkBridge', 'New-ADReplicationSubnet', 'New-ADResourceProperty', 'New-ADResourcePropertyList', 'New-ADServiceAccount', 'New-ADUser', 'Remove-ADAuthenticationPolicy', 'Remove-ADAuthenticationPolicySilo', 'Remove-ADCentralAccessPolicy', 'Remove-ADCentralAccessPolicyMember', 'Remove-ADCentralAccessRule', 'Remove-ADClaimTransformPolicy', 'Remove-ADClaimType', 'Remove-ADComputer', 'Remove-ADComputerServiceAccount', 'Remove-ADDomainControllerPasswordReplicationPolicy', 'Remove-ADFineGrainedPasswordPolicy', 'Remove-ADFineGrainedPasswordPolicySubject', 'Remove-ADGroup', 'Remove-ADGroupMember', 'Remove-ADObject', 'Remove-ADOrganizationalUnit', 'Remove-ADPrincipalGroupMembership', 'Remove-ADReplicationSite', 'Remove-ADReplicationSiteLink', 'Remove-ADReplicationSiteLinkBridge', 'Remove-ADReplicationSubnet', 'Remove-ADResourceProperty', 'Remove-ADResourcePropertyList', 'Remove-ADResourcePropertyListMember', 'Remove-ADServiceAccount', 'Remove-ADUser', 'Rename-ADObject', 'Reset-AdmPwdPassword', 'Reset-ADServiceAccountPassword', 'Restore-ADObject', 'Revoke-ADAuthenticationPolicySiloAccess', 'Search-ADAccount', 'Set-ADAccountAuthenticationPolicySilo', 'Set-ADAccountControl', 'Set-ADAccountExpiration', 'Set-ADAccountPassword', 'Set-ADAuthenticationPolicy', 'Set-ADAuthenticationPolicySilo', 'Set-ADCentralAccessPolicy', 'Set-ADCentralAccessRule', 'Set-ADClaimTransformLink', 'Set-ADClaimTransformPolicy', 'Set-ADClaimType', 'Set-ADComputer', 'Set-ADDefaultDomainPasswordPolicy', 'Set-ADDomain', 'Set-ADDomainMode', 'Set-ADFineGrainedPasswordPolicy', 'Set-ADForest', 'Set-ADForestMode', 'Set-ADGroup', 'Set-AdmPwdAuditing', 'Set-AdmPwdComputerSelfPermission', 'Set-AdmPwdReadPasswordPermission', 'Set-AdmPwdResetPasswordPermission', 'Set-ADObject', 'Set-ADOrganizationalUnit', 'Set-ADReplicationConnection', 'Set-ADReplicationSite', 'Set-ADReplicationSiteLink', 'Set-ADReplicationSiteLinkBridge', 'Set-ADReplicationSubnet', 'Set-ADResourceProperty', 'Set-ADResourcePropertyList', 'Set-ADServiceAccount', 'Set-ADUser', 'Show-ADAuthenticationPolicyExpression', 'Sync-ADObject', 'Test-ADServiceAccount', 'Uninstall-ADServiceAccount', 'Unlock-ADAccount', 'Update-AdmPwdADSchema')
        
##############################################################################

& $script:ExportModuleMember -Alias @()
        
