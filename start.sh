#!/bin/bash

# Create the .vnc directory
mkdir -p /root/.vnc

# Set a password for the VNC server (optional)
if [ -z "$VNC_PASSWORD" ]; then
  echo "No VNC password provided, using default password 'password'"
  echo "password" | vncpasswd -f > /root/.vnc/passwd
else
  echo "Setting VNC password..."
  echo "$VNC_PASSWORD" | vncpasswd -f > /root/.vnc/passwd
fi
chmod 600 /root/.vnc/passwd

# Start the VNC server
vncserver :1 -geometry "$VNC_RESOLUTION" -depth 24 -localhost no

# Start a terminal session within the VNC environment
export DISPLAY=:1
xterm -geometry 800x600 -e "/start-menu.sh" &

# Keep the container running
tail -f /dev/null
