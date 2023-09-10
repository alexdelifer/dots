# vmware go away
#Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false
# obviously we want windows on linux...
# this gives us more windowsy keybindings, which seem more natural to me
Set-PSReadlineOption -EditMode Windows
# Sane defaults
#Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
#Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
#Set-PSReadLineKeyHandler -Key 'Ctrl+Spacebar' -Function MenuComplete

Set-PSReadLineOption -PredictionSource HistoryAndPlugin # F2 to switch to inline/list

#Remove-PSReadLineKeyHandler -Chord Ctrl+C
Set-PSReadLineKeyHandler -Chord Ctrl+C -Function Abort