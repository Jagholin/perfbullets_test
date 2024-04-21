$mypath = [IO.Path]::GetFullPath(".\3rdparty\Godot-PerfBullets\addons\PerfBullets")
Write-Host "Creating ntfs junction to $mypath"

New-Item -ItemType Junction -Path "addons\PerfBullets" -Target $mypath
