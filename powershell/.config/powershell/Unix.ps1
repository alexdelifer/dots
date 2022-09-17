$PSDefaultParameterValues = @{ 
    "Invoke-Command:Authentication" = 'Negotiate'
    "*-PSSession:Authentication"    = 'Negotiate'
}