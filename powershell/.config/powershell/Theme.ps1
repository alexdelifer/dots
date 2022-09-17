# Enable Theme if oh-my-posh binary is present
try {
    $omp = Get-Command 'oh-my-posh' -ErrorAction Stop
    oh-my-posh init pwsh --config ${MYPSHOME}/spaceship.omp.json | Invoke-Expression
}
catch {
    Write-Error "oh-my-posh binary not in PATH, skipping theme..."
}