# README

## Introduction
This is a Dockerfile and accompanying shell script that allows you to run a VNC server with a desktop environment, Firefox ESR, and other packages installed.

## Requirements
In order to use this Dockerfile, you will need Docker installed on your machine.

## How to use
1. Clone or download the repository to your machine.
2. Navigate to the root directory of the repository.
3. Build the Docker image by running \`docker build -t vnc-server .\` (don't forget the period at the end of the command).
4. Run the Docker container by running \`docker run -it -p 5901:5901 vnc-server\`.
5. Open your VNC client and connect to \`localhost:5901\`. The password is \`mypassword\`.

## Notes
- The VNC server is configured to run at 1280x800 with a color depth of 24.
- Firefox ESR is installed and can be started by uncommenting the appropriate line in the \`start.sh\` script.
- This Dockerfile is based on the latest version of Debian. If you need to use a different version, you will need to modify the \`FROM\` line accordingly.
- The \`libxrender1\`, \`libxtst6\`, and \`libxi6\` packages are required for the desktop environment to run properly. The \`tigervnc-standalone-server\` and \`tigervnc-common\` packages are required for the VNC server.
