# Check if running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Please run this script as Administrator."
    exit 1
}

# Step 1: Instructions to download JDK 17 manually
Write-Host "Please download JDK 17 from Oracle using the following link:"
Write-Host "https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html"
Write-Host "After downloading, proceed with the manual installation of JDK 17."
Write-Host "Once installed, continue with this script."

# Pause to allow the user to download and install JDK 17 manually
Read-Host -Prompt "Press Enter after you've installed JDK 17"

# Step 2: Download Jenkins WAR file
Write-Host "Downloading Jenkins WAR file..."
$jenkinsUrl = "https://get.jenkins.io/war-stable/2.375.3/jenkins.war"
$jenkinsPath = "$env:TEMP\jenkins.war"
Invoke-WebRequest -Uri $jenkinsUrl -OutFile $jenkinsPath

# Step 3: Start Jenkins with port checking
$port = 8080
$maxPort = 8099  # You can increase this range if needed
$jenkinsStarted = $false

while (-not $jenkinsStarted -and $port -le $maxPort) {
    Write-Host "Attempting to start Jenkins on port $port..."

    # Try starting Jenkins on the given port
    try {
        Start-Process -NoNewWindow -FilePath "java" -ArgumentList "-jar $jenkinsPath --httpPort=$port"
        $jenkinsStarted = $true
        Write-Host "Jenkins started successfully on port $port!"
    } catch {
        Write-Host "Port $port is already in use. Trying next port..."
        $port++
    }
}

if (-not $jenkinsStarted) {
    Write-Error "Failed to start Jenkins after trying ports $($port-1) through $maxPort."
    exit 1
}

# Step 4: Instructions to access Jenkins
Write-Host "Jenkins is starting up. Open your browser and go to http://localhost:$port to complete the setup."

# Final message
Write-Host "Jenkins installation and setup started successfully!"
