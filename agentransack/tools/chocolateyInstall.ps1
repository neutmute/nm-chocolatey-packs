$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
#download links can be found at https://www.mythicsoft.com/agentransack/download/
$url        = 'https://download.mythicsoft.com/flp/3566/oun.aqt1ebc7/agentransack_x86_msi_3566.zip'
$url64      = 'https://download.mythicsoft.com/flp/3566/oun.aqt1ebc7/agentransack_x64_msi_3566.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3566.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3566.msi'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url
  url64         = $url64
  unzipLocation = $toolsDir
  file          = $fileLocation
  file64        = $fileLocation64

  silentArgs    = "/quiet"
  validExitCodes= @(0)

  softwareName  = 'AgentRansack'
  checksum      = '28271715b2572dae067a203ffa6ee0bd2db8c87b43f4b72431708cab0551a28a'
  checksumType  = 'sha256'
  checksum64    = '05f7ef76d27b794280c2c949fdce558e3f8fc64b2fed02d433177964c166635d'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
