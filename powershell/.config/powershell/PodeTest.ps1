Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8383 -Protocol Http
    Add-PodeEndpoint -Address * -Port 2525 -Protocol Smtp

    Add-PodeRoute -Method Get -Path '/' -ScriptBlock {
        Write-PodeJsonResponse -Value @{ 'value' = 'Hello, world!' }
    }
    Add-PodeRoute -Method Get -Path '/ping' -ScriptBlock {
        Write-PodeJsonResponse -Value @{ 'value' = 'pong' }
    }

    # Send-MailMessage -SmtpServer localhost -To 'to@example.com' -From 'from@example.com' -Body 'Hello' -Subject 'Hi there' -Port 2525
    Add-PodeHandler -Type Smtp -Name 'Main' -ScriptBlock {
        Write-Host $SmtpEvent.Email.From
        Write-Host $SmtpEvent.Email.To
        Write-Host $SmtpEvent.Email.Body
    }
}