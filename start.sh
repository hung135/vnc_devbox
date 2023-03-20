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

# Prompt the user for which application to run
while true; do
  clear
  echo "Choose an application to run:"
  echo "1. Terminal"
  echo "2. Transmission"
  echo "3. NetBeans"
  echo "4. Firefox-esr"
  read -p "Enter your choice (1-4): " choice

  case $choice in
    1)
      xterm -geometry "$VNC_RESOLUTION" &
      break
      ;;
    2)
      transmission-gtk &
      break
      ;;
    3)
      /opt/netbeans/bin/netbeans &
      break
      ;;
    4)
      firefox-esr &
      break
      ;;
    *)
      echo "Invalid choice, please try again..."
      sleep 2
      ;;
  esac
done

# Keep the container running
tail -f /dev/null
