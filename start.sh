#!/bin/bash

# Create the .vnc directory
mkdir -p /home/dockeruser/.vnc
touch /home/dockeruser/.Xauthority

# Set a password for the VNC server (optional)
if [ -z "$VNC_PASSWORD" ]; then
  echo "No VNC password provided, using default password 'password'"
  echo "password" | vncpasswd -f > /home/dockeruser/.vnc/passwd
else
  echo "Setting VNC password..."
  echo "$VNC_PASSWORD" | vncpasswd -f > /home/dockeruser/.vnc/passwd
fi
chmod 600 /home/dockeruser/.vnc/passwd

# Start the VNC server
vncserver :1 -geometry "$VNC_RESOLUTION" -depth 24 -localhost no

if [ -z "$GIT_URL" ]; then
  echo "No nothing to clone"
else
  echo "Cloning URL provided: $GIT_URL"
  git clone $GIT_URL
fi

# Start a terminal session within the VNC environment
export DISPLAY=:1
xterm -geometry 800x600 -e "/start-menu.sh" 

# Keep the container running
#tail -f /dev/null
