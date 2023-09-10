
<#
 # Implicit remoting module
 # generated on 12/16/2020 7:53:45 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\DNS" -Session (get-pssession -Name WinRM6) -CommandName "*-DNSServer*" -AllowClobber -Force
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
                -InstanceId 3f60f084-4eee-4bca-ba5a-7d40a3a5ff45 `
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
                    -ComputerName $ImplicitDNS `
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

& $script:SetItem 'function:script:Export-DnsServerDnsSecPublicKey' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    ${DigestType},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('TrustPointName','TrustAnchorName')]
    ${ZoneName},

    [switch]
    ${NoClobber},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${UnAuthenticated},

    ${Path},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Export-DnsServerDnsSecPublicKey') `
                            -Arg ('Export-DnsServerDnsSecPublicKey', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Export-DnsServerDnsSecPublicKey
    # .ForwardHelpCategory Alias
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerResponseRateLimiting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerResponseRateLimiting') `
                            -Arg ('Get-DnsServerResponseRateLimiting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerResponseRateLimiting
    # .ForwardHelpCategory Alias
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerResponseRateLimiting' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ResponsesPerSec},

    ${WindowInSec},

    ${MaximumResponsesPerWindow},

    ${TruncateRate},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${Force},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${IPv4PrefixLength},

    [Alias('Session')]
    ${CimSession},

    ${IPv6PrefixLength},

    ${ThrottleLimit},

    [Alias('iv')]
    ${InformationVariable},

    ${LeakRate},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [switch]
    ${ResetToDefault},

    [Alias('ev')]
    ${ErrorVariable},

    ${ErrorsPerSec},

    ${Mode},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerResponseRateLimiting') `
                            -Arg ('Set-DnsServerResponseRateLimiting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerResponseRateLimiting
    # .ForwardHelpCategory Alias
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerClientSubnet' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${IPv4Subnet},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${IPv6Subnet},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerClientSubnet') `
                            -Arg ('Add-DnsServerClientSubnet', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerClientSubnet
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerConditionalForwarderZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    ${ForwarderTimeout},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${LoadExisting},

    [Alias('ob')]
    ${OutBuffer},

    ${DirectoryPartitionName},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${MasterServers},

    [Alias('ev')]
    ${ErrorVariable},

    ${ReplicationScope},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${UseRecursion},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerConditionalForwarderZone') `
                            -Arg ('Add-DnsServerConditionalForwarderZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerConditionalForwarderZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerDirectoryPartition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('DirectoryPartitionName')]
    ${Name},

    ${Type},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerDirectoryPartition') `
                            -Arg ('Add-DnsServerDirectoryPartition', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerDirectoryPartition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerForwarder' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerForwarder') `
                            -Arg ('Add-DnsServerForwarder', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerForwarder
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerPrimaryZone' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('ob')]
    ${OutBuffer},

    ${ResponsiblePerson},

    [Alias('ZoneName')]
    ${Name},

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

    ${ZoneFile},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    ${ReplicationScope},

    [Alias('ov')]
    ${OutVariable},

    ${DirectoryPartitionName},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${LoadExisting},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${NetworkId},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    ${DynamicUpdate},

    [switch]
    ${AsJob},

    ${VirtualizationInstance})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerPrimaryZone') `
                            -Arg ('Add-DnsServerPrimaryZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerPrimaryZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerQueryResolutionPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${InternetProtocol},

    ${Fqdn},

    ${Action},

    ${RecursionScope},

    ${ZoneScope},

    [switch]
    ${Disable},

    ${InputObject},

    [Alias('infa')]
    ${InformationAction},

    ${ServerInterfaceIP},

    ${ProcessingOrder},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeOfDay},

    ${ClientSubnet},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Name},

    [Alias('Session')]
    ${CimSession},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('ov')]
    ${OutVariable},

    ${QType},

    [Alias('Cn')]
    ${ComputerName},

    ${TransportProtocol},

    ${Condition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [switch]
    ${ApplyOnRecursion},

    ${ECS},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerQueryResolutionPolicy') `
                            -Arg ('Add-DnsServerQueryResolutionPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerQueryResolutionPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerRecursionScope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${EnableRecursion},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Forwarder},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerRecursionScope') `
                            -Arg ('Add-DnsServerRecursionScope', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerRecursionScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResourceRecord' `
{
    param(
    
    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wa')]
    ${WarningAction},

    ${Type},

    ${InternetAddress},

    [switch]
    ${AgeRecord},

    ${IsdnSubAddress},

    [switch]
    ${RT},

    [switch]
    ${AAAA},

    ${Service},

    ${VirtualizationInstance},

    ${ZoneScope},

    ${ThrottleLimit},

    [switch]
    ${Atma},

    ${ZoneName},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${SubType},

    [switch]
    ${Ptr},

    ${LookupTimeout},

    ${Priority},

    ${CertificateAssociationData},

    [switch]
    ${Txt},

    [switch]
    ${AllowUpdateAny},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ea')]
    ${ErrorAction},

    [switch]
    ${DhcId},

    [Alias('db')]
    [switch]
    ${Debug},

    ${CacheTimeout},

    ${IPv4Address},

    ${Port},

    [switch]
    ${NS},

    [switch]
    ${CName},

    [switch]
    ${CreatePtr},

    ${PtrDomainName},

    ${DomainNameAlias},

    [switch]
    ${DName},

    ${MailExchange},

    [switch]
    ${AsJob},

    [switch]
    ${X25},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${A},

    ${InternetProtocol},

    ${Description},

    ${MatchingType},

    [switch]
    ${Wins},

    [switch]
    ${RP},

    ${ResultDomain},

    [Alias('ob')]
    ${OutBuffer},

    ${AddressType},

    [switch]
    ${TLSA},

    ${TimeToLive},

    ${ResponsiblePerson},

    ${Preference},

    [switch]
    ${HInfo},

    [switch]
    ${PassThru},

    [switch]
    ${Wks},

    ${DomainName},

    ${Weight},

    [switch]
    ${WinsR},

    ${DhcpIdentifier},

    ${PsdnAddress},

    [Alias('pv')]
    ${PipelineVariable},

    ${NameServer},

    [switch]
    ${Srv},

    ${OperatingSystem},

    ${Selector},

    [switch]
    ${Isdn},

    ${IPv6Address},

    ${CertificateUsage},

    ${IsdnNumber},

    ${Address},

    [Alias('wv')]
    ${WarningVariable},

    ${WinsServers},

    [Alias('infa')]
    ${InformationAction},

    ${DescriptiveText},

    [switch]
    ${Replicate},

    ${Cpu},

    [switch]
    ${Force},

    ${RecordData},

    ${Name},

    [switch]
    ${Afsdb},

    [Alias('Session')]
    ${CimSession},

    ${IntermediateHost},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${ServerName},

    ${InputObject},

    ${HostNameAlias},

    [switch]
    ${MX},

    [Alias('ev')]
    ${ErrorVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResourceRecord') `
                            -Arg ('Add-DnsServerResourceRecord', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResourceRecord
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResourceRecordA' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ZoneScope},

    [switch]
    ${AgeRecord},

    [Alias('IpAddress')]
    ${IPv4Address},

    [Alias('DeviceName')]
    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeToLive},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${CreatePtr},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn','ForwardLookupPrimaryServer')]
    ${ComputerName},

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

    [switch]
    ${AllowUpdateAny},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${VirtualizationInstance},

    [Alias('ForwardLookupZone')]
    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResourceRecordA') `
                            -Arg ('Add-DnsServerResourceRecordA', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResourceRecordA
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResourceRecordAAAA' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ZoneScope},

    [switch]
    ${AgeRecord},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeToLive},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${CreatePtr},

    [Alias('Session')]
    ${CimSession},

    ${IPv6Address},

    [Alias('Cn')]
    ${ComputerName},

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

    [switch]
    ${AllowUpdateAny},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${VirtualizationInstance},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResourceRecordAAAA') `
                            -Arg ('Add-DnsServerResourceRecordAAAA', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResourceRecordAAAA
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResourceRecordCName' `
{
    param(
    
    ${VirtualizationInstance},

    ${TimeToLive},

    ${ZoneScope},

    [Alias('RecordName')]
    ${Name},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Session')]
    ${CimSession},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${AgeRecord},

    ${HostNameAlias},

    [switch]
    ${AllowUpdateAny},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResourceRecordCName') `
                            -Arg ('Add-DnsServerResourceRecordCName', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResourceRecordCName
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResourceRecordDnsKey' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ZoneScope},

    [switch]
    ${AgeRecord},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${ZoneKey},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeToLive},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${ThrottleLimit},

    ${CryptoAlgorithm},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    ${Base64Data},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    [switch]
    ${SecureEntryPoint},

    [switch]
    ${AsJob},

    ${KeyProtocol},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResourceRecordDnsKey') `
                            -Arg ('Add-DnsServerResourceRecordDnsKey', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResourceRecordDnsKey
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResourceRecordDS' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${KeyTag},

    ${ZoneScope},

    [switch]
    ${AgeRecord},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    ${DigestType},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeToLive},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${CryptoAlgorithm},

    [Alias('infa')]
    ${InformationAction},

    [Alias('Cn')]
    ${ComputerName},

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

    ${Digest},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResourceRecordDS') `
                            -Arg ('Add-DnsServerResourceRecordDS', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResourceRecordDS
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResourceRecordMX' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ZoneScope},

    [switch]
    ${AgeRecord},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeToLive},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${MailExchange},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [switch]
    ${AllowUpdateAny},

    ${Preference},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${VirtualizationInstance},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResourceRecordMX') `
                            -Arg ('Add-DnsServerResourceRecordMX', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResourceRecordMX
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResourceRecordPtr' `
{
    param(
    
    ${VirtualizationInstance},

    ${TimeToLive},

    ${ZoneScope},

    [Alias('RecordName')]
    ${Name},

    ${PtrDomainName},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Session')]
    ${CimSession},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${AgeRecord},

    [switch]
    ${AllowUpdateAny},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResourceRecordPtr') `
                            -Arg ('Add-DnsServerResourceRecordPtr', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResourceRecordPtr
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerResponseRateLimitingExceptionlist' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    ${Condition},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    ${ServerInterfaceIP},

    ${ClientSubnet},

    ${Fqdn},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerResponseRateLimitingExceptionlist') `
                            -Arg ('Add-DnsServerResponseRateLimitingExceptionlist', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerResponseRateLimitingExceptionlist
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerRootHint' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${InputObject},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NameServer},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerRootHint') `
                            -Arg ('Add-DnsServerRootHint', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerRootHint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerSecondaryZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ZoneName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${LoadExisting},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${MasterServers},

    ${ZoneFile},

    [Alias('Session')]
    ${CimSession},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    ${NetworkId},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerSecondaryZone') `
                            -Arg ('Add-DnsServerSecondaryZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerSecondaryZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerSigningKey' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${StoreKeysInAD},

    [Alias('KeyType')]
    ${Type},

    ${RolloverPeriod},

    ${ZoneName},

    ${ZoneSignatureValidityPeriod},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${DnsKeySignatureValidityPeriod},

    ${NextKey},

    [Alias('ea')]
    ${ErrorAction},

    ${ActiveKey},

    [Alias('Session')]
    ${CimSession},

    ${CryptoAlgorithm},

    [Alias('Cn')]
    ${ComputerName},

    ${KeyLength},

    [Alias('ov')]
    ${OutVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${KeyStorageProvider},

    [Alias('iv')]
    ${InformationVariable},

    ${StandbyKey},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${InitialRolloverOffset},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${DSSignatureValidityPeriod})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerSigningKey') `
                            -Arg ('Add-DnsServerSigningKey', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerSigningKey
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerStubZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${LoadExisting},

    [Alias('ob')]
    ${OutBuffer},

    ${DirectoryPartitionName},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${MasterServers},

    ${ZoneFile},

    ${ReplicationScope},

    [Alias('Cn')]
    ${ComputerName},

    ${NetworkId},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerStubZone') `
                            -Arg ('Add-DnsServerStubZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerStubZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerTrustAnchor' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${KeyTag},

    [Alias('Session')]
    ${CimSession},

    ${Base64Data},

    [switch]
    ${AsJob},

    [switch]
    ${PassThru},

    ${CryptoAlgorithm},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('TrustAnchorName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    ${Digest},

    [switch]
    ${Root},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    ${DigestType},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${KeyProtocol},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerTrustAnchor') `
                            -Arg ('Add-DnsServerTrustAnchor', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerTrustAnchor
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerVirtualizationInstance' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('VirtualizationInstance')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    ${FriendlyName},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerVirtualizationInstance') `
                            -Arg ('Add-DnsServerVirtualizationInstance', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerVirtualizationInstance
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerZoneDelegation' `
{
    param(
    
    ${VirtualizationInstance},

    [Alias('iv')]
    ${InformationVariable},

    ${InputObject},

    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ChildZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NameServer},

    ${ZoneScope},

    [Alias('ea')]
    ${ErrorAction})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerZoneDelegation') `
                            -Arg ('Add-DnsServerZoneDelegation', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerZoneDelegation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerZoneScope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneScope')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${LoadExisting},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerZoneScope') `
                            -Arg ('Add-DnsServerZoneScope', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerZoneScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DnsServerZoneTransferPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${InternetProtocol},

    ${Action},

    [switch]
    ${Disable},

    ${InputObject},

    [Alias('infa')]
    ${InformationAction},

    ${ServerInterfaceIP},

    ${ProcessingOrder},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeOfDay},

    ${ClientSubnet},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Name},

    [Alias('Session')]
    ${CimSession},

    [Alias('ov')]
    ${OutVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('Cn')]
    ${ComputerName},

    ${TransportProtocol},

    ${Condition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DnsServerZoneTransferPolicy') `
                            -Arg ('Add-DnsServerZoneTransferPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Add-DnsServerZoneTransferPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Clear-DnsServerCache' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${CacheScope},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Clear-DnsServerCache') `
                            -Arg ('Clear-DnsServerCache', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Clear-DnsServerCache
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Clear-DnsServerStatistics' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Clear-DnsServerStatistics') `
                            -Arg ('Clear-DnsServerStatistics', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Clear-DnsServerStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:ConvertTo-DnsServerPrimaryZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ZoneName')]
    ${Name},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${LoadExisting},

    [Alias('ob')]
    ${OutBuffer},

    ${DirectoryPartitionName},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('wv')]
    ${WarningVariable},

    ${ZoneFile},

    [Alias('Session')]
    ${CimSession},

    ${ReplicationScope},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'ConvertTo-DnsServerPrimaryZone') `
                            -Arg ('ConvertTo-DnsServerPrimaryZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName ConvertTo-DnsServerPrimaryZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:ConvertTo-DnsServerSecondaryZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${MasterServers},

    ${ZoneFile},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'ConvertTo-DnsServerSecondaryZone') `
                            -Arg ('ConvertTo-DnsServerSecondaryZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName ConvertTo-DnsServerSecondaryZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disable-DnsServerPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    ${Level},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disable-DnsServerPolicy') `
                            -Arg ('Disable-DnsServerPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Disable-DnsServerPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disable-DnsServerSigningKeyRollover' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${KeyId},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disable-DnsServerSigningKeyRollover') `
                            -Arg ('Disable-DnsServerSigningKeyRollover', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Disable-DnsServerSigningKeyRollover
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Enable-DnsServerPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    ${Level},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Enable-DnsServerPolicy') `
                            -Arg ('Enable-DnsServerPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Enable-DnsServerPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Enable-DnsServerSigningKeyRollover' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${KeyId},

    ${RolloverPeriod},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${InitialRolloverOffset},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Enable-DnsServerSigningKeyRollover') `
                            -Arg ('Enable-DnsServerSigningKeyRollover', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Enable-DnsServerSigningKeyRollover
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Export-DnsServerZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${FileName},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Export-DnsServerZone') `
                            -Arg ('Export-DnsServerZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Export-DnsServerZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServer') `
                            -Arg ('Get-DnsServer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerCache' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerCache') `
                            -Arg ('Get-DnsServerCache', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerCache
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerClientSubnet' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerClientSubnet') `
                            -Arg ('Get-DnsServerClientSubnet', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerClientSubnet
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerDiagnostics' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerDiagnostics') `
                            -Arg ('Get-DnsServerDiagnostics', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerDiagnostics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerDirectoryPartition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('DirectoryPartitionName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${Custom},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerDirectoryPartition') `
                            -Arg ('Get-DnsServerDirectoryPartition', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerDirectoryPartition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerDnsSecZoneSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${IncludeKSKMetadata},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${SigningMetadata},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerDnsSecZoneSetting') `
                            -Arg ('Get-DnsServerDnsSecZoneSetting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerDnsSecZoneSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerDsSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerDsSetting') `
                            -Arg ('Get-DnsServerDsSetting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerDsSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerEDns' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerEDns') `
                            -Arg ('Get-DnsServerEDns', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerEDns
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerForwarder' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerForwarder') `
                            -Arg ('Get-DnsServerForwarder', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerForwarder
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerGlobalNameZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerGlobalNameZone') `
                            -Arg ('Get-DnsServerGlobalNameZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerGlobalNameZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerGlobalQueryBlockList' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerGlobalQueryBlockList') `
                            -Arg ('Get-DnsServerGlobalQueryBlockList', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerGlobalQueryBlockList
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerQueryResolutionPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerQueryResolutionPolicy') `
                            -Arg ('Get-DnsServerQueryResolutionPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerQueryResolutionPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerRecursion' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerRecursion') `
                            -Arg ('Get-DnsServerRecursion', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerRecursion
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerRecursionScope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerRecursionScope') `
                            -Arg ('Get-DnsServerRecursionScope', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerRecursionScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerResourceRecord' `
{
    param(
    
    ${VirtualizationInstance},

    [Alias('iv')]
    ${InformationVariable},

    ${ZoneScope},

    [Alias('Session')]
    ${CimSession},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${Node},

    [Alias('ForwardLookupZone')]
    ${ZoneName},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${Type},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${RRType},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn','ForwardLookupPrimaryServer')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerResourceRecord') `
                            -Arg ('Get-DnsServerResourceRecord', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerResourceRecord
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerResponseRateLimitingExceptionlist' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerResponseRateLimitingExceptionlist') `
                            -Arg ('Get-DnsServerResponseRateLimitingExceptionlist', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerResponseRateLimitingExceptionlist
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerRootHint' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerRootHint') `
                            -Arg ('Get-DnsServerRootHint', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerRootHint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerScavenging' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerScavenging') `
                            -Arg ('Get-DnsServerScavenging', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerScavenging
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerSetting') `
                            -Arg ('Get-DnsServerSetting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerSigningKey' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${KeyId},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerSigningKey') `
                            -Arg ('Get-DnsServerSigningKey', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerSigningKey
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerStatistics' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [switch]
    ${Clear},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerStatistics') `
                            -Arg ('Get-DnsServerStatistics', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerTrustAnchor' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('TrustAnchorName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerTrustAnchor') `
                            -Arg ('Get-DnsServerTrustAnchor', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerTrustAnchor
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerTrustPoint' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('TrustPointName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerTrustPoint') `
                            -Arg ('Get-DnsServerTrustPoint', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerTrustPoint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerVirtualizationInstance' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('VirtualizationInstance')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerVirtualizationInstance') `
                            -Arg ('Get-DnsServerVirtualizationInstance', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerVirtualizationInstance
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerZone' `
{
    param(
    
    ${VirtualizationInstance},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerZone') `
                            -Arg ('Get-DnsServerZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerZoneAging' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerZoneAging') `
                            -Arg ('Get-DnsServerZoneAging', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerZoneAging
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerZoneDelegation' `
{
    param(
    
    ${VirtualizationInstance},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    ${ChildZoneName},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${ZoneScope},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerZoneDelegation') `
                            -Arg ('Get-DnsServerZoneDelegation', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerZoneDelegation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerZoneScope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneScope')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerZoneScope') `
                            -Arg ('Get-DnsServerZoneScope', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerZoneScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DnsServerZoneTransferPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DnsServerZoneTransferPolicy') `
                            -Arg ('Get-DnsServerZoneTransferPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Get-DnsServerZoneTransferPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Import-DnsServerResourceRecordDS' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${DSSetFile},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${ZoneScope},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Import-DnsServerResourceRecordDS') `
                            -Arg ('Import-DnsServerResourceRecordDS', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Import-DnsServerResourceRecordDS
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Import-DnsServerRootHint' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NameServer},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Import-DnsServerRootHint') `
                            -Arg ('Import-DnsServerRootHint', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Import-DnsServerRootHint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Import-DnsServerTrustAnchor' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${KeySetFile},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${DSSetFile},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Import-DnsServerTrustAnchor') `
                            -Arg ('Import-DnsServerTrustAnchor', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Import-DnsServerTrustAnchor
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Invoke-DnsServerSigningKeyRollover' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${KeyId},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Invoke-DnsServerSigningKeyRollover') `
                            -Arg ('Invoke-DnsServerSigningKeyRollover', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Invoke-DnsServerSigningKeyRollover
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Invoke-DnsServerZoneSign' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${DoResign},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${SignWithDefault},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Invoke-DnsServerZoneSign') `
                            -Arg ('Invoke-DnsServerZoneSign', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Invoke-DnsServerZoneSign
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Invoke-DnsServerZoneUnsign' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Invoke-DnsServerZoneUnsign') `
                            -Arg ('Invoke-DnsServerZoneUnsign', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Invoke-DnsServerZoneUnsign
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Register-DnsServerDirectoryPartition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('DirectoryPartitionName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Register-DnsServerDirectoryPartition') `
                            -Arg ('Register-DnsServerDirectoryPartition', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Register-DnsServerDirectoryPartition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerClientSubnet' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerClientSubnet') `
                            -Arg ('Remove-DnsServerClientSubnet', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerClientSubnet
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerDirectoryPartition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('DirectoryPartitionName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerDirectoryPartition') `
                            -Arg ('Remove-DnsServerDirectoryPartition', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerDirectoryPartition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerForwarder' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerForwarder') `
                            -Arg ('Remove-DnsServerForwarder', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerForwarder
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerQueryResolutionPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerQueryResolutionPolicy') `
                            -Arg ('Remove-DnsServerQueryResolutionPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerQueryResolutionPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerRecursionScope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerRecursionScope') `
                            -Arg ('Remove-DnsServerRecursionScope', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerRecursionScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerResourceRecord' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ZoneScope},

    [Alias('RecordName')]
    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${Force},

    [Alias('wv')]
    ${WarningVariable},

    ${RecordData},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${InputObject},

    [Alias('Cn','ForwardLookupPrimaryServer')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    ${Type},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${RRType},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${VirtualizationInstance},

    [Alias('ForwardLookupZone')]
    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerResourceRecord') `
                            -Arg ('Remove-DnsServerResourceRecord', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerResourceRecord
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerResponseRateLimitingExceptionlist' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerResponseRateLimitingExceptionlist') `
                            -Arg ('Remove-DnsServerResponseRateLimitingExceptionlist', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerResponseRateLimitingExceptionlist
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerRootHint' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${InputObject},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NameServer},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerRootHint') `
                            -Arg ('Remove-DnsServerRootHint', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerRootHint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerSigningKey' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${KeyId},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerSigningKey') `
                            -Arg ('Remove-DnsServerSigningKey', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerSigningKey
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerTrustAnchor' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${InputObject},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('TrustAnchorName')]
    ${Name},

    [Alias('TrustAnchorType')]
    ${Type},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerTrustAnchor') `
                            -Arg ('Remove-DnsServerTrustAnchor', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerTrustAnchor
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerVirtualizationInstance' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [switch]
    ${RemoveZoneFiles},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('VirtualizationInstance')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerVirtualizationInstance') `
                            -Arg ('Remove-DnsServerVirtualizationInstance', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerVirtualizationInstance
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    ${VirtualizationInstance},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerZone') `
                            -Arg ('Remove-DnsServerZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerZoneDelegation' `
{
    param(
    
    ${VirtualizationInstance},

    [Alias('iv')]
    ${InformationVariable},

    ${ZoneScope},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    ${InputObject},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('infa')]
    ${InformationAction},

    ${ChildZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NameServer},

    [switch]
    ${Force},

    [Alias('ea')]
    ${ErrorAction})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerZoneDelegation') `
                            -Arg ('Remove-DnsServerZoneDelegation', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerZoneDelegation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerZoneScope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneScope')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerZoneScope') `
                            -Arg ('Remove-DnsServerZoneScope', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerZoneScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DnsServerZoneTransferPolicy' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DnsServerZoneTransferPolicy') `
                            -Arg ('Remove-DnsServerZoneTransferPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Remove-DnsServerZoneTransferPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Reset-DnsServerZoneKeyMasterRole' `
{
    param(
    
    [switch]
    ${SeizeRole},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${KeyMasterServer},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Reset-DnsServerZoneKeyMasterRole') `
                            -Arg ('Reset-DnsServerZoneKeyMasterRole', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Reset-DnsServerZoneKeyMasterRole
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Restore-DnsServerPrimaryZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Restore-DnsServerPrimaryZone') `
                            -Arg ('Restore-DnsServerPrimaryZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Restore-DnsServerPrimaryZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Restore-DnsServerSecondaryZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Restore-DnsServerSecondaryZone') `
                            -Arg ('Restore-DnsServerSecondaryZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Restore-DnsServerSecondaryZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Resume-DnsServerZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Resume-DnsServerZone') `
                            -Arg ('Resume-DnsServerZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Resume-DnsServerZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${InputObject},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${CreateFileBackedPrimaryZones},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServer') `
                            -Arg ('Set-DnsServer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerCache' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${IgnorePolicies},

    [switch]
    ${PassThru},

    ${MaxNegativeTtl},

    ${PollutionProtection},

    [Alias('db')]
    [switch]
    ${Debug},

    ${StoreEmptyAuthenticationResponse},

    ${MaxTtl},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${LockingPercent},

    ${MaxKBSize},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerCache') `
                            -Arg ('Set-DnsServerCache', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerCache
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerClientSubnet' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Action},

    ${IPv4Subnet},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${IPv6Subnet},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerClientSubnet') `
                            -Arg ('Set-DnsServerClientSubnet', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerClientSubnet
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerConditionalForwarderZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    ${ForwarderTimeout},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${DirectoryPartitionName},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${MasterServers},

    [Alias('ev')]
    ${ErrorVariable},

    ${ReplicationScope},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${UseRecursion},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerConditionalForwarderZone') `
                            -Arg ('Set-DnsServerConditionalForwarderZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerConditionalForwarderZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerDiagnostics' `
{
    param(
    
    ${SendPackets},

    [Alias('wa')]
    ${WarningAction},

    ${UdpPackets},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${EnableLoggingForZoneLoadingEvent},

    [Alias('pv')]
    ${PipelineVariable},

    ${Answers},

    [switch]
    ${AsJob},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${OperationLogLevel1},

    ${EnableLogFileRollover},

    [Alias('wv')]
    ${WarningVariable},

    ${UnmatchedResponse},

    ${LogFilePath},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${EnableLoggingForRemoteServerEvent},

    ${EnableLoggingForServerStartStopEvent},

    ${Updates},

    ${TcpPackets},

    ${EventLogLevel},

    ${ThrottleLimit},

    ${EnableLoggingForPluginDllEvent},

    ${EnableLoggingForTombstoneEvent},

    ${ReceivePackets},

    [Alias('ov')]
    ${OutVariable},

    ${FullPackets},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Cn')]
    ${ComputerName},

    ${UseSystemEventLog},

    [Alias('Session')]
    ${CimSession},

    ${Notifications},

    ${EnableLoggingToFile},

    ${EnableLoggingForLocalLookupEvent},

    ${SaveLogsToPersistentStorage},

    ${DebugLogging},

    ${OperationLogLevel2},

    [switch]
    ${PassThru},

    ${All},

    [Alias('ev')]
    ${ErrorVariable},

    ${Queries},

    [Alias('iv')]
    ${InformationVariable},

    ${EnableLoggingForZoneDataWriteEvent},

    [Alias('FilterIPAddressList')]
    ${IPFilterList},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${QuestionTransactions},

    [Alias('ob')]
    ${OutBuffer},

    ${EnableLoggingForRecursiveLookupEvent},

    ${WriteThrough},

    ${MaxMBFileSize})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerDiagnostics') `
                            -Arg ('Set-DnsServerDiagnostics', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerDiagnostics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerDnsSecZoneSetting' `
{
    param(
    
    ${DistributeTrustAnchor},

    [Alias('wa')]
    ${WarningAction},

    ${SignatureInceptionOffset},

    ${DnsKeyRecordSetTtl},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${NSec3RandomSaltLength},

    ${InputObject},

    ${NSec3Iterations},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    ${EnableRfc5011KeyRollover},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${DSRecordSetTtl},

    ${PropagationTime},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Session')]
    ${CimSession},

    [Alias('ev')]
    ${ErrorVariable},

    ${NSec3HashAlgorithm},

    ${NSec3OptOut},

    [Alias('ov')]
    ${OutVariable},

    ${SecureDelegationPollingPeriod},

    [Alias('Cn')]
    ${ComputerName},

    ${DSRecordGenerationAlgorithm},

    ${DenialOfExistence},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${NSec3UserSalt},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ParentHasSecureDelegation},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerDnsSecZoneSetting') `
                            -Arg ('Set-DnsServerDnsSecZoneSetting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerDnsSecZoneSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerDsSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${RemoteReplicationDelay},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${MinimumBackgroundLoadThreads},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${LazyUpdateInterval},

    [Alias('ev')]
    ${ErrorVariable},

    ${PollingInterval},

    ${DirectoryPartitionAutoEnlistInterval},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${TombstoneInterval},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerDsSetting') `
                            -Arg ('Set-DnsServerDsSetting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerDsSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerEDns' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${EnableReception},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${EnableProbes},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${CacheTimeout},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerEDns') `
                            -Arg ('Set-DnsServerEDns', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerEDns
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerForwarder' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    ${Timeout},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${UseRootHint},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${EnableReordering},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerForwarder') `
                            -Arg ('Set-DnsServerForwarder', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerForwarder
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerGlobalNameZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${EnableEDnsProbes},

    ${GlobalOverLocal},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    ${Enable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${PreferAaaa},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${BlockUpdates},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ob')]
    ${OutBuffer},

    ${SendTimeout},

    ${ServerQueryInterval},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${AlwaysQueryServer},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerGlobalNameZone') `
                            -Arg ('Set-DnsServerGlobalNameZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerGlobalNameZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerGlobalQueryBlockList' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    ${Enable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${List},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerGlobalQueryBlockList') `
                            -Arg ('Set-DnsServerGlobalQueryBlockList', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerGlobalQueryBlockList
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerPrimaryZone' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${ZoneFile},

    ${IgnorePolicies},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${VirtualizationInstance},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${SecondaryServers},

    [Alias('ZoneName')]
    ${Name},

    [Alias('Session')]
    ${CimSession},

    ${AllowedDcForNsRecordsAutoCreation},

    [Alias('Cn')]
    ${ComputerName},

    ${ReplicationScope},

    [Alias('ov')]
    ${OutVariable},

    ${DirectoryPartitionName},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Notify},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${SecureSecondaries},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    ${DynamicUpdate},

    [switch]
    ${AsJob},

    ${NotifyServers})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerPrimaryZone') `
                            -Arg ('Set-DnsServerPrimaryZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerPrimaryZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerQueryResolutionPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${InternetProtocol},

    ${Fqdn},

    ${RecursionScope},

    ${ZoneScope},

    ${Name},

    ${InputObject},

    [Alias('infa')]
    ${InformationAction},

    ${ServerInterfaceIP},

    ${ProcessingOrder},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeOfDay},

    ${ClientSubnet},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('ov')]
    ${OutVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${QType},

    [Alias('Cn')]
    ${ComputerName},

    ${TransportProtocol},

    ${Condition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${ECS},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerQueryResolutionPolicy') `
                            -Arg ('Set-DnsServerQueryResolutionPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerQueryResolutionPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerRecursion' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${Timeout},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('EnableRecursion')]
    ${Enable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${RetryInterval},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    ${SecureResponse},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${AdditionalTimeout},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerRecursion') `
                            -Arg ('Set-DnsServerRecursion', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerRecursion
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerRecursionScope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${EnableRecursion},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Forwarder},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerRecursionScope') `
                            -Arg ('Set-DnsServerRecursionScope', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerRecursionScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerResourceRecord' `
{
    param(
    
    ${VirtualizationInstance},

    [Alias('iv')]
    ${InformationVariable},

    ${ZoneScope},

    [Alias('Session')]
    ${CimSession},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ForwardLookupZone')]
    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ob')]
    ${OutBuffer},

    ${NewInputObject},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn','ForwardLookupPrimaryServer')]
    ${ComputerName},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${OldInputObject})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerResourceRecord') `
                            -Arg ('Set-DnsServerResourceRecord', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerResourceRecord
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerResourceRecordAging' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    ${NodeName},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${Force},

    [switch]
    ${Recurse})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerResourceRecordAging') `
                            -Arg ('Set-DnsServerResourceRecordAging', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerResourceRecordAging
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerResponseRateLimitingExceptionlist' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    ${Condition},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    ${ServerInterfaceIP},

    ${ClientSubnet},

    ${Fqdn},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerResponseRateLimitingExceptionlist') `
                            -Arg ('Set-DnsServerResponseRateLimitingExceptionlist', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerResponseRateLimitingExceptionlist
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerRootHint' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${InputObject},

    [Alias('Session')]
    ${CimSession},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerRootHint') `
                            -Arg ('Set-DnsServerRootHint', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerRootHint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerScavenging' `
{
    param(
    
    ${ScavengingState},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    ${RefreshInterval},

    [Alias('wv')]
    ${WarningVariable},

    ${ScavengingInterval},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${ApplyOnAllZones},

    ${NoRefreshInterval},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerScavenging') `
                            -Arg ('Set-DnsServerScavenging', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerScavenging
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerSecondaryZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ZoneName')]
    ${Name},

    ${IgnorePolicies},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${MasterServers},

    ${ZoneFile},

    [Alias('Session')]
    ${CimSession},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerSecondaryZone') `
                            -Arg ('Set-DnsServerSecondaryZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerSecondaryZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${InputObject},

    [Alias('Session')]
    ${CimSession},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerSetting') `
                            -Arg ('Set-DnsServerSetting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerSigningKey' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${DnsKeySignatureValidityPeriod},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneSignatureValidityPeriod},

    ${ZoneName},

    ${NextRolloverAction},

    ${DSSignatureValidityPeriod},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${KeyId},

    ${RolloverPeriod},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerSigningKey') `
                            -Arg ('Set-DnsServerSigningKey', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerSigningKey
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerStubZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    ${LocalMasters},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${DirectoryPartitionName},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${MasterServers},

    [Alias('ev')]
    ${ErrorVariable},

    ${ReplicationScope},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerStubZone') `
                            -Arg ('Set-DnsServerStubZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerStubZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerVirtualizationInstance' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Description},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('VirtualizationInstance')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    ${FriendlyName},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerVirtualizationInstance') `
                            -Arg ('Set-DnsServerVirtualizationInstance', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerVirtualizationInstance
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerZoneAging' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    ${RefreshInterval},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    ${ScavengeServers},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NoRefreshInterval},

    [Alias('AgingEnabled')]
    ${Aging},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerZoneAging') `
                            -Arg ('Set-DnsServerZoneAging', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerZoneAging
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerZoneDelegation' `
{
    param(
    
    ${VirtualizationInstance},

    [Alias('iv')]
    ${InformationVariable},

    ${InputObject},

    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ChildZoneName},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NameServer},

    ${ZoneScope},

    [Alias('ea')]
    ${ErrorAction})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerZoneDelegation') `
                            -Arg ('Set-DnsServerZoneDelegation', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerZoneDelegation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DnsServerZoneTransferPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${InternetProtocol},

    ${Name},

    ${InputObject},

    [Alias('infa')]
    ${InformationAction},

    ${ServerInterfaceIP},

    ${ProcessingOrder},

    [Alias('wv')]
    ${WarningVariable},

    ${TimeOfDay},

    ${ClientSubnet},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('ov')]
    ${OutVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('Cn')]
    ${ComputerName},

    ${TransportProtocol},

    ${Condition},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ZoneName})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DnsServerZoneTransferPolicy') `
                            -Arg ('Set-DnsServerZoneTransferPolicy', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Set-DnsServerZoneTransferPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Show-DnsServerCache' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${CacheScope},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Show-DnsServerCache') `
                            -Arg ('Show-DnsServerCache', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Show-DnsServerCache
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Show-DnsServerKeyStorageProvider' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Show-DnsServerKeyStorageProvider') `
                            -Arg ('Show-DnsServerKeyStorageProvider', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Show-DnsServerKeyStorageProvider
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Start-DnsServerScavenging' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Start-DnsServerScavenging') `
                            -Arg ('Start-DnsServerScavenging', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Start-DnsServerScavenging
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Start-DnsServerZoneTransfer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${FullTransfer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Start-DnsServerZoneTransfer') `
                            -Arg ('Start-DnsServerZoneTransfer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Start-DnsServerZoneTransfer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Step-DnsServerSigningKeyRollover' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${KeyId},

    [Alias('wa')]
    ${WarningAction},

    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Step-DnsServerSigningKeyRollover') `
                            -Arg ('Step-DnsServerSigningKeyRollover', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Step-DnsServerSigningKeyRollover
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Suspend-DnsServerZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Suspend-DnsServerZone') `
                            -Arg ('Suspend-DnsServerZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Suspend-DnsServerZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Sync-DnsServerZone' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ZoneName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Sync-DnsServerZone') `
                            -Arg ('Sync-DnsServerZone', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Sync-DnsServerZone
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Test-DnsServer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    ${Context},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Test-DnsServer') `
                            -Arg ('Test-DnsServer', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Test-DnsServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Test-DnsServerDnsSecZoneSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ZoneName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Test-DnsServerDnsSecZoneSetting') `
                            -Arg ('Test-DnsServerDnsSecZoneSetting', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Test-DnsServerDnsSecZoneSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Unregister-DnsServerDirectoryPartition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('DirectoryPartitionName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Unregister-DnsServerDirectoryPartition') `
                            -Arg ('Unregister-DnsServerDirectoryPartition', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Unregister-DnsServerDirectoryPartition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Update-DnsServerTrustPoint' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

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

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${Force},

    [Alias('iv')]
    ${InformationVariable})

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Update-DnsServerTrustPoint') `
                            -Arg ('Update-DnsServerTrustPoint', $PSBoundParameters, $positionalArguments) `
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

    # .ForwardHelpTargetName Update-DnsServerTrustPoint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
##############################################################################

& $script:ExportModuleMember -Function @('Export-DnsServerDnsSecPublicKey', 'Get-DnsServerResponseRateLimiting', 'Set-DnsServerResponseRateLimiting', 'Add-DnsServerClientSubnet', 'Add-DnsServerConditionalForwarderZone', 'Add-DnsServerDirectoryPartition', 'Add-DnsServerForwarder', 'Add-DnsServerPrimaryZone', 'Add-DnsServerQueryResolutionPolicy', 'Add-DnsServerRecursionScope', 'Add-DnsServerResourceRecord', 'Add-DnsServerResourceRecordA', 'Add-DnsServerResourceRecordAAAA', 'Add-DnsServerResourceRecordCName', 'Add-DnsServerResourceRecordDnsKey', 'Add-DnsServerResourceRecordDS', 'Add-DnsServerResourceRecordMX', 'Add-DnsServerResourceRecordPtr', 'Add-DnsServerResponseRateLimitingExceptionlist', 'Add-DnsServerRootHint', 'Add-DnsServerSecondaryZone', 'Add-DnsServerSigningKey', 'Add-DnsServerStubZone', 'Add-DnsServerTrustAnchor', 'Add-DnsServerVirtualizationInstance', 'Add-DnsServerZoneDelegation', 'Add-DnsServerZoneScope', 'Add-DnsServerZoneTransferPolicy', 'Clear-DnsServerCache', 'Clear-DnsServerStatistics', 'ConvertTo-DnsServerPrimaryZone', 'ConvertTo-DnsServerSecondaryZone', 'Disable-DnsServerPolicy', 'Disable-DnsServerSigningKeyRollover', 'Enable-DnsServerPolicy', 'Enable-DnsServerSigningKeyRollover', 'Export-DnsServerZone', 'Get-DnsServer', 'Get-DnsServerCache', 'Get-DnsServerClientSubnet', 'Get-DnsServerDiagnostics', 'Get-DnsServerDirectoryPartition', 'Get-DnsServerDnsSecZoneSetting', 'Get-DnsServerDsSetting', 'Get-DnsServerEDns', 'Get-DnsServerForwarder', 'Get-DnsServerGlobalNameZone', 'Get-DnsServerGlobalQueryBlockList', 'Get-DnsServerQueryResolutionPolicy', 'Get-DnsServerRecursion', 'Get-DnsServerRecursionScope', 'Get-DnsServerResourceRecord', 'Get-DnsServerResponseRateLimitingExceptionlist', 'Get-DnsServerRootHint', 'Get-DnsServerScavenging', 'Get-DnsServerSetting', 'Get-DnsServerSigningKey', 'Get-DnsServerStatistics', 'Get-DnsServerTrustAnchor', 'Get-DnsServerTrustPoint', 'Get-DnsServerVirtualizationInstance', 'Get-DnsServerZone', 'Get-DnsServerZoneAging', 'Get-DnsServerZoneDelegation', 'Get-DnsServerZoneScope', 'Get-DnsServerZoneTransferPolicy', 'Import-DnsServerResourceRecordDS', 'Import-DnsServerRootHint', 'Import-DnsServerTrustAnchor', 'Invoke-DnsServerSigningKeyRollover', 'Invoke-DnsServerZoneSign', 'Invoke-DnsServerZoneUnsign', 'Register-DnsServerDirectoryPartition', 'Remove-DnsServerClientSubnet', 'Remove-DnsServerDirectoryPartition', 'Remove-DnsServerForwarder', 'Remove-DnsServerQueryResolutionPolicy', 'Remove-DnsServerRecursionScope', 'Remove-DnsServerResourceRecord', 'Remove-DnsServerResponseRateLimitingExceptionlist', 'Remove-DnsServerRootHint', 'Remove-DnsServerSigningKey', 'Remove-DnsServerTrustAnchor', 'Remove-DnsServerVirtualizationInstance', 'Remove-DnsServerZone', 'Remove-DnsServerZoneDelegation', 'Remove-DnsServerZoneScope', 'Remove-DnsServerZoneTransferPolicy', 'Reset-DnsServerZoneKeyMasterRole', 'Restore-DnsServerPrimaryZone', 'Restore-DnsServerSecondaryZone', 'Resume-DnsServerZone', 'Set-DnsServer', 'Set-DnsServerCache', 'Set-DnsServerClientSubnet', 'Set-DnsServerConditionalForwarderZone', 'Set-DnsServerDiagnostics', 'Set-DnsServerDnsSecZoneSetting', 'Set-DnsServerDsSetting', 'Set-DnsServerEDns', 'Set-DnsServerForwarder', 'Set-DnsServerGlobalNameZone', 'Set-DnsServerGlobalQueryBlockList', 'Set-DnsServerPrimaryZone', 'Set-DnsServerQueryResolutionPolicy', 'Set-DnsServerRecursion', 'Set-DnsServerRecursionScope', 'Set-DnsServerResourceRecord', 'Set-DnsServerResourceRecordAging', 'Set-DnsServerResponseRateLimitingExceptionlist', 'Set-DnsServerRootHint', 'Set-DnsServerScavenging', 'Set-DnsServerSecondaryZone', 'Set-DnsServerSetting', 'Set-DnsServerSigningKey', 'Set-DnsServerStubZone', 'Set-DnsServerVirtualizationInstance', 'Set-DnsServerZoneAging', 'Set-DnsServerZoneDelegation', 'Set-DnsServerZoneTransferPolicy', 'Show-DnsServerCache', 'Show-DnsServerKeyStorageProvider', 'Start-DnsServerScavenging', 'Start-DnsServerZoneTransfer', 'Step-DnsServerSigningKeyRollover', 'Suspend-DnsServerZone', 'Sync-DnsServerZone', 'Test-DnsServer', 'Test-DnsServerDnsSecZoneSetting', 'Unregister-DnsServerDirectoryPartition', 'Update-DnsServerTrustPoint')
        
##############################################################################

& $script:SetAlias -Name 'Export-DnsServerTrustAnchor' -Value 'Export-DnsServerDnsSecPublicKey' -Force -Scope script
        
& $script:SetAlias -Name 'Get-DnsServerRRL' -Value 'Get-DnsServerResponseRateLimiting' -Force -Scope script
        
& $script:SetAlias -Name 'Set-DnsServerRRL' -Value 'Set-DnsServerResponseRateLimiting' -Force -Scope script
        
& $script:ExportModuleMember -Alias @('Export-DnsServerTrustAnchor', 'Get-DnsServerRRL', 'Set-DnsServerRRL')
        
