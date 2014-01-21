#!/bin/bash
clear # Clear the screen.

echo "Please choose one"
echo "-----------------"
echo "List of Options:"
echo
echo "[1]  Debian 7 Virtualbox Image"
echo "[2]  Ubuntu 12.04 Virtualbox Image"
echo "[3]  Centos 6.5 Virtualbox Image"
echo

read os

case "$os" in
# Note variable is quoted.

"1" | "d" )
echo "Will build Debian"
;;

"2" | "u" )
echo "Will build Ubuntu"
;;

"3" )
echo "Will build Centos"

esac

exit 0
