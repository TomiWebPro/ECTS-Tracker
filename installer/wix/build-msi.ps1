# Builds the ECTS Tracker Windows installer (.msi) into dist/.
# Requires: Flutter SDK on PATH, .NET SDK (provides the WiX v5 `wix` CLI).
# First run once: wix extension add WixToolset.UI.wixext/5.0.2
param([string]$Version = '1.0.0')

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
Set-Location $root

flutter build windows --release

$release = Join-Path $root 'build\windows\x64\runner\Release'
$exe = Join-Path $release 'ects_tracker.exe'
if (-not (Test-Path $exe)) { throw "Release build missing: $exe" }

New-Item -ItemType Directory -Force (Join-Path $root 'dist') | Out-Null

$wxs = Join-Path $root 'installer\wix\ECTSTracker.wxs'
$out = Join-Path $root "dist\ECTSTracker-$Version-x64.msi"
wix build $wxs -arch x64 -ext WixToolset.UI.wixext -o $out
Write-Output "MSI built: $out"
