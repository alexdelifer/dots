
<#
 # Implicit remoting module
 # generated on 12/16/2020 7:52:26 PM
 # by Export-PSSession cmdlet
 # Invoked with the following command line: Export-PSSession -OutputModule ".\DHCP" -Session (get-pssession -Name WinRM5) -CommandName "*-DHCPServer*" -AllowClobber -Force
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
                -InstanceId 6ca710e1-7a5e-4da4-99c2-10a91cd7abc0 `
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
                    -ComputerName $ImplicitDHCP `
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

& $script:SetItem 'function:script:Repair-DhcpServerv4IPRecord' `
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

    [switch]
    ${ReportOnly},

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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Repair-DhcpServerv4IPRecord') `
                            -Arg ('Repair-DhcpServerv4IPRecord', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Repair-DhcpServerv4IPRecord
    # .ForwardHelpCategory Alias
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerInDC' `
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

    ${DnsName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerInDC') `
                            -Arg ('Add-DhcpServerInDC', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerInDC
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerSecurityGroup' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerSecurityGroup') `
                            -Arg ('Add-DhcpServerSecurityGroup', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerSecurityGroup
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4Class' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${Description},

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

    ${Data},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4Class') `
                            -Arg ('Add-DhcpServerv4Class', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4Class
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4ExclusionRange' `
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

    ${EndRange},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${StartRange},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4ExclusionRange') `
                            -Arg ('Add-DhcpServerv4ExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4ExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4Failover' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${MaxClientLeadTime},

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

    ${PartnerServer},

    ${ReservePercent},

    ${AutoStateTransition},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${StateSwitchInterval},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Session')]
    ${CimSession},

    ${ScopeId},

    ${ServerRole},

    ${LoadBalancePercent},

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

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4Failover') `
                            -Arg ('Add-DhcpServerv4Failover', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4Failover
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4FailoverScope' `
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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4FailoverScope') `
                            -Arg ('Add-DhcpServerv4FailoverScope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4FailoverScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4Filter' `
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

    [Alias('ClientId')]
    ${MacAddress},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4Filter') `
                            -Arg ('Add-DhcpServerv4Filter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4Filter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4Lease' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${ProbationEnds},

    ${DnsRegistration},

    ${AddressState},

    ${LeaseExpiryTime},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('wv')]
    ${WarningVariable},

    ${NapCapable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${IPAddress},

    ${ScopeId},

    ${PolicyName},

    ${ClientId},

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

    ${NapStatus},

    [Alias('iv')]
    ${InformationVariable},

    [Alias('pv')]
    ${PipelineVariable},

    ${ClientType},

    ${HostName},

    ${DnsRR},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4Lease') `
                            -Arg ('Add-DhcpServerv4Lease', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4Lease
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4MulticastExclusionRange' `
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

    ${EndRange},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${StartRange},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4MulticastExclusionRange') `
                            -Arg ('Add-DhcpServerv4MulticastExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4MulticastExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4MulticastScope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${Description},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${LeaseDuration},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${EndRange},

    [switch]
    ${PassThru},

    ${ExpiryTime},

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${StartRange},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    ${Ttl},

    [Alias('ob')]
    ${OutBuffer},

    ${State},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${AsJob},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4MulticastScope') `
                            -Arg ('Add-DhcpServerv4MulticastScope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4MulticastScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4OptionDefinition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${VendorClass},

    ${Type},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    ${DefaultValue},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ob')]
    ${OutBuffer},

    ${Description},

    ${OptionId},

    [switch]
    ${MultiValued},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4OptionDefinition') `
                            -Arg ('Add-DhcpServerv4OptionDefinition', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4OptionDefinition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4Policy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${MacAddress},

    ${Description},

    ${Fqdn},

    ${Enabled},

    ${RemoteId},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    ${SubscriberId},

    ${ProcessingOrder},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${CircuitId},

    ${RelayAgent},

    [Alias('Session')]
    ${CimSession},

    ${ScopeId},

    ${LeaseDuration},

    ${VendorClass},

    ${ClientId},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

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

    [Alias('db')]
    [switch]
    ${Debug},

    ${ThrottleLimit},

    ${UserClass},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4Policy') `
                            -Arg ('Add-DhcpServerv4Policy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4Policy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4PolicyIPRange' `
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

    ${EndRange},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${StartRange},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4PolicyIPRange') `
                            -Arg ('Add-DhcpServerv4PolicyIPRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4PolicyIPRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4Reservation' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ReservationDescription')]
    ${Description},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
    ${IPAddress},

    [Alias('Session')]
    ${CimSession},

    ${ClientId},

    [Alias('infa')]
    ${InformationAction},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('HostName','ReservationName')]
    ${Name},

    [Alias('ReservationType')]
    ${Type},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ReservationScopeID')]
    ${ScopeId},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn','ReservationServer')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4Reservation') `
                            -Arg ('Add-DhcpServerv4Reservation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4Reservation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4Scope' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${MaxBootpClients},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    ${State},

    [Alias('Session')]
    ${CimSession},

    ${LeaseDuration},

    ${SuperscopeName},

    ${StartRange},

    ${EndRange},

    [Alias('Cn')]
    ${ComputerName},

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

    ${ActivatePolicies},

    [Alias('iv')]
    ${InformationVariable},

    ${Type},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${SubnetMask},

    ${NapProfile},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${NapEnable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${Delay})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4Scope') `
                            -Arg ('Add-DhcpServerv4Scope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4Scope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv4Superscope' `
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

    ${SuperscopeName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv4Superscope') `
                            -Arg ('Add-DhcpServerv4Superscope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv4Superscope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv6Class' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${Description},

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

    ${VendorId},

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

    ${Type},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${Data},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv6Class') `
                            -Arg ('Add-DhcpServerv6Class', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv6Class
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv6ExclusionRange' `
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

    ${EndRange},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${StartRange},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv6ExclusionRange') `
                            -Arg ('Add-DhcpServerv6ExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv6ExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv6Lease' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${ClientDuid},

    ${Description},

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

    [Alias('wa')]
    ${WarningAction},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${Iaid},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${HostName},

    [Alias('ob')]
    ${OutBuffer},

    ${LeaseExpiryTime},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${AddressType},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv6Lease') `
                            -Arg ('Add-DhcpServerv6Lease', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv6Lease
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv6OptionDefinition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${VendorClass},

    ${Type},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    ${DefaultValue},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ov')]
    ${OutVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('infa')]
    ${InformationAction},

    [Alias('ob')]
    ${OutBuffer},

    ${Description},

    ${OptionId},

    [switch]
    ${MultiValued},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv6OptionDefinition') `
                            -Arg ('Add-DhcpServerv6OptionDefinition', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv6OptionDefinition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv6Reservation' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('Duid')]
    ${ClientDuid},

    [Alias('ReservationDescription')]
    ${Description},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
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

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('HostName','ReservationName')]
    ${Name},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('ReservationScopeID')]
    ${Prefix},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

    [Alias('ob')]
    ${OutBuffer},

    ${Iaid},

    [Alias('Cn','ReservationServer')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv6Reservation') `
                            -Arg ('Add-DhcpServerv6Reservation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv6Reservation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Add-DhcpServerv6Scope' `
{
    param(
    
    ${Prefix},

    [Alias('ob')]
    ${OutBuffer},

    ${Description},

    ${PreferredLifetime},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${T2},

    [Alias('wv')]
    ${WarningVariable},

    ${ValidLifeTime},

    [Alias('ea')]
    ${ErrorAction},

    ${State},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${T1},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${Preference},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('wa')]
    ${WarningAction})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Add-DhcpServerv6Scope') `
                            -Arg ('Add-DhcpServerv6Scope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Add-DhcpServerv6Scope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Backup-DhcpServer' `
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

    ${Path},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Backup-DhcpServer') `
                            -Arg ('Backup-DhcpServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Backup-DhcpServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Export-DhcpServer' `
{
    param(
    
    [switch]
    ${Leases},

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

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    ${File},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Export-DhcpServer') `
                            -Arg ('Export-DhcpServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Export-DhcpServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerAuditLog' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerAuditLog') `
                            -Arg ('Get-DhcpServerAuditLog', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerAuditLog
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerDatabase' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerDatabase') `
                            -Arg ('Get-DhcpServerDatabase', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerDatabase
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerDnsCredential' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerDnsCredential') `
                            -Arg ('Get-DhcpServerDnsCredential', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerDnsCredential
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerInDC' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerInDC') `
                            -Arg ('Get-DhcpServerInDC', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerInDC
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerSetting' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerSetting') `
                            -Arg ('Get-DhcpServerSetting', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Binding' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Binding') `
                            -Arg ('Get-DhcpServerv4Binding', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Binding
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Class' `
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

    ${Name},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Class') `
                            -Arg ('Get-DhcpServerv4Class', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Class
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4DnsSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
    ${IPAddress},

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

    ${PolicyName},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4DnsSetting') `
                            -Arg ('Get-DhcpServerv4DnsSetting', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4DnsSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4ExclusionRange' `
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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4ExclusionRange') `
                            -Arg ('Get-DhcpServerv4ExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4ExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Failover' `
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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Failover') `
                            -Arg ('Get-DhcpServerv4Failover', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Failover
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Filter' `
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

    ${List},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Filter') `
                            -Arg ('Get-DhcpServerv4Filter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Filter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4FilterList' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4FilterList') `
                            -Arg ('Get-DhcpServerv4FilterList', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4FilterList
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4FreeIPAddress' `
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

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${StartAddress},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${NumAddress},

    ${EndAddress},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4FreeIPAddress') `
                            -Arg ('Get-DhcpServerv4FreeIPAddress', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4FreeIPAddress
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Lease' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('iv')]
    ${InformationVariable},

    ${ClientId},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${BadLeases},

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

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    ${IPAddress},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${AllLeases})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Lease') `
                            -Arg ('Get-DhcpServerv4Lease', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Lease
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4MulticastExclusionRange' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4MulticastExclusionRange') `
                            -Arg ('Get-DhcpServerv4MulticastExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4MulticastExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4MulticastLease' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4MulticastLease') `
                            -Arg ('Get-DhcpServerv4MulticastLease', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4MulticastLease
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4MulticastScope' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4MulticastScope') `
                            -Arg ('Get-DhcpServerv4MulticastScope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4MulticastScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4MulticastScopeStatistics' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4MulticastScopeStatistics') `
                            -Arg ('Get-DhcpServerv4MulticastScopeStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4MulticastScopeStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4OptionDefinition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('Name')]
    ${VendorClass},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

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

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4OptionDefinition') `
                            -Arg ('Get-DhcpServerv4OptionDefinition', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4OptionDefinition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4OptionValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('IPAddress')]
    ${ReservedIP},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${UserClass},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${Brief},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${PolicyName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    ${VendorClass},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4OptionValue') `
                            -Arg ('Get-DhcpServerv4OptionValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4OptionValue
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Policy' `
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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Policy') `
                            -Arg ('Get-DhcpServerv4Policy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Policy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4PolicyIPRange' `
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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4PolicyIPRange') `
                            -Arg ('Get-DhcpServerv4PolicyIPRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4PolicyIPRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Reservation' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${ClientId},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
    ${IPAddress},

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

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ReservationScopeID')]
    ${ScopeId},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn','ReservationServer')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Reservation') `
                            -Arg ('Get-DhcpServerv4Reservation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Reservation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Scope' `
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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Scope') `
                            -Arg ('Get-DhcpServerv4Scope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Scope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4ScopeStatistics' `
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

    [switch]
    ${Failover},

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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4ScopeStatistics') `
                            -Arg ('Get-DhcpServerv4ScopeStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4ScopeStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Statistics' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Statistics') `
                            -Arg ('Get-DhcpServerv4Statistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Statistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4Superscope' `
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

    ${SuperscopeName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4Superscope') `
                            -Arg ('Get-DhcpServerv4Superscope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4Superscope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv4SuperscopeStatistics' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv4SuperscopeStatistics') `
                            -Arg ('Get-DhcpServerv4SuperscopeStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv4SuperscopeStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6Binding' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6Binding') `
                            -Arg ('Get-DhcpServerv6Binding', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6Binding
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6Class' `
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

    ${Name},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6Class') `
                            -Arg ('Get-DhcpServerv6Class', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6Class
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6DnsSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
    ${IPAddress},

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

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6DnsSetting') `
                            -Arg ('Get-DhcpServerv6DnsSetting', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6DnsSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6ExclusionRange' `
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

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6ExclusionRange') `
                            -Arg ('Get-DhcpServerv6ExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6ExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6FreeIPAddress' `
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

    ${StartAddress},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ev')]
    ${ErrorVariable},

    ${Prefix},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

    ${NumAddress},

    ${EndAddress},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6FreeIPAddress') `
                            -Arg ('Get-DhcpServerv6FreeIPAddress', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6FreeIPAddress
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6Lease' `
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

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('ev')]
    ${ErrorVariable},

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6Lease') `
                            -Arg ('Get-DhcpServerv6Lease', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6Lease
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6OptionDefinition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('Name')]
    ${VendorClass},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

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

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6OptionDefinition') `
                            -Arg ('Get-DhcpServerv6OptionDefinition', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6OptionDefinition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6OptionValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('IPAddress')]
    ${ReservedIP},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${UserClass},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${Brief},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    ${VendorClass},

    [Alias('ev')]
    ${ErrorVariable},

    ${Prefix},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

    [Alias('ob')]
    ${OutBuffer},

    [switch]
    ${All},

    [Alias('wa')]
    ${WarningAction},

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6OptionValue') `
                            -Arg ('Get-DhcpServerv6OptionValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6OptionValue
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6Reservation' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
    ${IPAddress},

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

    [Alias('ReservationScopeID')]
    ${Prefix},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn','ReservationServer')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6Reservation') `
                            -Arg ('Get-DhcpServerv6Reservation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6Reservation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6Scope' `
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

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6Scope') `
                            -Arg ('Get-DhcpServerv6Scope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6Scope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6ScopeStatistics' `
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

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6ScopeStatistics') `
                            -Arg ('Get-DhcpServerv6ScopeStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6ScopeStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6StatelessStatistics' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6StatelessStatistics') `
                            -Arg ('Get-DhcpServerv6StatelessStatistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6StatelessStatistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6StatelessStore' `
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

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6StatelessStore') `
                            -Arg ('Get-DhcpServerv6StatelessStore', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6StatelessStore
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerv6Statistics' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerv6Statistics') `
                            -Arg ('Get-DhcpServerv6Statistics', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerv6Statistics
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Get-DhcpServerVersion' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Get-DhcpServerVersion') `
                            -Arg ('Get-DhcpServerVersion', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Get-DhcpServerVersion
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Import-DhcpServer' `
{
    param(
    
    [switch]
    ${Leases},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [switch]
    ${ServerConfigOnly},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    ${File},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

    ${Prefix},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('wa')]
    ${WarningAction},

    ${BackupPath},

    [Alias('ov')]
    ${OutVariable},

    [switch]
    ${ScopeOverwrite},

    [Alias('cf')]
    [switch]
    ${Confirm},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Import-DhcpServer') `
                            -Arg ('Import-DhcpServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Import-DhcpServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Invoke-DhcpServerv4FailoverReplication' `
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

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Invoke-DhcpServerv4FailoverReplication') `
                            -Arg ('Invoke-DhcpServerv4FailoverReplication', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Invoke-DhcpServerv4FailoverReplication
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerDnsCredential' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerDnsCredential') `
                            -Arg ('Remove-DhcpServerDnsCredential', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerDnsCredential
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerInDC' `
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

    ${DnsName},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerInDC') `
                            -Arg ('Remove-DhcpServerInDC', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerInDC
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4Class' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4Class') `
                            -Arg ('Remove-DhcpServerv4Class', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4Class
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4ExclusionRange' `
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

    ${EndRange},

    [switch]
    ${Passthru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${StartRange},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4ExclusionRange') `
                            -Arg ('Remove-DhcpServerv4ExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4ExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4Failover' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4Failover') `
                            -Arg ('Remove-DhcpServerv4Failover', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4Failover
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4FailoverScope' `
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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4FailoverScope') `
                            -Arg ('Remove-DhcpServerv4FailoverScope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4FailoverScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4Filter' `
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

    [Alias('ClientId')]
    ${MacAddress},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4Filter') `
                            -Arg ('Remove-DhcpServerv4Filter', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4Filter
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4Lease' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${ClientId},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [switch]
    ${BadLeases},

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

    ${ScopeId},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    ${IPAddress},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4Lease') `
                            -Arg ('Remove-DhcpServerv4Lease', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4Lease
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4MulticastExclusionRange' `
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

    ${EndRange},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${StartRange},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4MulticastExclusionRange') `
                            -Arg ('Remove-DhcpServerv4MulticastExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4MulticastExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4MulticastLease' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4MulticastLease') `
                            -Arg ('Remove-DhcpServerv4MulticastLease', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4MulticastLease
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4MulticastScope' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4MulticastScope') `
                            -Arg ('Remove-DhcpServerv4MulticastScope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4MulticastScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4OptionDefinition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${VendorClass},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${Passthru},

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

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4OptionDefinition') `
                            -Arg ('Remove-DhcpServerv4OptionDefinition', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4OptionDefinition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4OptionValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('IPAddress')]
    ${ReservedIP},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${UserClass},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    ${VendorClass},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${PolicyName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wa')]
    ${WarningAction},

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4OptionValue') `
                            -Arg ('Remove-DhcpServerv4OptionValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4OptionValue
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4Policy' `
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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4Policy') `
                            -Arg ('Remove-DhcpServerv4Policy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4Policy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4PolicyIPRange' `
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

    ${EndRange},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${Name},

    ${StartRange},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4PolicyIPRange') `
                            -Arg ('Remove-DhcpServerv4PolicyIPRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4PolicyIPRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4Reservation' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${ClientId},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
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

    [Alias('ob')]
    ${OutBuffer},

    [Alias('ReservationScopeID')]
    ${ScopeId},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn','ReservationServer')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4Reservation') `
                            -Arg ('Remove-DhcpServerv4Reservation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4Reservation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4Scope' `
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
    ${Passthru},

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

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4Scope') `
                            -Arg ('Remove-DhcpServerv4Scope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4Scope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv4Superscope' `
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
    ${Passthru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${SuperscopeName},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${ScopeId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv4Superscope') `
                            -Arg ('Remove-DhcpServerv4Superscope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv4Superscope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv6Class' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv6Class') `
                            -Arg ('Remove-DhcpServerv6Class', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv6Class
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv6ExclusionRange' `
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

    ${EndRange},

    [switch]
    ${Passthru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${StartRange},

    [Alias('infa')]
    ${InformationAction},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv6ExclusionRange') `
                            -Arg ('Remove-DhcpServerv6ExclusionRange', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv6ExclusionRange
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv6Lease' `
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

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv6Lease') `
                            -Arg ('Remove-DhcpServerv6Lease', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv6Lease
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv6OptionDefinition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${VendorClass},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${Passthru},

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

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv6OptionDefinition') `
                            -Arg ('Remove-DhcpServerv6OptionDefinition', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv6OptionDefinition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv6OptionValue' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('IPAddress')]
    ${ReservedIP},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${UserClass},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    ${VendorClass},

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

    ${Prefix},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv6OptionValue') `
                            -Arg ('Remove-DhcpServerv6OptionValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv6OptionValue
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv6Reservation' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
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

    [Alias('ReservationScopeID')]
    ${Prefix},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn','ReservationServer')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv6Reservation') `
                            -Arg ('Remove-DhcpServerv6Reservation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv6Reservation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Remove-DhcpServerv6Scope' `
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
    ${Passthru},

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

    ${Prefix},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Remove-DhcpServerv6Scope') `
                            -Arg ('Remove-DhcpServerv6Scope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Remove-DhcpServerv6Scope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Rename-DhcpServerv4Superscope' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

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

    [Alias('ev')]
    ${ErrorVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('ob')]
    ${OutBuffer},

    ${NewName},

    [Alias('wa')]
    ${WarningAction},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Rename-DhcpServerv4Superscope') `
                            -Arg ('Rename-DhcpServerv4Superscope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Rename-DhcpServerv4Superscope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Restore-DhcpServer' `
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Restore-DhcpServer') `
                            -Arg ('Restore-DhcpServer', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Restore-DhcpServer
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerAuditLog' `
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

    [Alias('cf')]
    [switch]
    ${Confirm},

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

    ${DiskCheckInterval},

    ${Path},

    ${MaxMBFileSize},

    ${MinMBDiskSpace},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerAuditLog') `
                            -Arg ('Set-DhcpServerAuditLog', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerAuditLog
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerDatabase' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${RestoreFromBackup},

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

    ${CleanupInterval},

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

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('wa')]
    ${WarningAction},

    ${BackupPath},

    [Alias('ov')]
    ${OutVariable},

    ${BackupInterval},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerDatabase') `
                            -Arg ('Set-DhcpServerDatabase', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerDatabase
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerDnsCredential' `
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

    ${Credential},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerDnsCredential') `
                            -Arg ('Set-DhcpServerDnsCredential', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerDnsCredential
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerSetting' `
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

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('db')]
    [switch]
    ${Debug},

    ${ActivatePolicies},

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

    ${NpsUnreachableAction},

    [Alias('ob')]
    ${OutBuffer},

    ${ConflictDetectionAttempts},

    [Alias('wa')]
    ${WarningAction},

    ${NapEnabled},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerSetting') `
                            -Arg ('Set-DhcpServerSetting', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4Binding' `
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

    ${BindingState},

    [Alias('cf')]
    [switch]
    ${Confirm},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4Binding') `
                            -Arg ('Set-DhcpServerv4Binding', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4Binding
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4Class' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${Description},

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

    ${Data},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4Class') `
                            -Arg ('Set-DhcpServerv4Class', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4Class
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4DnsSetting' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${NameProtection},

    ${DeleteDnsRROnLeaseExpiry},

    ${DisableDnsPtrRRUpdate},

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

    [Alias('Session')]
    ${CimSession},

    [Alias('ReservedIP')]
    ${IPAddress},

    ${ScopeId},

    ${DynamicUpdates},

    ${PolicyName},

    ${DnsSuffix},

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

    ${UpdateDnsRRForOlderClients},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4DnsSetting') `
                            -Arg ('Set-DhcpServerv4DnsSetting', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4DnsSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4Failover' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('ob')]
    ${OutBuffer},

    ${MaxClientLeadTime},

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

    ${ReservePercent},

    ${AutoStateTransition},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${StateSwitchInterval},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Session')]
    ${CimSession},

    ${LoadBalancePercent},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PartnerDown},

    [Alias('ov')]
    ${OutVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${SharedSecret},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4Failover') `
                            -Arg ('Set-DhcpServerv4Failover', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4Failover
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4FilterList' `
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

    ${Deny},

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

    ${Allow},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4FilterList') `
                            -Arg ('Set-DhcpServerv4FilterList', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4FilterList
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4MulticastScope' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('ob')]
    ${OutBuffer},

    ${LeaseDuration},

    ${Description},

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

    [Alias('ea')]
    ${ErrorAction},

    ${State},

    [Alias('Session')]
    ${CimSession},

    ${ExpiryTime},

    ${StartRange},

    ${EndRange},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NewName},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [switch]
    ${PassThru},

    ${Ttl},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

    [Alias('vb')]
    [switch]
    ${Verbose},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4MulticastScope') `
                            -Arg ('Set-DhcpServerv4MulticastScope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4MulticastScope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4OptionDefinition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${VendorClass},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    ${DefaultValue},

    [Alias('db')]
    [switch]
    ${Debug},

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

    ${Description},

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4OptionDefinition') `
                            -Arg ('Set-DhcpServerv4OptionDefinition', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4OptionDefinition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4OptionValue' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    [Alias('IPAddress')]
    ${ReservedIP},

    ${DnsServer},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [switch]
    ${Force},

    [Alias('wv')]
    ${WarningVariable},

    ${Wpad},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${Router},

    [Alias('Session')]
    ${CimSession},

    ${ScopeId},

    ${VendorClass},

    ${PolicyName},

    ${WinsServer},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${Value},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${OptionId},

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

    ${UserClass},

    [switch]
    ${AsJob},

    ${DnsDomain})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4OptionValue') `
                            -Arg ('Set-DhcpServerv4OptionValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4OptionValue
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4Policy' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${MacAddress},

    ${Description},

    ${Fqdn},

    ${Enabled},

    ${RemoteId},

    ${Condition},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${SubscriberId},

    ${ProcessingOrder},

    [Alias('wv')]
    ${WarningVariable},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    ${CircuitId},

    ${RelayAgent},

    [Alias('Session')]
    ${CimSession},

    ${ScopeId},

    ${LeaseDuration},

    ${ClientId},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${NewName},

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

    ${VendorClass},

    ${ThrottleLimit},

    ${UserClass},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4Policy') `
                            -Arg ('Set-DhcpServerv4Policy', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4Policy
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4Reservation' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${ClientId},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
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

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('HostName','ReservationName')]
    ${Name},

    [Alias('ReservationType')]
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

    [Alias('ReservationDescription')]
    ${Description},

    [Alias('Cn','ReservationServer')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4Reservation') `
                            -Arg ('Set-DhcpServerv4Reservation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4Reservation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv4Scope' `
{
    param(
    
    [Alias('wa')]
    ${WarningAction},

    ${Description},

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

    ${ActivatePolicies},

    ${State},

    [Alias('ea')]
    ${ErrorAction},

    [Alias('Session')]
    ${CimSession},

    ${ScopeId},

    ${LeaseDuration},

    ${SuperscopeName},

    ${StartRange},

    ${EndRange},

    [Alias('Cn')]
    ${ComputerName},

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

    [Alias('iv')]
    ${InformationVariable},

    ${Type},

    [Alias('pv')]
    ${PipelineVariable},

    ${Delay},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${NapProfile},

    [Alias('ob')]
    ${OutBuffer},

    ${NapEnable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    ${MaxBootpClients})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv4Scope') `
                            -Arg ('Set-DhcpServerv4Scope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv4Scope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv6Binding' `
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

    ${BindingState},

    [Alias('cf')]
    [switch]
    ${Confirm},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv6Binding') `
                            -Arg ('Set-DhcpServerv6Binding', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv6Binding
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv6Class' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('pv')]
    ${PipelineVariable},

    ${Description},

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

    ${VendorId},

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

    ${Type},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${Data},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv6Class') `
                            -Arg ('Set-DhcpServerv6Class', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv6Class
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv6DnsSetting' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
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

    ${NameProtection},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ob')]
    ${OutBuffer},

    ${DynamicUpdates},

    ${Prefix},

    [switch]
    ${AsJob},

    ${ThrottleLimit},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('wa')]
    ${WarningAction},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${DeleteDnsRROnLeaseExpiry},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv6DnsSetting') `
                            -Arg ('Set-DhcpServerv6DnsSetting', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv6DnsSetting
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv6OptionDefinition' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    ${VendorClass},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('Cn')]
    ${ComputerName},

    [switch]
    ${PassThru},

    [Alias('wa')]
    ${WarningAction},

    ${DefaultValue},

    [Alias('db')]
    [switch]
    ${Debug},

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

    ${Description},

    ${OptionId},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv6OptionDefinition') `
                            -Arg ('Set-DhcpServerv6OptionDefinition', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv6OptionDefinition
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv6OptionValue' `
{
    param(
    
    ${Prefix},

    [Alias('wa')]
    ${WarningAction},

    ${InfoRefreshTime},

    [Alias('IPAddress')]
    ${ReservedIP},

    ${DnsServer},

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

    [Alias('ea')]
    ${ErrorAction},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('Session')]
    ${CimSession},

    ${DomainSearchList},

    ${VendorClass},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    ${Value},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${OptionId},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    [Alias('ob')]
    ${OutBuffer},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

    ${UserClass},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv6OptionValue') `
                            -Arg ('Set-DhcpServerv6OptionValue', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv6OptionValue
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv6Reservation' `
{
    param(
    
    [Alias('ea')]
    ${ErrorAction},

    [Alias('Duid')]
    ${ClientDuid},

    [Alias('ReservationDescription')]
    ${Description},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ReservedIP')]
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

    [Alias('wa')]
    ${WarningAction},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('HostName','ReservationName')]
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

    ${Iaid},

    [Alias('Cn','ReservationServer')]
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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv6Reservation') `
                            -Arg ('Set-DhcpServerv6Reservation', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv6Reservation
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv6Scope' `
{
    param(
    
    ${Prefix},

    [Alias('ob')]
    ${OutBuffer},

    ${Description},

    ${PreferredLifeTime},

    ${Name},

    [Alias('ev')]
    ${ErrorVariable},

    [Alias('infa')]
    ${InformationAction},

    [Alias('db')]
    [switch]
    ${Debug},

    ${T2},

    [Alias('wv')]
    ${WarningVariable},

    ${ValidLifeTime},

    [Alias('ea')]
    ${ErrorAction},

    ${State},

    [Alias('Session')]
    ${CimSession},

    [Alias('Cn')]
    ${ComputerName},

    [Alias('ov')]
    ${OutVariable},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('cf')]
    [switch]
    ${Confirm},

    ${T1},

    [switch]
    ${PassThru},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('wi')]
    [switch]
    ${WhatIf},

    ${Preference},

    [Alias('iv')]
    ${InformationVariable},

    ${ThrottleLimit},

    [switch]
    ${AsJob},

    [Alias('wa')]
    ${WarningAction})

    Begin {
        try {
            $positionalArguments = & $script:NewObject collections.arraylist
            foreach ($parameterName in $PSBoundParameters.BoundPositionally)
            {
                $null = $positionalArguments.Add( $PSBoundParameters[$parameterName] )
                $null = $PSBoundParameters.Remove($parameterName)
            }
            $positionalArguments.AddRange($args)

            $clientSideParameters = Get-PSImplicitRemotingClientSideParameters $PSBoundParameters $True

            $scriptCmd = { & $script:InvokeCommand `
                            @clientSideParameters `
                            -HideComputerName `
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv6Scope') `
                            -Arg ('Set-DhcpServerv6Scope', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv6Scope
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
& $script:SetItem 'function:script:Set-DhcpServerv6StatelessStore' `
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

    ${PurgeInterval},

    [Alias('pv')]
    ${PipelineVariable},

    [Alias('cf')]
    [switch]
    ${Confirm},

    [Alias('ev')]
    ${ErrorVariable},

    ${Prefix},

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

    ${Enabled},

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
                            -Session (Get-PSImplicitRemotingSession -CommandName 'Set-DhcpServerv6StatelessStore') `
                            -Arg ('Set-DhcpServerv6StatelessStore', $PSBoundParameters, $positionalArguments) `
                            -Script { param($name, $boundParams, $unboundParams) & $name @boundParams @unboundParams } `
                         }

            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
        } catch {
            throw
        }
    }
    Process { 
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
 }
    End { 
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
 }

    # .ForwardHelpTargetName Set-DhcpServerv6StatelessStore
    # .ForwardHelpCategory Function
    # .RemoteHelpRunspace PSSession
}
        
##############################################################################

& $script:ExportModuleMember -Function @('Repair-DhcpServerv4IPRecord', 'Add-DhcpServerInDC', 'Add-DhcpServerSecurityGroup', 'Add-DhcpServerv4Class', 'Add-DhcpServerv4ExclusionRange', 'Add-DhcpServerv4Failover', 'Add-DhcpServerv4FailoverScope', 'Add-DhcpServerv4Filter', 'Add-DhcpServerv4Lease', 'Add-DhcpServerv4MulticastExclusionRange', 'Add-DhcpServerv4MulticastScope', 'Add-DhcpServerv4OptionDefinition', 'Add-DhcpServerv4Policy', 'Add-DhcpServerv4PolicyIPRange', 'Add-DhcpServerv4Reservation', 'Add-DhcpServerv4Scope', 'Add-DhcpServerv4Superscope', 'Add-DhcpServerv6Class', 'Add-DhcpServerv6ExclusionRange', 'Add-DhcpServerv6Lease', 'Add-DhcpServerv6OptionDefinition', 'Add-DhcpServerv6Reservation', 'Add-DhcpServerv6Scope', 'Backup-DhcpServer', 'Export-DhcpServer', 'Get-DhcpServerAuditLog', 'Get-DhcpServerDatabase', 'Get-DhcpServerDnsCredential', 'Get-DhcpServerInDC', 'Get-DhcpServerSetting', 'Get-DhcpServerv4Binding', 'Get-DhcpServerv4Class', 'Get-DhcpServerv4DnsSetting', 'Get-DhcpServerv4ExclusionRange', 'Get-DhcpServerv4Failover', 'Get-DhcpServerv4Filter', 'Get-DhcpServerv4FilterList', 'Get-DhcpServerv4FreeIPAddress', 'Get-DhcpServerv4Lease', 'Get-DhcpServerv4MulticastExclusionRange', 'Get-DhcpServerv4MulticastLease', 'Get-DhcpServerv4MulticastScope', 'Get-DhcpServerv4MulticastScopeStatistics', 'Get-DhcpServerv4OptionDefinition', 'Get-DhcpServerv4OptionValue', 'Get-DhcpServerv4Policy', 'Get-DhcpServerv4PolicyIPRange', 'Get-DhcpServerv4Reservation', 'Get-DhcpServerv4Scope', 'Get-DhcpServerv4ScopeStatistics', 'Get-DhcpServerv4Statistics', 'Get-DhcpServerv4Superscope', 'Get-DhcpServerv4SuperscopeStatistics', 'Get-DhcpServerv6Binding', 'Get-DhcpServerv6Class', 'Get-DhcpServerv6DnsSetting', 'Get-DhcpServerv6ExclusionRange', 'Get-DhcpServerv6FreeIPAddress', 'Get-DhcpServerv6Lease', 'Get-DhcpServerv6OptionDefinition', 'Get-DhcpServerv6OptionValue', 'Get-DhcpServerv6Reservation', 'Get-DhcpServerv6Scope', 'Get-DhcpServerv6ScopeStatistics', 'Get-DhcpServerv6StatelessStatistics', 'Get-DhcpServerv6StatelessStore', 'Get-DhcpServerv6Statistics', 'Get-DhcpServerVersion', 'Import-DhcpServer', 'Invoke-DhcpServerv4FailoverReplication', 'Remove-DhcpServerDnsCredential', 'Remove-DhcpServerInDC', 'Remove-DhcpServerv4Class', 'Remove-DhcpServerv4ExclusionRange', 'Remove-DhcpServerv4Failover', 'Remove-DhcpServerv4FailoverScope', 'Remove-DhcpServerv4Filter', 'Remove-DhcpServerv4Lease', 'Remove-DhcpServerv4MulticastExclusionRange', 'Remove-DhcpServerv4MulticastLease', 'Remove-DhcpServerv4MulticastScope', 'Remove-DhcpServerv4OptionDefinition', 'Remove-DhcpServerv4OptionValue', 'Remove-DhcpServerv4Policy', 'Remove-DhcpServerv4PolicyIPRange', 'Remove-DhcpServerv4Reservation', 'Remove-DhcpServerv4Scope', 'Remove-DhcpServerv4Superscope', 'Remove-DhcpServerv6Class', 'Remove-DhcpServerv6ExclusionRange', 'Remove-DhcpServerv6Lease', 'Remove-DhcpServerv6OptionDefinition', 'Remove-DhcpServerv6OptionValue', 'Remove-DhcpServerv6Reservation', 'Remove-DhcpServerv6Scope', 'Rename-DhcpServerv4Superscope', 'Restore-DhcpServer', 'Set-DhcpServerAuditLog', 'Set-DhcpServerDatabase', 'Set-DhcpServerDnsCredential', 'Set-DhcpServerSetting', 'Set-DhcpServerv4Binding', 'Set-DhcpServerv4Class', 'Set-DhcpServerv4DnsSetting', 'Set-DhcpServerv4Failover', 'Set-DhcpServerv4FilterList', 'Set-DhcpServerv4MulticastScope', 'Set-DhcpServerv4OptionDefinition', 'Set-DhcpServerv4OptionValue', 'Set-DhcpServerv4Policy', 'Set-DhcpServerv4Reservation', 'Set-DhcpServerv4Scope', 'Set-DhcpServerv6Binding', 'Set-DhcpServerv6Class', 'Set-DhcpServerv6DnsSetting', 'Set-DhcpServerv6OptionDefinition', 'Set-DhcpServerv6OptionValue', 'Set-DhcpServerv6Reservation', 'Set-DhcpServerv6Scope', 'Set-DhcpServerv6StatelessStore')
        
##############################################################################

& $script:SetAlias -Name 'Reconcile-DhcpServerv4IPRecord' -Value 'Repair-DhcpServerv4IPRecord' -Force -Scope script
        
& $script:ExportModuleMember -Alias @('Reconcile-DhcpServerv4IPRecord')
        
