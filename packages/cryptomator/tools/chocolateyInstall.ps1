﻿$ErrorActionPreference = 'Stop'

$url64bit = "https://github.com/cryptomator/cryptomator/releases/download/1.9.0/Cryptomator-1.9.0-x64.msi"
$checksum64 = 'b5aded24a4da328a56f1326c5a3b21a189152cc91ce640345d50cac81df2f67e'

$packageArgs = @{
  packageName            = 'cryptomator'
  fileType               = 'msi'
  url64bit               = $url64bit
  checksum64             = $checksum64
  checksumType64         = 'sha256'
  silentArgs             = '/qn /norestart'
  validExitCodes         = @(0)
  registryUninstallerKey = 'Cryptomator'
}
Install-ChocolateyPackage @packageArgs

$installLocation = Get-AppInstallLocation $packageArgs.registryUninstallerKey
if ($installLocation) {
  Write-Host "$packageName installed to '$installLocation'"
}
else { Write-Warning "Can't find $PackageName install location" }
