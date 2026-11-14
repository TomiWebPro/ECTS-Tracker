# Builds the ECTS Tracker Windows installer (.msi) into dist/.
# Requires: Flutter SDK on PATH, .NET SDK (provides the WiX v5 `wix` CLI).
# First run once:
#   wix extension add WixToolset.UI.wixext/5.0.2
#   wix extension add WixToolset.BootstrapperApplications.wixext/5.0.2
# (WixToolset.Bal.wixext is a hollow metapackage in v5 — the bal: namespace
# lives in BootstrapperApplications.)
param([string]$Version = '1.0.0')

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
Set-Location $root

flutter build windows --release

$release = Join-Path $root 'build\windows\x64\runner\Release'
$exe = Join-Path $release 'ects_tracker.exe'
if (-not (Test-Path $exe)) { throw "Release build missing: $exe" }
$wxs = Join-Path $root 'installer\wix\ECTSTracker.wxs'

# Fail loudly if the Release tree drifted from the .wxs file list: a missing
# DLL/asset ships an app that cannot launch. Every file under Release/ must be
# referenced as Source="build\windows\x64\runner\Release\..." in the .wxs.
$releaseFiles = Get-ChildItem $release -Recurse -File | ForEach-Object {
  $_.FullName.Substring($release.Length + 1)
} | Sort-Object
$wxsText = Get-Content $wxs -Raw
$wxsFiles = [regex]::Matches($wxsText, 'Source="build\\windows\\x64\\runner\\Release\\([^"]+)"') |
  ForEach-Object { $_.Groups[1].Value -replace '/', '\' } | Sort-Object
$missing = @($releaseFiles | Where-Object { $_ -notin $wxsFiles })
$stale = @($wxsFiles | Where-Object { $_ -notin $releaseFiles })
if ($missing.Count -or $stale.Count) {
  if ($missing.Count) { Write-Output 'Files in Release/ missing from ECTSTracker.wxs:'; $missing | ForEach-Object { Write-Output "  + $_" } }
  if ($stale.Count) { Write-Output 'Files in ECTSTracker.wxs missing from Release/:'; $stale | ForEach-Object { Write-Output "  - $_" } }
  throw 'Release tree and ECTSTracker.wxs are out of sync — update the installer file list.'
}

New-Item -ItemType Directory -Force (Join-Path $root 'dist') | Out-Null

$out = Join-Path $root "dist\ECTSTracker-$Version-x64.msi"
wix build $wxs -arch x64 -ext WixToolset.UI.wixext -o $out
Write-Output "MSI built: $out"

# Branded setup.exe wrapper (Burn bundle embedding the MSI above). A bare
# .msi cannot carry its own Explorer icon, so this is the file users download.
$bundle = Join-Path $root 'installer\wix\Bundle.wxs'
$setupOut = Join-Path $root "dist\ECTSTracker-$Version-x64-setup.exe"
wix build $bundle -arch x64 -ext WixToolset.BootstrapperApplications.wixext -o $setupOut
Write-Output "Setup built: $setupOut"
