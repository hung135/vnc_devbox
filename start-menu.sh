#!/bin/bash

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
      xterm -geometry 800x600 &
      break
      ;;
    2)
      transmission-gtk &
      break
      ;;
    3)
      netbeans &
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
