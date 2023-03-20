#!/bin/bash

# Create the .vnc directory
mkdir -p /root/.vnc

# Set a password for the VNC server (optional)
echo "mypassword" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

# Start the VNC server with the specified resolution
VNC_RESOLUTION=${VNC_RESOLUTION:-1280x720}
vncserver :1 -geometry $VNC_RESOLUTION -depth 24 -localhost no

# Start a terminal session within the VNC environment
export DISPLAY=:1
xterm -geometry 800x600 &
tail -f /dev/null
