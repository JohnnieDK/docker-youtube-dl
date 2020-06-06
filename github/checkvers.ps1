##########################################################
# Check if there is a new version of youtubedl
# update readme.md and commit the file
##########################################################

[CmdletBinding()]
param (
    [Parameter()]
    [switch] $forcepush
)

$fileHistory = "history.json"
$fileNameReadme = "readme.md"
$fileReadme = (Join-Path -Path ".." -ChildPath $fileNameReadme  -Resolve)

$url = "https://api.github.com/repos/ytdl-org/youtube-dl/releases"

$response = Invoke-WebRequest -UseBasicParsing -Uri $url 

$json = ($response.Content |ConvertFrom-Json)[0]

$history = Get-Content $fileHistory |ConvertFrom-Json

if ($json.created_at -lt $history.created_at) { 
    return  # same version, do nothing
}
Write-Host "*** Newer version found ***" -BackgroundColor Cyan -ForegroundColor Black

# Update readme.md
$readme = Get-Content $fileReadme
$readme.replace($history.name, $json.name) | Out-File -FilePath $fileReadme -Encoding utf8

# update history file
$history = @{"tag_name"    = $json.tag_name
             "name"        = $json.name
             "created_at"  = $json.created_at
}

$history | ConvertTo-Json | Out-File $fileHistory

$gitMessage = "Bumped version to $($json.name)"

git add $fileReadme
git commit -m $gitMessage

if ($forcepush.IsPresent) {
    git push
} else {
    Write-Host "******************************" -ForegroundColor Yellow
    Write-Host $gitMessage -ForegroundColor Yellow
    Write-Host "Dont forget to push" -ForegroundColor Yellow
    Write-Host "******************************" -ForegroundColor Yellow
}