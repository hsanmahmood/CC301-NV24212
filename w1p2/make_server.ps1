New-Item -ItemType Directory -Path servers -Force | Out-Null
New-Item -ItemType File -Path "servers\web-$([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()).txt" -Force | Out-Null
Write-Output "server created"
