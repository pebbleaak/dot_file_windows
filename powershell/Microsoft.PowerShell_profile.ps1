# ────────────────────────────────────────────────
# PowerShell 7 Beautified Profile  (dotted from dotfile_windows)
# ────────────────────────────────────────────────

# 1️⃣  Prompt – Oh My Posh
#  Install via:  winget install JanDeDobbeleer.OhMyPosh -s winget
oh-my-posh init pwsh --config "$env:USERPROFILE\dotfile_windows\powershell\paradox.omp.json" | Invoke-Expression

# 2️⃣  Command-line Experience – PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None

# 3️⃣  Helpful Aliases
Set-Alias ll Get-ChildItem
Set-Alias la "Get-ChildItem -Force"
Set-Alias cat bat
Set-Alias vim nvim
Set-Alias grep Select-String
Set-Alias clr Clear-Host

# 4️⃣  fzf + zoxide Integration
#  Install via: winget install junegunn.fzf ; winget install ajeetdsouza.zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# 5️⃣  Prompt Colors for output consistency
$PSStyle.FileInfo.Directory = "`e[38;5;81m"
$PSStyle.FileInfo.Executable = "`e[38;5;208m"

# 6️⃣  Greeting
$version = $PSVersionTable.PSVersion
Write-Host ""
Write-Host "🌟  PowerShell $($version.Major).$($version.Minor) loaded from dotfile_windows" -ForegroundColor Cyan
Write-Host "📂  Profile: $PROFILE" -ForegroundColor DarkGray
Write-Host ""

# ----- Linux-style Aliases -----
Set-Alias ls Get-ChildItem
Set-Alias ll "Get-ChildItem -Force"
Set-Alias la "Get-ChildItem -Force"
Set-Alias cat bat
Set-Alias grep Select-String
Set-Alias ps Get-Process
Set-Alias df Get-Volume
Set-Alias top Get-Process
Set-Alias clear Clear-Host
