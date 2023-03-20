#!/bin/bash

while true; do
  clear
  echo "Choose an application to run:"
  echo "1. Terminal"
  echo "2. Transmission"
  echo "3. NetBeans"
  echo "4. Firefox-esr"
  echo "5. VS Code"
  echo "q. Quit"
  read -p "Enter your choice (1-5/q): " choice

  case $choice in
    1)
      xterm -geometry 200x200
      ;;
    2)
      read -p "Do you want to launch Transmission? (y/n): " confirm
      if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        transmission-gtk 
      fi
      ;;
    3)
      read -p "Do you want to launch NetBeans? (y/n): " confirm
      if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        netbeans 
      fi
      ;;
    4)
      read -p "Do you want to launch Firefox-esr? (y/n): " confirm
      if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        firefox-esr 
      fi
      ;;
    5)
      read -p "Do you want to launch VS Code? (y/n): " confirm
      if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
        code --no-sandbox --user-data-dir=/home/dockeruser/.vscode --disable-gpu 
      fi
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
