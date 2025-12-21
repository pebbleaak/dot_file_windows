# ────────────────────────────────────────────────
# PowerShell 7 Beautified Profile (dotfile_windows)
# Clean • Modern • Linux-like • Conflict-safe
# ────────────────────────────────────────────────

# 1️⃣ Prompt – Oh My Posh
# Install via: winget install JanDeDobbeleer.OhMyPosh -s winget
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config "$env:USERPROFILE\dotfile_windows\powershell\paradox.omp.json" | Invoke-Expression
}

# 2️⃣ Command-line Experience – PSReadLine
if (Get-Module -ListAvailable PSReadLine) {
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -EditMode Windows
    Set-PSReadLineOption -BellStyle None
}

# 3️⃣ Core navigation & listing (PowerShell-safe)
function ls { Get-ChildItem @args }
function ll { Get-ChildItem -Force @args }
function la { Get-ChildItem -Force @args }
function clear { Clear-Host }

# 4️⃣ Pretty listing (eza) — explicit on purpose
if (Get-Command eza -ErrorAction SilentlyContinue) {
    function lz { eza --group-directories-first --icons @args }
}

# 5️⃣ Text & editor tools (only if installed)
if (Get-Command bat  -ErrorAction SilentlyContinue) { function cat { bat @args } }
if (Get-Command nvim -ErrorAction SilentlyContinue) { Set-Alias vim nvim }

# grep → ripgrep if available, else PowerShell fallback
if (Get-Command rg -ErrorAction SilentlyContinue) {
    function grep { rg @args }
} else {
    Set-Alias grep Select-String
}

# Common helpers
Set-Alias ps  Get-Process
Set-Alias df  Get-Volume
Set-Alias top Get-Process
Set-Alias clr Clear-Host

# 6️⃣ fzf + zoxide
# Install via: winget install junegunn.fzf ; winget install ajeetdsouza.zoxide
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

# 7️⃣ Output color tuning
$PSStyle.FileInfo.Directory  = "`e[38;5;81m"
$PSStyle.FileInfo.Executable = "`e[38;5;208m"

# 8️⃣ Greeting
$version = $PSVersionTable.PSVersion
Write-Host ""
Write-Host "🌟  PowerShell $($version.Major).$($version.Minor) loaded" -ForegroundColor Cyan
Write-Host "📂  Profile: $PROFILE" -ForegroundColor DarkGray
Write-Host ""

# ── Helper functions ────────────────────────────
function Install-LinuxPromptTools {
    $manifest = "$env:USERPROFILE\dotfile_windows\winget-linux-tools.txt"

    if (-not (Test-Path $manifest)) {
        Write-Error "Manifest not found: $manifest"
        return
    }

    $packages = Get-Content $manifest | Where-Object { $_ -and $_.Trim() -ne "" }

    foreach ($pkg in $packages) {
        Write-Host "Installing $pkg via winget..."
        winget install --id $pkg --source winget `
            --accept-source-agreements `
            --accept-package-agreements
    }

    Write-Host "Done installing Linux-style tools."
}


function Update-ScoopTools {
    if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
        Write-Error "scoop not found on PATH."
        return
    }

    $dest = "$env:USERPROFILE\dotfile_windows\scoop-tools.txt"

    scoop list |
        Select-String -NotMatch '^(Name\s+Version|----\s+-------|\s*$)' |
        ForEach-Object { ($_ -split '\s+')[0].Trim() } |
        Where-Object { $_ -ne "" } |
        Sort-Object -Unique |
        Set-Content -Encoding utf8 $dest

    Write-Host "Updated Scoop tool list -> $dest"
}
