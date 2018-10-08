#!/bin/bash

# This script aims to manage this repository's content information
# such as course assitance users and tutorials view.

# Defining variables
USER_ONE_NAME_GR=""
USER_ONE_NAME_EN=""
USER_ONE_EMAIL=""

USER_TWO_NAME_GR=""
USER_TWO_NAME_EN=""
USER_TWO_EMAIL=""


# If there is no : after a letter it means the specific letter has no argument, if it has :: it means the particular has optional, and a : has required argument.
OPTIONS=`getopt -o a:b:c:d:e:f: --long userOneNameGR:userOneNameEN:userOneEmail:userTwoNameGR:userTwoNameEN:userTwoEmail: -n 'manageInfo' -- "$@"`
eval set -- "$OPTIONS"
shopt -s extglob globasciiranges

while true; do
	case "$1" in
		-a|--userOneNameGR)
			case $2 in
				*([α-ωΑ-Ω]*[α-ωΑ-Ω])) USER_ONE_NAME_GR=$2 ; shift 2 ;; 
				*) >&2 echo "[Error] No input name was given, Greek letters are required." ; shift 2 ;;
			esac ;;
		-b|--userOneNameEN)
			case $2 in
				*([a-zA-Z]*[a-zA-Z])) USER_ONE_NAME_EN=$2 ; shift 2 ;; 
				*) >&2 echo "[Error] No input name was given, English letters are required." ; shift 2 ;;
			esac ;;
		-c|--userOneEmail)
			case $2 in
				*([a-zA-Z0-9._%+-]*@*[a-zA-Z0-9]*\.*[a-z])) USER_ONE_EMAIL=$2 ; shift 2 ;; 
				*) >&2 echo "[Error] No input email address was given or wrongly written." ; shift 2 ;;
			esac ;;
		-d|--userTwoNameGR)
			case $2 in
				*([α-ωΑ-Ω]*[α-ωΑ-Ω])) USER_TWO_NAME_GR=$2 ; shift 2 ;; 
				*) >&2 echo "[Error] No input name was given, Greek letters are required." ; shift 2 ;;
			esac ;;
		-e|--userTwoNameEN)
			case $2 in
				*([a-zA-Z]*[a-zA-Z])) USER_TWO_NAME_EN=$2 ; shift 2 ;; 
				*) >&2 echo "[Error] No input name was given, English letters are required." ; shift 2 ;;
			esac ;;
		-f|--userTwoEmail)
			case $2 in
				*([a-zA-Z0-9._%+-]*@*[a-zA-Z0-9]*\.*[a-z])) USER_TWO_EMAIL=$2 ; shift 2 ;; 
				*) >&2 echo "[Error] No input email address was given or wrongly written." ; shift 2 ;;
			esac ;;
		--) shift ; break ;;
		*) >&2 echo "Wrong command line argument, please try again." ; exit 1 ;;
	esac
done

# Need a function to get the current user one and two to perform the changes
# sed -i 's/https\:\/\/www\.balab\.aueb\.gr\/theodore-stassinopoulos\.html/https\:\/\/www\.balab\.aueb\.gr\/konstantinos-kravvaritis\.html/g' ../courses/tutorials/*.md
echo Performing changes
echo
echo "Done!"
