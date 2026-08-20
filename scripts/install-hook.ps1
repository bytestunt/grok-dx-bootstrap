#!/usr/bin/env pwsh
# grok-dx install helper (run by the agent or the user).
# Installs the session-lifecycle helper hook into the user's global Grok hooks dir.
$ErrorActionPreference = "Stop"
$hooksDir = Join-Path $Env:USERPROFILE ".grok\hooks"
New-Item -ItemType Directory -Force -Path $hooksDir | Out-Null
$src = Join-Path $PSScriptRoot "..\integration\session-hook.json"
Copy-Item -Force $src (Join-Path $hooksDir "session-hook.json")
Write-Output "installed: $hooksDir\session-hook.json"