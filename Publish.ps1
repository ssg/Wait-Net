#requires -Module Microsoft.PowerShell.SecretManagement
Publish-Module -Name .\Wait-Net.psd1 -NuGetApiKey (Get-Secret PSGalleryAPIKey -AsPlainText)