# README

## Introduction
This is a Dockerfile and accompanying shell script that allows you to run a VNC server with a desktop environment, Firefox ESR, and other packages installed.

## Requirements
In order to use this Dockerfile, you will need Docker and Docker Compose installed on your machine.

## How to use
1. Clone or download the repository to your machine.
2. Navigate to the root directory of the repository.
3. Build and run the Docker container by running `docker-compose up --build`.
4. Open your VNC client and connect to `localhost:5901`. The password is `mypassword`.

## Installing a VNC client

To access the VNC server running on your Docker container, you'll need a VNC client installed on your local machine. Here's how to install a VNC client for MacOS, Linux, and Windows:

### MacOS

1. Download and install RealVNC or TightVNC on your Mac.
2. Open the VNC client and enter the IP address of your Docker container and the port number used by the VNC server (usually 5901).
3. Enter the VNC password set in the start.sh script when prompted.
4. You should now be connected to the VNC server running in your Docker container.

### Linux

1. Install a VNC client on your Linux distribution using your package manager. For example, on Ubuntu, you can install Remmina by running `sudo apt-get install remmina` in the terminal.
2. Open the VNC client and enter the IP address of your Docker container and the port number used by the VNC server (usually 5901).
3. Enter the VNC password set in the start.sh script when prompted.
4. You should now be connected to the VNC server running in your Docker container.

### Windows

1. Download and install RealVNC or TightVNC on your Windows PC.
2. Open the VNC client and enter the IP address of your Docker container and the port number used by the VNC server (usually 5901).
3. Enter the VNC password set in the start.sh script when prompted.
4. You should now be connected to the VNC server running in your Docker container.


## Notes
- The VNC server is configured to run at 1280x800 with a color depth of 24.
- Firefox ESR is installed and can be started by uncommenting the appropriate line in the `start.sh` script.
- This Dockerfile is based on the latest version of Debian. If you need to use a different version, you will need to modify the `FROM` line accordingly.
- The `libxrender1`, `libxtst6`, and `libxi6` packages are required for the desktop environment to run properly. The `tigervnc-standalone-server` and `tigervnc-common` packages are required for the VNC server.
