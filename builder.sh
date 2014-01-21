#!/bin/bash
clear # Clear the screen.

echo "Please choose one"
echo "-----------------"
echo "List of Options:"
echo
echo "[1]  Debian 7 Virtualbox Image"
echo "[2]  Ubuntu 12.04 Virtualbox Image"
echo

read os

case "$os" in
# Note variable is quoted.

"1" | "d" )
echo "Will build debian"
;;

"2" | "u" )
echo "Will build ubuntu"
;;

esac

exit 0
