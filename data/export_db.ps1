# Get script directory (data folder)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
# Get project root (parent of data folder)
$ProjectRoot = Split-Path -Parent $ScriptDir

# Set location to project root for docker compose context
Set-Location $ProjectRoot

# Define dump file path inside data folder
$DumpFile = Join-Path $ScriptDir "dump.sql"

Write-Host "Exporting database 'garden_db' from container to '$DumpFile'..."
# Use cmd /c to handle redirection properly avoiding PowerShell encoding issues
$DockerCommand = "docker compose exec -T db pg_dump -U postgres -d garden_db --clean --if-exists"
cmd /c "$DockerCommand > ""$DumpFile"""

Write-Host "Done! Database saved to '$DumpFile'"
