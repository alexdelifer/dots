
<#
 # Implicit remoting module
 # generated on 12/16/2020 8:10:03 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\RemoteAccess" -Session (get-pssession -Name WinRM1) -AllowClobber -Force -Module RemoteAccess
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
                -InstanceId 7187007f-76af-44fb-b0b2-5b16aa55b7f1 `
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
                    -ComputerName $ImplicitRA `
                    -ApplicationName 'wsman'    -ConfigurationName 'Microsoft.PowerShell' `
                    -SessionOption (Get-PSImplicitRemotingSessionOption) `
                    -Credential $creds `
                     `
                    -Authentication Credssp `
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

        
            try {
                & $script:InvokeCommand -Session $script:PSSession -ScriptBlock { 
                    Get-Module -ListAvailable -Name 'RemoteAccess' | Import-Module 
                } -ErrorAction SilentlyContinue
            } catch { }

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

& $script:SetItem 'function:script:Get-VpnServerConfiguration' `
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

    ${TunnelType},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-VpnServerConfiguration') `
                            -Arg ('Get-VpnServerConfiguration', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-VpnServerConfiguration
    # .ForwardHelpCategory Alias
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-VpnServerConfiguration' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${SstpPorts},

    ${L2tpPorts},

    [Alias('LifeTimeKiloBytes')]
    ${SADataSizeForRenegotiationKilobytes},

    ${DHGroup},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    ${GrePorts},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('IdleDurationSeconds')]
    ${IdleDisconnectSeconds},

    [Alias('Session')]
    ${CimSession},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('FirstTransformType')]
    ${AuthenticationTransformConstants},

    [Alias('LifeTimeSeconds')]
    ${SALifeTimeSeconds},

    ${Ikev2Ports},

    [Alias('ov')]
    ${OutVariable},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${TunnelType},

    [switch]
    ${PassThru},

    ${EncryptionType},

    [Alias('FirstCipherAlgorithm','OtherCipherAlgorithm')]
    ${CipherTransformConstants},

    [Alias('FirstIntegrityAlgorithm','OtherHashAlgorithm')]
    ${IntegrityCheckMethod},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${CustomPolicy},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('Encryption')]
    ${EncryptionMethod},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('PfsGroupId')]
    ${PfsGroup},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [switch]
    ${RevertToDefault})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-VpnServerConfiguration') `
                            -Arg ('Set-VpnServerConfiguration', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-VpnServerConfiguration
    # .ForwardHelpCategory Alias
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-BgpCustomRoute' `
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

    ${Interface},

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

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    [Alias('DestinationNetwork')]
    ${Network},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-BgpCustomRoute') `
                            -Arg ('Add-BgpCustomRoute', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-BgpCustomRoute
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-BgpPeer' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    ${HoldTimeSec},

    ${PeeringMode},

    [Alias('PeerName','PeerId')]
    ${Name},

    ${PeerIPAddress},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${IdleHoldTimeSec},

    ${OperationMode},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${ThrottleLimit},

    [Alias('ov')]
    ${OutVariable},

    ${Weight},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    ${MaxAllowedPrefix},

    ${LocalIPAddress},

    [Alias('ob')]
    ${OutBuffer},

    ${LocalASN},

    [Alias('ev')]
    ${ErrorVariable},

    ${PeerASN},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-BgpPeer') `
                            -Arg ('Add-BgpPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-BgpPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-BgpRouter' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${BgpIdentifier},

    ${CompareMEDAcrossASN},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${LocalIPv6Address},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    ${DefaultGatewayRouting},

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

    ${LocalASN},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    ${IPv6Routing},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-BgpRouter') `
                            -Arg ('Add-BgpRouter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-BgpRouter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-BgpRoutingPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${MatchASNRange},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    ${IgnorePrefix},

    ${AddCommunity},

    ${MatchPrefix},

    [Alias('PolicyId','PolicyName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${Force},

    [switch]
    ${ClearMED},

    [Alias('wv')]
    ${WarningVariable},

    ${MatchNextHop},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${RemoveCommunity},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Session')]
    ${CimSession},

    ${NewNextHop},

    ${MatchCommunity},

    ${PolicyType},

    [Alias('ov')]
    ${OutVariable},

    ${NewMED},

    [switch]
    ${PassThru},

    ${NewLocalPref},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-BgpRoutingPolicy') `
                            -Arg ('Add-BgpRoutingPolicy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-BgpRoutingPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-BgpRoutingPolicyForPeer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Direction},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('PeerId','PeerList')]
    ${PeerName},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('PolicyList','PolicyId')]
    ${PolicyName},

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

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-BgpRoutingPolicyForPeer') `
                            -Arg ('Add-BgpRoutingPolicyForPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-BgpRoutingPolicyForPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DAAppServer' `
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

    ${GpoName},

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

    ${SecurityGroupNameList},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${SecurityGroupName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DAAppServer') `
                            -Arg ('Add-DAAppServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DAAppServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DAClient' `
{
    param(
    
    ${EntrypointName},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('DownlevelGpoNameList')]
    ${DownlevelGpoName},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    ${GpoName},

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

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${SecurityGroupNameList},

    [Alias('Session')]
    ${CimSession},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${DownlevelSecurityGroupNameList},

    [Alias('wi')]
    [switch]
    ${WhatIf},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DAClient') `
                            -Arg ('Add-DAClient', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DAClient
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DAClientDnsConfiguration' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('DirectAccessDnsServers')]
    ${DnsIPAddress},

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

    [Alias('Namespace')]
    ${DnsSuffix},

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

    [Alias('DirectAccessProxyName')]
    ${ProxyServer},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DAClientDnsConfiguration') `
                            -Arg ('Add-DAClientDnsConfiguration', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DAClientDnsConfiguration
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DAEntryPoint' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('ob')]
    ${OutBuffer},

    ${ServerGpoName},

    [switch]
    ${NoPrerequisite},

    [Alias('EntryPointName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    ${ConnectToAddress},

    [switch]
    ${Force},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${RemoteAccessServer},

    ${GslbIP},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${DeployNat},

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

    ${InternetInterface},

    ${InternalInterface},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ClientIPv6Prefix})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DAEntryPoint') `
                            -Arg ('Add-DAEntryPoint', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DAEntryPoint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DAMgmtServer' `
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

    ${MgmtServer},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DAMgmtServer') `
                            -Arg ('Add-DAMgmtServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DAMgmtServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-RemoteAccessIpFilter' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('FilterAction')]
    ${Action},

    ${Direction},

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

    ${AddressFamily},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('Name')]
    ${InterfaceAlias},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${List},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-RemoteAccessIpFilter') `
                            -Arg ('Add-RemoteAccessIpFilter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-RemoteAccessIpFilter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-RemoteAccessLoadBalancerNode' `
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

    ${RemoteAccessServer},

    [Alias('pv')]
    ${PipelineVariable},

    ${InternetInterface},

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

    ${VpnIPAddressRange},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${InternalInterface},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-RemoteAccessLoadBalancerNode') `
                            -Arg ('Add-RemoteAccessLoadBalancerNode', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-RemoteAccessLoadBalancerNode
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-RemoteAccessRadius' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('ob')]
    ${OutBuffer},

    ${EntrypointName},

    ${AccountingOnOffMsg},

    ${Purpose},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${ServerName},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${Port},

    ${Timeout},

    ${MsgAuthenticator},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${SharedSecret},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${Score})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-RemoteAccessRadius') `
                            -Arg ('Add-RemoteAccessRadius', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-RemoteAccessRadius
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-VpnIPAddressRange' `
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

    [Alias('ob')]
    ${OutBuffer},

    ${IPAddressRange},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-VpnIPAddressRange') `
                            -Arg ('Add-VpnIPAddressRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-VpnIPAddressRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-VpnS2SInterface' `
{
    param(
    
    ${TxBandwidthKbps},

    [Alias('wa')]
    ${WarningAction},

    [Alias('NetworkOutageTimeSec')]
    ${NetworkOutageTimeSeconds},

    ${DHGroup},

    ${Password},

    [Alias('User')]
    ${UserName},

    ${AuthenticationMethod},

    [Alias('OtherHashAlgorithm','FirstIntegrityAlgorithm')]
    ${IntegrityCheckMethod},

    ${RemoteVpnTrafficSelector},

    ${ThrottleLimit},

    [Alias('RetryIntervalSec')]
    ${RetryIntervalSeconds},

    [Alias('IPv4TriggerSubnet')]
    ${IPv4Subnet},

    [Alias('SaRenegotiationDataSizeKB','LifeTimeKiloBytes')]
    ${SADataSizeForRenegotiationKilobytes},

    [Alias('Cert')]
    ${Certificate},

    ${IPv4TriggerFilterAction},

    ${PromoteAlternate},

    ${InitiateConfigPayload},

    ${AdminStatus},

    ${InternalIPv6},

    [Alias('RemoteTunnelEndpoint','RemoteTunnelHostname','RemoteAddress')]
    ${Destination},

    ${SourceIpAddress},

    [Alias('ov')]
    ${OutVariable},

    ${EncryptionType},

    ${GreKey},

    [Alias('OtherCipherAlgorithm','FirstCipherAlgorithm','CipherTransformConstant')]
    ${CipherTransformConstants},

    ${IPv4Address},

    [switch]
    ${AsJob},

    [switch]
    ${CustomPolicy},

    [Alias('IPv6TriggerSubnet')]
    ${IPv6Subnet},

    [Alias('SaLifeTimeSec','LifeTimeSeconds')]
    ${SALifeTimeSeconds},

    [Alias('iv')]
    ${InformationVariable},

    ${IPv6Address},

    ${IPv6TriggerFilterAction},

    ${PostConnectionIPv6Subnet},

    [Alias('infa')]
    ${InformationAction},

    ${ResponderAuthenticationMethod},

    ${EnableQoS},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${PassThru},

    ${LocalVpnTrafficSelector},

    ${IPv6TriggerFilter},

    [Alias('KeyModule')]
    ${Protocol},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${IPv4TriggerFilter},

    [Alias('IdleDurationSeconds','IdleDisconnectSec')]
    ${IdleDisconnectSeconds},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${NumberOfTries},

    ${PostConnectionIPv4Subnet},

    [switch]
    ${GreTunnel},

    [Alias('ea')]
    ${ErrorAction},

    ${EapMethod},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${Persistent},

    [Alias('PfsGroupId')]
    ${PfsGroup},

    [Alias('FirstTransformType','AuthenticationTransformConstant')]
    ${AuthenticationTransformConstants},

    ${RxBandwidthKbps},

    [Alias('ElementName')]
    ${Name},

    ${RadiusAttributeClass},

    [Alias('Session')]
    ${CimSession},

    [Alias('Encryption')]
    ${EncryptionMethod},

    [Alias('ob')]
    ${OutBuffer},

    ${SharedSecret},

    ${InternalIPv4},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-VpnS2SInterface') `
                            -Arg ('Add-VpnS2SInterface', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-VpnS2SInterface
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Clear-RemoteAccessInboxAccountingStore' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${StartDateTime},

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

    ${EndDateTime},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Clear-RemoteAccessInboxAccountingStore') `
                            -Arg ('Clear-RemoteAccessInboxAccountingStore', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Clear-RemoteAccessInboxAccountingStore
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Clear-VpnS2SInterfaceStatistics' `
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

    [Alias('ElementName')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Clear-VpnS2SInterfaceStatistics') `
                            -Arg ('Clear-VpnS2SInterfaceStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Clear-VpnS2SInterfaceStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Connect-VpnS2SInterface' `
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

    [Alias('ElementName')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Connect-VpnS2SInterface') `
                            -Arg ('Connect-VpnS2SInterface', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Connect-VpnS2SInterface
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disable-DAMultiSite' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disable-DAMultiSite') `
                            -Arg ('Disable-DAMultiSite', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Disable-DAMultiSite
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disable-DAOtpAuthentication' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disable-DAOtpAuthentication') `
                            -Arg ('Disable-DAOtpAuthentication', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Disable-DAOtpAuthentication
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disable-RemoteAccessRoutingDomain' `
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

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('RoutingDomainName','RoutingDomain')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disable-RemoteAccessRoutingDomain') `
                            -Arg ('Disable-RemoteAccessRoutingDomain', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Disable-RemoteAccessRoutingDomain
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disconnect-VpnS2SInterface' `
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

    [Alias('ElementName')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disconnect-VpnS2SInterface') `
                            -Arg ('Disconnect-VpnS2SInterface', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Disconnect-VpnS2SInterface
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Disconnect-VpnUser' `
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

    ${HostIPAddress},

    ${UserName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Disconnect-VpnUser') `
                            -Arg ('Disconnect-VpnUser', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Disconnect-VpnUser
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Enable-DAMultiSite' `
{
    param(
    
    ${EntryPointName},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('EnterpriseName')]
    ${Name},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${ManualEntryPointSelectionAllowed},

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

    ${GslbIP},

    [Alias('Session')]
    ${CimSession},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${GslbFqdn},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Enable-DAMultiSite') `
                            -Arg ('Enable-DAMultiSite', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Enable-DAMultiSite
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Enable-DAOtpAuthentication' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${CAServer},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    ${SigningCertificateTemplateName},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wa')]
    ${WarningAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    ${CertificateTemplateName},

    [Alias('ev')]
    ${ErrorVariable},

    ${UserSecurityGroupName},

    [Alias('Server')]
    ${RadiusServer},

    ${ThrottleLimit},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ob')]
    ${OutBuffer},

    ${SharedSecret},

    [Alias('Port')]
    ${RadiusPort},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${AsJob},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Enable-DAOtpAuthentication') `
                            -Arg ('Enable-DAOtpAuthentication', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Enable-DAOtpAuthentication
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Enable-RemoteAccessRoutingDomain' `
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

    [Alias('RoutingDomainName','RoutingDomain')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Enable-RemoteAccessRoutingDomain') `
                            -Arg ('Enable-RemoteAccessRoutingDomain', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Enable-RemoteAccessRoutingDomain
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-BgpCustomRoute' `
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-BgpCustomRoute') `
                            -Arg ('Get-BgpCustomRoute', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-BgpCustomRoute
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-BgpPeer' `
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

    [Alias('PeerList','PeerId','PeerName')]
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-BgpPeer') `
                            -Arg ('Get-BgpPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-BgpPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-BgpRouteInformation' `
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    [Alias('DestinationNetwork')]
    ${Network},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-BgpRouteInformation') `
                            -Arg ('Get-BgpRouteInformation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-BgpRouteInformation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-BgpRouter' `
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-BgpRouter') `
                            -Arg ('Get-BgpRouter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-BgpRouter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-BgpRoutingPolicy' `
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

    [Alias('PolicyList','PolicyId','PolicyName')]
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    ${PolicyType},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-BgpRoutingPolicy') `
                            -Arg ('Get-BgpRoutingPolicy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-BgpRoutingPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-BgpStatistics' `
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

    [Alias('PeerId','PeerList')]
    ${PeerName},

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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-BgpStatistics') `
                            -Arg ('Get-BgpStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-BgpStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAAppServer' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAAppServer') `
                            -Arg ('Get-DAAppServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAAppServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAClient' `
{
    param(
    
    ${EntrypointName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAClient') `
                            -Arg ('Get-DAClient', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAClient
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAClientDnsConfiguration' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAClientDnsConfiguration') `
                            -Arg ('Get-DAClientDnsConfiguration', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAClientDnsConfiguration
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAEntryPoint' `
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

    [Alias('EntryPointName')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAEntryPoint') `
                            -Arg ('Get-DAEntryPoint', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAEntryPoint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAEntryPointDC' `
{
    param(
    
    ${EntryPointName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAEntryPointDC') `
                            -Arg ('Get-DAEntryPointDC', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAEntryPointDC
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAMgmtServer' `
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

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Type},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAMgmtServer') `
                            -Arg ('Get-DAMgmtServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAMgmtServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAMultiSite' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAMultiSite') `
                            -Arg ('Get-DAMultiSite', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAMultiSite
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DANetworkLocationServer' `
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

    [switch]
    ${CheckReachability},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DANetworkLocationServer') `
                            -Arg ('Get-DANetworkLocationServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DANetworkLocationServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAOtpAuthentication' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAOtpAuthentication') `
                            -Arg ('Get-DAOtpAuthentication', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAOtpAuthentication
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DAServer' `
{
    param(
    
    ${EntrypointName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DAServer') `
                            -Arg ('Get-DAServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DAServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccess' `
{
    param(
    
    ${EntrypointName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccess') `
                            -Arg ('Get-RemoteAccess', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccess
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessAccounting' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessAccounting') `
                            -Arg ('Get-RemoteAccessAccounting', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessAccounting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessConfiguration' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessConfiguration') `
                            -Arg ('Get-RemoteAccessConfiguration', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessConfiguration
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessConnectionStatistics' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${StartDateTime},

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

    ${EndDateTime},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    ${ResourceName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessConnectionStatistics') `
                            -Arg ('Get-RemoteAccessConnectionStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessConnectionStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessConnectionStatisticsSummary' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${StartDateTime},

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

    ${EndDateTime},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessConnectionStatisticsSummary') `
                            -Arg ('Get-RemoteAccessConnectionStatisticsSummary', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessConnectionStatisticsSummary
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessHealth' `
{
    param(
    
    ${EntrypointName},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [switch]
    ${Cluster},

    [Alias('infa')]
    ${InformationAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [switch]
    ${Refresh},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessHealth') `
                            -Arg ('Get-RemoteAccessHealth', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessHealth
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessIpFilter' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Direction},

    [Alias('Session')]
    ${CimSession},

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

    [Alias('Name')]
    ${InterfaceAlias},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessIpFilter') `
                            -Arg ('Get-RemoteAccessIpFilter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessIpFilter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessLoadBalancer' `
{
    param(
    
    ${EntrypointName},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${Brief},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessLoadBalancer') `
                            -Arg ('Get-RemoteAccessLoadBalancer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessLoadBalancer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessRadius' `
{
    param(
    
    ${EntrypointName},

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

    ${Purpose},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessRadius') `
                            -Arg ('Get-RemoteAccessRadius', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessRadius
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessRoutingDomain' `
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

    [Alias('RoutingDomainName','RoutingDomain')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessRoutingDomain') `
                            -Arg ('Get-RemoteAccessRoutingDomain', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessRoutingDomain
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RemoteAccessUserActivity' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${StartDateTime},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${UserName},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${HostIPAddress},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('pv')]
    ${PipelineVariable},

    ${SessionId},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    ${EndDateTime},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RemoteAccessUserActivity') `
                            -Arg ('Get-RemoteAccessUserActivity', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RemoteAccessUserActivity
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-RoutingProtocolPreference' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-RoutingProtocolPreference') `
                            -Arg ('Get-RoutingProtocolPreference', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-RoutingProtocolPreference
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-VpnAuthProtocol' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-VpnAuthProtocol') `
                            -Arg ('Get-VpnAuthProtocol', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-VpnAuthProtocol
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-VpnS2SInterface' `
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

    [Alias('ElementName')]
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-VpnS2SInterface') `
                            -Arg ('Get-VpnS2SInterface', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-VpnS2SInterface
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-VpnS2SInterfaceStatistics' `
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

    [Alias('ElementName')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-VpnS2SInterfaceStatistics') `
                            -Arg ('Get-VpnS2SInterfaceStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-VpnS2SInterfaceStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Install-RemoteAccess' `
{
    param(
    
    ${DAInstallType},

    [Alias('wa')]
    ${WarningAction},

    ${EntrypointName},

    [switch]
    ${MultiTenancy},

    [switch]
    ${AsJob},

    [Alias('Timeout')]
    ${RadiusTimeout},

    ${ServerGpoName},

    [switch]
    ${NoPrerequisite},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    ${ConnectToAddress},

    [switch]
    ${Force},

    [Alias('GpoName')]
    ${ClientGpoName},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('Score')]
    ${RadiusScore},

    ${IPAddressRange},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Port')]
    ${RadiusPort},

    [Alias('Session')]
    ${CimSession},

    ${MsgAuthenticator},

    ${IPv6Prefix},

    ${VpnType},

    [Alias('ov')]
    ${OutVariable},

    ${CapacityKbps},

    [switch]
    ${DeployNat},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ServerName')]
    ${RadiusServer},

    ${SharedSecret},

    [switch]
    ${Prerequisite},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${InternetInterface},

    ${InternalInterface},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ThrottleLimit},

    ${NlsUrl},

    [Alias('Certificate')]
    ${NlsCertificate})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Install-RemoteAccess') `
                            -Arg ('Install-RemoteAccess', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Install-RemoteAccess
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:New-VpnTrafficSelector' `
{
    param(
    
    ${PortRange},

    [Alias('iv')]
    ${InformationVariable},

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

    ${Type},

    [Alias('ob')]
    ${OutBuffer},

    ${IPAddressRange},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${ProtocolId})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'New-VpnTrafficSelector') `
                            -Arg ('New-VpnTrafficSelector', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName New-VpnTrafficSelector
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-BgpCustomRoute' `
{
    param(
    
    [switch]
    ${Force},

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

    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${Interface},

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

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    [Alias('DestinationNetwork')]
    ${Network},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-BgpCustomRoute') `
                            -Arg ('Remove-BgpCustomRoute', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-BgpCustomRoute
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-BgpPeer' `
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

    [Alias('PeerList','PeerId','PeerName')]
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-BgpPeer') `
                            -Arg ('Remove-BgpPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-BgpPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-BgpRouter' `
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-BgpRouter') `
                            -Arg ('Remove-BgpRouter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-BgpRouter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-BgpRoutingPolicy' `
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

    [Alias('PolicyList','PolicyId','PolicyName')]
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-BgpRoutingPolicy') `
                            -Arg ('Remove-BgpRoutingPolicy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-BgpRoutingPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-BgpRoutingPolicyForPeer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Direction},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('PeerList','PeerId')]
    ${PeerName},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('PolicyList','PolicyId')]
    ${PolicyName},

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

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-BgpRoutingPolicyForPeer') `
                            -Arg ('Remove-BgpRoutingPolicyForPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-BgpRoutingPolicyForPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DAAppServer' `
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

    ${SecurityGroupNameList},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${DomainName},

    ${SecurityGroupName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DAAppServer') `
                            -Arg ('Remove-DAAppServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DAAppServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DAClient' `
{
    param(
    
    ${EntrypointName},

    [Alias('iv')]
    ${InformationVariable},

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

    ${DownlevelDomainName},

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

    ${SecurityGroupNameList},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${DownlevelSecurityGroupNameList},

    ${DomainName},

    [Alias('wi')]
    [switch]
    ${WhatIf},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DAClient') `
                            -Arg ('Remove-DAClient', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DAClient
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DAClientDnsConfiguration' `
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

    [Alias('Namespace')]
    ${DnsSuffix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DAClientDnsConfiguration') `
                            -Arg ('Remove-DAClientDnsConfiguration', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DAClientDnsConfiguration
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DAEntryPoint' `
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

    [Alias('EntryPointName')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DAEntryPoint') `
                            -Arg ('Remove-DAEntryPoint', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DAEntryPoint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DAMgmtServer' `
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

    ${MgmtServer},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DAMgmtServer') `
                            -Arg ('Remove-DAMgmtServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DAMgmtServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-RemoteAccessIpFilter' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Direction},

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

    [Alias('pv')]
    ${PipelineVariable},

    ${AddressFamily},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('Name')]
    ${InterfaceAlias},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${List},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-RemoteAccessIpFilter') `
                            -Arg ('Remove-RemoteAccessIpFilter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-RemoteAccessIpFilter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-RemoteAccessLoadBalancerNode' `
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

    ${RemoteAccessServer},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-RemoteAccessLoadBalancerNode') `
                            -Arg ('Remove-RemoteAccessLoadBalancerNode', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-RemoteAccessLoadBalancerNode
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-RemoteAccessRadius' `
{
    param(
    
    ${EntrypointName},

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

    ${ServerName},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ea')]
    ${ErrorAction},

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

    ${Purpose},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-RemoteAccessRadius') `
                            -Arg ('Remove-RemoteAccessRadius', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-RemoteAccessRadius
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-VpnIPAddressRange' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('StartIPAddress')]
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

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-VpnIPAddressRange') `
                            -Arg ('Remove-VpnIPAddressRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-VpnIPAddressRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-VpnS2SInterface' `
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

    [Alias('ElementName')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-VpnS2SInterface') `
                            -Arg ('Remove-VpnS2SInterface', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-VpnS2SInterface
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-BgpPeer' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    ${HoldTimeSec},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${PeeringMode},

    [Alias('PeerId','PeerName')]
    ${Name},

    ${PeerIPAddress},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${Force},

    [Alias('wv')]
    ${WarningVariable},

    ${IdleHoldTimeSec},

    ${OperationMode},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${ThrottleLimit},

    [switch]
    ${ClearPrefixLimit},

    [Alias('ov')]
    ${OutVariable},

    ${Weight},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${MaxAllowedPrefix},

    ${LocalIPAddress},

    [Alias('ob')]
    ${OutBuffer},

    ${LocalASN},

    [Alias('ev')]
    ${ErrorVariable},

    ${PeerASN},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-BgpPeer') `
                            -Arg ('Set-BgpPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-BgpPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-BgpRouter' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${BgpIdentifier},

    ${CompareMEDAcrossASN},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${LocalIPv6Address},

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

    ${DefaultGatewayRouting},

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

    ${LocalASN},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    ${IPv6Routing},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-BgpRouter') `
                            -Arg ('Set-BgpRouter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-BgpRouter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-BgpRoutingPolicy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${MatchASNRange},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

    ${RemovePolicyClause},

    ${IgnorePrefix},

    ${AddCommunity},

    ${MatchPrefix},

    [Alias('PolicyId','PolicyName')]
    ${Name},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${Force},

    [switch]
    ${ClearMED},

    [Alias('wv')]
    ${WarningVariable},

    ${MatchNextHop},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${RemoveCommunity},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Session')]
    ${CimSession},

    ${NewNextHop},

    ${MatchCommunity},

    ${PolicyType},

    [Alias('ov')]
    ${OutVariable},

    ${NewMED},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${NewLocalPref},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-BgpRoutingPolicy') `
                            -Arg ('Set-BgpRoutingPolicy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-BgpRoutingPolicy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-BgpRoutingPolicyForPeer' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${Direction},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('PeerList','PeerId')]
    ${PeerName},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('PolicyList','PolicyId')]
    ${PolicyName},

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

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-BgpRoutingPolicyForPeer') `
                            -Arg ('Set-BgpRoutingPolicyForPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-BgpRoutingPolicyForPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DAAppServerConnection' `
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

    ${ConnectionType},

    ${TrafficProtection},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DAAppServerConnection') `
                            -Arg ('Set-DAAppServerConnection', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DAAppServerConnection
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DAClient' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Downlevel},

    [Alias('ob')]
    ${OutBuffer},

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

    ${ForceTunnel},

    ${OnlyRemoteComputers},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DAClient') `
                            -Arg ('Set-DAClient', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DAClient
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DAClientDnsConfiguration' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('DirectAccessDnsServers')]
    ${DnsIPAddress},

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

    [Alias('Namespace')]
    ${DnsSuffix},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('SecureNameQueryFallback')]
    ${Local},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('DirectAccessProxyName')]
    ${ProxyServer},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DAClientDnsConfiguration') `
                            -Arg ('Set-DAClientDnsConfiguration', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DAClientDnsConfiguration
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DAEntryPoint' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('EntryPointName')]
    ${Name},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('Session')]
    ${CimSession},

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

    ${GslbIP},

    [Alias('NewEntryPointName')]
    ${NewName},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DAEntryPoint') `
                            -Arg ('Set-DAEntryPoint', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DAEntryPoint
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DAEntryPointDC' `
{
    param(
    
    ${EntryPointName},

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

    [Alias('pv')]
    ${PipelineVariable},

    ${NewDC},

    [Alias('DomainControllerName')]
    ${ExistingDC},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DAEntryPointDC') `
                            -Arg ('Set-DAEntryPointDC', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DAEntryPointDC
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DAMultiSite' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${ManualEntryPointSelectionAllowed},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('EnterpriseName')]
    ${Name},

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

    ${GslbFqdn},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DAMultiSite') `
                            -Arg ('Set-DAMultiSite', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DAMultiSite
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DANetworkLocationServer' `
{
    param(
    
    ${Url},

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

    ${Certificate},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${NlsOnDAServer},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    [switch]
    ${CheckReachability},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DANetworkLocationServer') `
                            -Arg ('Set-DANetworkLocationServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DANetworkLocationServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DAOtpAuthentication' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${CAServer},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    ${SigningCertificateTemplateName},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${CertificateTemplateName},

    [switch]
    ${DisableTwoFactorBypass},

    [Alias('ev')]
    ${ErrorVariable},

    ${UserSecurityGroupName},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

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

    [Alias('cf')]
    [switch]
    ${Confirm},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DAOtpAuthentication') `
                            -Arg ('Set-DAOtpAuthentication', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DAOtpAuthentication
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DAServer' `
{
    param(
    
    ${TeredoState},

    [Alias('wa')]
    ${WarningAction},

    ${EntrypointName},

    ${DAInstallType},

    [switch]
    ${DisableComputerCertAuthentication},

    [Alias('infa')]
    ${InformationAction},

    ${ConnectToAddress},

    [switch]
    ${Force},

    [Alias('wv')]
    ${WarningVariable},

    [switch]
    ${IntermediateRootCertificate},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${HealthCheck},

    [Alias('Session')]
    ${CimSession},

    ${IPsecRootCertificate},

    ${InternalIPv6Prefix},

    ${UserAuthentication},

    [Alias('Cn')]
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

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${ClientIPv6Prefix})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DAServer') `
                            -Arg ('Set-DAServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DAServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RemoteAccess' `
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

    [Alias('pv')]
    ${PipelineVariable},

    ${InternetInterface},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${CapacityKbps},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    ${SslCertificate},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${InternalInterface},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RemoteAccess') `
                            -Arg ('Set-RemoteAccess', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RemoteAccess
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RemoteAccessAccounting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${AccountingOnOffMsg},

    [Alias('Session')]
    ${CimSession},

    [Alias('Timeout')]
    ${RadiusTimeout},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    ${DisableAccountingType},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    ${EnableAccountingType},

    ${SharedSecret},

    [Alias('Port')]
    ${RadiusPort},

    [Alias('ov')]
    ${OutVariable},

    [Alias('Score')]
    ${RadiusScore},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ServerName')]
    ${RadiusServer})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RemoteAccessAccounting') `
                            -Arg ('Set-RemoteAccessAccounting', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RemoteAccessAccounting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RemoteAccessConfiguration' `
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

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [switch]
    ${RestartServiceIfRequired},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('ov')]
    ${OutVariable},

    ${Configuration})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RemoteAccessConfiguration') `
                            -Arg ('Set-RemoteAccessConfiguration', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RemoteAccessConfiguration
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RemoteAccessInboxAccountingStore' `
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

    ${StoreLimit},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RemoteAccessInboxAccountingStore') `
                            -Arg ('Set-RemoteAccessInboxAccountingStore', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RemoteAccessInboxAccountingStore
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RemoteAccessIpFilter' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('FilterAction')]
    ${Action},

    ${Direction},

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

    ${AddressFamily},

    [Alias('Name')]
    ${InterfaceAlias},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RemoteAccessIpFilter') `
                            -Arg ('Set-RemoteAccessIpFilter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RemoteAccessIpFilter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RemoteAccessLoadBalancer' `
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

    ${InternalDedicatedIPAddress},

    [switch]
    ${PassThru},

    [switch]
    ${Disable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ThirdPartyLoadBalancer},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    ${InternetDedicatedIPAddress},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    ${InternetVirtualIPAddress},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${InternalVirtualIPAddress},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${UseThirdPartyLoadBalancer},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RemoteAccessLoadBalancer') `
                            -Arg ('Set-RemoteAccessLoadBalancer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RemoteAccessLoadBalancer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RemoteAccessRadius' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('ob')]
    ${OutBuffer},

    ${EntrypointName},

    ${AccountingOnOffMsg},

    ${Purpose},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${ServerName},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${Port},

    ${Timeout},

    ${MsgAuthenticator},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${SharedSecret},

    [switch]
    ${PassThru},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${Score})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RemoteAccessRadius') `
                            -Arg ('Set-RemoteAccessRadius', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RemoteAccessRadius
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RemoteAccessRoutingDomain' `
{
    param(
    
    ${EnableQoS},

    [Alias('wa')]
    ${WarningAction},

    ${DnsIPAddress},

    ${IPAddressRange},

    ${DHGroup},

    ${InterimAccountingPeriodSec},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${Force},

    [Alias('wv')]
    ${WarningVariable},

    ${TxBandwidthKbps},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${AuthenticationTransformConstant},

    [Alias('Session')]
    ${CimSession},

    [Alias('ev')]
    ${ErrorVariable},

    ${IdleDisconnectSec},

    ${SaLifeTimeSec},

    [Alias('ov')]
    ${OutVariable},

    ${SaRenegotiationDataSizeKB},

    [Alias('infa')]
    ${InformationAction},

    ${IPv6Prefix},

    ${NetBiosIPAddress},

    ${MaximumVpnConnections},

    [switch]
    ${PassThru},

    ${EncryptionType},

    [Alias('iv')]
    ${InformationVariable},

    ${CipherTransformConstant},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${CustomPolicy},

    ${RxBandwidthKbps},

    ${EncryptionMethod},

    ${TenantName},

    [Alias('ob')]
    ${OutBuffer},

    ${PfsGroup},

    [Alias('RoutingDomainName','RoutingDomain')]
    ${Name},

    ${ThrottleLimit},

    ${IntegrityCheckMethod},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RemoteAccessRoutingDomain') `
                            -Arg ('Set-RemoteAccessRoutingDomain', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RemoteAccessRoutingDomain
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-RoutingProtocolPreference' `
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

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    ${Level},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-RoutingProtocolPreference') `
                            -Arg ('Set-RoutingProtocolPreference', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-RoutingProtocolPreference
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-VpnAuthProtocol' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${TunnelAuthProtocolsAdvertised},

    ${CertificateEKUsToAccept},

    [Alias('Session')]
    ${CimSession},

    ${RootCertificateNameToAccept},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    ${CertificateAdvertised},

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

    ${SharedSecret},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${UserAuthProtocolAccepted},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-VpnAuthProtocol') `
                            -Arg ('Set-VpnAuthProtocol', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-VpnAuthProtocol
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-VpnAuthType' `
{
    param(
    
    ${EntrypointName},

    ${Type},

    [Alias('Session')]
    ${CimSession},

    [Alias('Timeout')]
    ${RadiusTimeout},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${AsJob},

    ${MsgAuthenticator},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [Alias('ServerName')]
    ${RadiusServer},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ea')]
    ${ErrorAction},

    ${SharedSecret},

    [Alias('Port')]
    ${RadiusPort},

    [Alias('ov')]
    ${OutVariable},

    [Alias('Score')]
    ${RadiusScore},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('cf')]
    [switch]
    ${Confirm},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-VpnAuthType') `
                            -Arg ('Set-VpnAuthType', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-VpnAuthType
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-VpnIPAddressAssignment' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${IPAssignmentMethod},

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

    [Alias('ov')]
    ${OutVariable},

    ${EntrypointName},

    [Alias('ob')]
    ${OutBuffer},

    ${IPAddressRange},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${IPv6Prefix},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ev')]
    ${ErrorVariable},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-VpnIPAddressAssignment') `
                            -Arg ('Set-VpnIPAddressAssignment', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-VpnIPAddressAssignment
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-VpnS2SInterface' `
{
    param(
    
    ${TxBandwidthKbps},

    [Alias('wa')]
    ${WarningAction},

    ${DHGroup},

    ${Password},

    [Alias('User')]
    ${UserName},

    ${AuthenticationMethod},

    [Alias('FirstIntegrityAlgorithm','OtherHashAlgorithm')]
    ${IntegrityCheckMethod},

    ${RemoteVpnTrafficSelector},

    ${ThrottleLimit},

    [Alias('RetryIntervalSec')]
    ${RetryIntervalSeconds},

    [Alias('IPv4TriggerSubnet')]
    ${IPv4Subnet},

    ${IPv6TriggerFilter},

    [Alias('Cert')]
    ${Certificate},

    ${IPv4TriggerFilterAction},

    ${PromoteAlternate},

    ${InitiateConfigPayload},

    ${AdminStatus},

    ${InternalIPv6},

    [Alias('RemoteTunnelEndpoint','RemoteTunnelHostname','RemoteAddress')]
    ${Destination},

    [Alias('iv')]
    ${InformationVariable},

    ${SourceIpAddress},

    [Alias('ov')]
    ${OutVariable},

    ${EncryptionType},

    [Alias('SARenegotiationDataSizeKB','LifeTimeKiloBytes')]
    ${SADataSizeForRenegotiationKilobytes},

    [Alias('OtherCipherAlgorithm','FirstCipherAlgorithm','CipherTransformConstant')]
    ${CipherTransformConstants},

    ${IPv4Address},

    [Alias('pv')]
    ${PipelineVariable},

    [switch]
    ${CustomPolicy},

    [switch]
    ${AsJob},

    [Alias('IPv6TriggerSubnet')]
    ${IPv6Subnet},

    [Alias('SaLifeTimeSec','LifeTimeSeconds')]
    ${SALifeTimeSeconds},

    [Alias('NetworkOutageTimeSec')]
    ${NetworkOutageTimeSeconds},

    ${IPv6Address},

    ${IPv6TriggerFilterAction},

    ${PostConnectionIPv6Subnet},

    [Alias('infa')]
    ${InformationAction},

    ${ResponderAuthenticationMethod},

    ${EnableQoS},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${PassThru},

    ${LocalVpnTrafficSelector},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${IPv4TriggerFilter},

    [Alias('IdleDurationSeconds','IdleDisconnectSec')]
    ${IdleDisconnectSeconds},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${NumberOfTries},

    ${PostConnectionIPv4Subnet},

    [switch]
    ${GreTunnel},

    [Alias('ea')]
    ${ErrorAction},

    ${EapMethod},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${Persistent},

    [Alias('PfsGroupId')]
    ${PfsGroup},

    [Alias('FirstTransformType','AuthenticationTransformConstant')]
    ${AuthenticationTransformConstants},

    ${RxBandwidthKbps},

    [switch]
    ${Force},

    [Alias('ElementName')]
    ${Name},

    ${RadiusAttributeClass},

    [Alias('Session')]
    ${CimSession},

    ${GreKey},

    [Alias('Encryption')]
    ${EncryptionMethod},

    [Alias('ob')]
    ${OutBuffer},

    ${SharedSecret},

    ${InternalIPv4},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-VpnS2SInterface') `
                            -Arg ('Set-VpnS2SInterface', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-VpnS2SInterface
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Start-BgpPeer' `
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

    [Alias('PeerList','PeerId','PeerName')]
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Start-BgpPeer') `
                            -Arg ('Start-BgpPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Start-BgpPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Stop-BgpPeer' `
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

    [Alias('PeerList','PeerId','PeerName')]
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

    [Alias('ov')]
    ${OutVariable},

    [Alias('RoutingDomainName')]
    ${RoutingDomain},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Stop-BgpPeer') `
                            -Arg ('Stop-BgpPeer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Stop-BgpPeer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Uninstall-RemoteAccess' `
{
    param(
    
    ${EntrypointName},

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

    [Alias('ea')]
    ${ErrorAction},

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

    ${VpnType},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Uninstall-RemoteAccess') `
                            -Arg ('Uninstall-RemoteAccess', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Uninstall-RemoteAccess
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Update-DAMgmtServer' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Update-DAMgmtServer') `
                            -Arg ('Update-DAMgmtServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Update-DAMgmtServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
##############################################################################

& $script:ExportModuleMember -Function @('Get-VpnServerConfiguration', 'Set-VpnServerConfiguration', 'Add-BgpCustomRoute', 'Add-BgpPeer', 'Add-BgpRouter', 'Add-BgpRoutingPolicy', 'Add-BgpRoutingPolicyForPeer', 'Add-DAAppServer', 'Add-DAClient', 'Add-DAClientDnsConfiguration', 'Add-DAEntryPoint', 'Add-DAMgmtServer', 'Add-RemoteAccessIpFilter', 'Add-RemoteAccessLoadBalancerNode', 'Add-RemoteAccessRadius', 'Add-VpnIPAddressRange', 'Add-VpnS2SInterface', 'Clear-RemoteAccessInboxAccountingStore', 'Clear-VpnS2SInterfaceStatistics', 'Connect-VpnS2SInterface', 'Disable-DAMultiSite', 'Disable-DAOtpAuthentication', 'Disable-RemoteAccessRoutingDomain', 'Disconnect-VpnS2SInterface', 'Disconnect-VpnUser', 'Enable-DAMultiSite', 'Enable-DAOtpAuthentication', 'Enable-RemoteAccessRoutingDomain', 'Get-BgpCustomRoute', 'Get-BgpPeer', 'Get-BgpRouteInformation', 'Get-BgpRouter', 'Get-BgpRoutingPolicy', 'Get-BgpStatistics', 'Get-DAAppServer', 'Get-DAClient', 'Get-DAClientDnsConfiguration', 'Get-DAEntryPoint', 'Get-DAEntryPointDC', 'Get-DAMgmtServer', 'Get-DAMultiSite', 'Get-DANetworkLocationServer', 'Get-DAOtpAuthentication', 'Get-DAServer', 'Get-RemoteAccess', 'Get-RemoteAccessAccounting', 'Get-RemoteAccessConfiguration', 'Get-RemoteAccessConnectionStatistics', 'Get-RemoteAccessConnectionStatisticsSummary', 'Get-RemoteAccessHealth', 'Get-RemoteAccessIpFilter', 'Get-RemoteAccessLoadBalancer', 'Get-RemoteAccessRadius', 'Get-RemoteAccessRoutingDomain', 'Get-RemoteAccessUserActivity', 'Get-RoutingProtocolPreference', 'Get-VpnAuthProtocol', 'Get-VpnS2SInterface', 'Get-VpnS2SInterfaceStatistics', 'Install-RemoteAccess', 'New-VpnTrafficSelector', 'Remove-BgpCustomRoute', 'Remove-BgpPeer', 'Remove-BgpRouter', 'Remove-BgpRoutingPolicy', 'Remove-BgpRoutingPolicyForPeer', 'Remove-DAAppServer', 'Remove-DAClient', 'Remove-DAClientDnsConfiguration', 'Remove-DAEntryPoint', 'Remove-DAMgmtServer', 'Remove-RemoteAccessIpFilter', 'Remove-RemoteAccessLoadBalancerNode', 'Remove-RemoteAccessRadius', 'Remove-VpnIPAddressRange', 'Remove-VpnS2SInterface', 'Set-BgpPeer', 'Set-BgpRouter', 'Set-BgpRoutingPolicy', 'Set-BgpRoutingPolicyForPeer', 'Set-DAAppServerConnection', 'Set-DAClient', 'Set-DAClientDnsConfiguration', 'Set-DAEntryPoint', 'Set-DAEntryPointDC', 'Set-DAMultiSite', 'Set-DANetworkLocationServer', 'Set-DAOtpAuthentication', 'Set-DAServer', 'Set-RemoteAccess', 'Set-RemoteAccessAccounting', 'Set-RemoteAccessConfiguration', 'Set-RemoteAccessInboxAccountingStore', 'Set-RemoteAccessIpFilter', 'Set-RemoteAccessLoadBalancer', 'Set-RemoteAccessRadius', 'Set-RemoteAccessRoutingDomain', 'Set-RoutingProtocolPreference', 'Set-VpnAuthProtocol', 'Set-VpnAuthType', 'Set-VpnIPAddressAssignment', 'Set-VpnS2SInterface', 'Start-BgpPeer', 'Stop-BgpPeer', 'Uninstall-RemoteAccess', 'Update-DAMgmtServer')
        
##############################################################################

& $script:SetAlias -Name 'Get-VpnServerIPsecConfiguration' -Value 'Get-VpnServerConfiguration' -Force -Scope script
        
& $script:SetAlias -Name 'Set-VpnServerIPsecConfiguration' -Value 'Set-VpnServerConfiguration' -Force -Scope script
        
& $script:ExportModuleMember -Alias @('Get-VpnServerIPsecConfiguration', 'Set-VpnServerIPsecConfiguration')
        
