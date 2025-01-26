# Jenkins Installation with JDK 17 Setup

This script automates the installation of **Jenkins** on your Windows machine after you manually install **JDK 17**. Please follow these steps carefully.

## Step 1: Download and Install JDK 17

1. **Download JDK 17**:
   - Visit the Oracle JDK 17 archive page:
     [Oracle JDK 17 Archive Downloads](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
   - Download the appropriate **Windows x64** installer (`.exe`) file.
   
2. **Install JDK 17**:
   - Run the installer and follow the instructions to install **JDK 17** on your system. By default, it should be installed to:
     ```
     C:\Program Files\Java\jdk-17
     ```
   - Once the installation is complete, proceed to **Step 2**.

## Step 2: Run the PowerShell Script

1. **Open PowerShell as Administrator**:
   - Right-click **PowerShell** and select **Run as Administrator**.

2. **Run the Script**:
   - Save the script provided as `install_jenkins.ps1` on your machine.
   - In PowerShell, navigate to the folder where the script is saved.
   - Run the script with:
     ```powershell
     .\install_jenkins.ps1
     ```

3. **Jenkins Start**:
   - The script will attempt to start Jenkins on **port 8080**. If the port is in use, it will try **8081, 8082**, etc., until it finds an available port.
   - Once Jenkins starts, open your browser and go to the following URL:
     ```
     http://localhost:<port>
     ```
     Replace `<port>` with the port Jenkins was successfully started on (e.g., 8080 or 8081).

---

## Troubleshooting

- **Java Version Issues**:
  - Ensure that **JDK 17** is correctly installed and configured. You can verify this by running:
    ```powershell
    java -version
    ```
  - It should show something like:
    ```
    openjdk version "17.0.x"
    ```

- **Port Already in Use**:
  - If Jenkins cannot bind to port 8080, the script will automatically try the next available port. If it still doesn't work, check if another service is occupying the port range.
