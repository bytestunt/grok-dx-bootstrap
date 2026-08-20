#!/usr/bin/env pwsh
# grok-dx install helper (run by the agent or the user).
# Installs the session-lifecycle helper hook + its supporter script into the
# user's global Grok hooks dir.
$ErrorActionPreference = "Stop"
$hooksDir = Join-Path $Env:USERPROFILE ".grok\hooks"
New-Item -ItemType Directory -Force -Path $hooksDir | Out-Null
$srcHook  = Join-Path $PSScriptRoot "..\integration\session-hook.json"
$srcCmd   = Join-Path $PSScriptRoot "..\integration\proof.cmd"
Copy-Item -Force $srcHook (Join-Path $hooksDir "session-hook.json")
Copy-Item -Force $srcCmd  (Join-Path $hooksDir "proof.cmd")
Write-Output "installed: $hooksDir\session-hook.json + proof.cmd"