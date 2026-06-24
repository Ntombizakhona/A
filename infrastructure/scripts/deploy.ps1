<#
    Cloud A-Lab - one-command deploy for Windows PowerShell (Automation).
    Usage:   .\deploy.ps1 cloudglossary-a
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$BucketName
)

$ErrorActionPreference = "Stop"

$Region = (aws configure get region)
if (-not $Region) { $Region = "us-east-1" }

$ScriptDir  = Split-Path -Parent $MyInvocation.MyCommand.Path
$WebsiteDir = Join-Path $ScriptDir "..\..\website"
$PolicyFile = Join-Path $ScriptDir "..\iam\public-read-bucket-policy.json"

Write-Host "==> Creating bucket: $BucketName in $Region"
aws s3 mb "s3://$BucketName" --region $Region

Write-Host "==> Enabling static website hosting (index + error attributes)"
aws s3 website "s3://$BucketName" --index-document index.html --error-document error.html

Write-Host "==> Allowing public read (correct for a website; an anti-pattern for private data)"
aws s3api put-public-access-block --bucket $BucketName `
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"

# Substitute the real bucket name into the policy template.
$TmpPolicy = New-TemporaryFile
(Get-Content $PolicyFile) -replace "BUCKET_NAME", $BucketName | Set-Content $TmpPolicy
aws s3api put-bucket-policy --bucket $BucketName --policy "file://$($TmpPolicy.FullName)"
Remove-Item $TmpPolicy

Write-Host "==> Uploading website files"
aws s3 sync $WebsiteDir "s3://$BucketName"

Write-Host ""
Write-Host "Done! Your site is live at:"
Write-Host "   http://$BucketName.s3-website-$Region.amazonaws.com"