Param(
  [string]
  $url
)

$output = "$($env:TEMP)\MicrosoftServiceFabricSDK.msi"
Write-Host $output
[System.Net.WebClient]::new().DownloadFile($url, $output)
Write-Host "Download completed"
Start-Process msiexec.exe -Wait -ArgumentList "/I $output /qn"
Write-Host "Installation completed"
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Service Fabric SDK" -Name FabricSDKVersion
