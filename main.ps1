$web_Url = "https://download.scdn.co/SpotifyFullSetup.exe"
$local_Url = Join-Path -Path (New-Item -Path (Join-Path -Path $env:TEMP -ChildPath "spot_temp") -ItemType Directory -Force) -ChildPath "SpotifySetup.exe" 
curl.exe -q $web_Url -o $local_Url --progress-bar --retry 3 --ssl-no-revoke
Start-Sleep -Seconds 1

Start-Process -FilePath explorer.exe -ArgumentList $local_Url
while (-not (get-process | Where-Object { $_.ProcessName -eq "SpotifySetup" })) {}
wait-process -name SpotifySetup
taskkill /f /im Spotify.exe /t > $null 2>&1

function Get-ArgumentList {
    $argumentList = @(
        "--password=$env:PASS",
        "--username=$env:LOGIN",
        "--log-file=$logPath"
    )
    $encodedArguments = $argumentList | ForEach-Object {
        [System.Text.Encoding]::UTF8.GetBytes($_)
    }

    return [string]$argumentList
}
  
 
function Start-SpotifyAndWaitForLogin {
    param (
        [string]$LogDirectory = "$env:TEMP\logSpot",
        [string]$LogFileName = 'loging.log'
    )

    $directoryPath = New-Item -Path $LogDirectory -ItemType Directory -Force
    $logPath = Join-Path -Path $directoryPath -ChildPath $LogFileName
    $spotifyExe = Join-Path (Join-Path $env:APPDATA "Spotify") "Spotify.exe"
    $arguments = Get-ArgumentList
    Start-Process -FilePath $spotifyExe -ArgumentList $arguments

    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

    while (-Not (Test-Path -Path $logPath)) {
        Start-Sleep -Seconds 1
    }

    $pattern = "Login5:.*"

    while ($true) {
        $matches = Select-String -Path $logPath -Pattern $pattern | Select-Object -First 1

        if ($matches) {
            Write-Host "Client response:"
            $line = $matches.Line -split "Login5: ", 2
            if ($line.Length -gt 1) {
                $result = $line[1].Trim()
                Write-Host $result
                return $result    
            }
            break
        }
        Start-Sleep -Seconds 1
    }

    $stopwatch.Stop()
}

# We call the login function, if the login is unsuccessful, we call it again 2 more times
$retryCount = 3
$retry = 0
$successful = "Successful authentication"

while ($retry -lt $retryCount) {
    $result = Start-SpotifyAndWaitForLogin

    if ($result -eq $successful) {
        break
    }
    taskkill /f /im Spotify.exe /t > $null 2>&1
    Start-Sleep -Seconds 2
    Remove-Item -Path "$env:TEMP\logSpot" -Recurse -Force
    $retry++
    Write-Host "Retry $retry of $retryCount..."
    Write-Host
    if ($retry -lt 3) { Start-Sleep -Seconds 3 }
}

if ($result -ne $successful) {
    Write-Host "Failed after $retryCount retries."
    pause
    exit
}
$elapsedSeconds = [math]::Round($stopwatch.Elapsed.TotalSeconds)
     
if ($elapsedSeconds -gt 60) {
    exit
}
$remainingSeconds = 60 - $elapsedSeconds
     
if ($remainingSeconds -gt 0) {
    Write-Host
    Write-Host ("Waiting for login to complete: {0} sec" -f $remainingSeconds)
    Start-Sleep -Seconds $remainingSeconds
}

taskkill /f /im Spotify.exe /t > $null 2>&1
