#!/bin/bash

while true; do
  clear
  echo "Choose an application to run:"
  echo "1. Transmission"
  echo "2. NetBeans"
  echo "3. Firefox-esr"
  echo "4. VS Code"
  echo "q. Quit"
  read -p "Enter your choice (1-4/q): " choice

  case $choice in
    1)
      transmission-gtk &
      break
      ;;
    2)
      /usr/local/netbeans-8.2/bin/netbeans &
      break
      ;;
    3)
      firefox-esr &
      break
      ;;
    4)
      sudo code --no-sandbox --user-data-dir=/home/dockeruser/.vscode --disable-gpu &
      break
      ;;
    q|Q)
      exit 0
      ;;
    *)
      echo "Invalid choice, please try again..."
      sleep 2
      ;;
  esac
done
