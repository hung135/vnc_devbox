#!/bin/bash

# Create the .vnc directory
mkdir -p /root/.vnc

# Set a password for the VNC server (optional)
echo "mypassword" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

# Start the VNC server
vncserver :1 -geometry 1280x800 -depth 24 -localhost no

# Start a terminal session within the VNC environment
export DISPLAY=:1
xterm &
#firefox-esr --width 1280 --height 800 & 
tail -f /dev/null
