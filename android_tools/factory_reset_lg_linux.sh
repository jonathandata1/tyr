#! /bin/bash

################################################################
# Description: This program will instantly factory reset an LG Device Using AT commands
# For Linux Only
#
# Author: Jonathan Scott
# Date Modified: 11/29/2021
# Program Name: "TyR" (Android Recon & Research Tools)
# Dependencies: socat
################################################################

# This sessions id will be generated everytime you run the program and it will be saved as a folder name
# This is for organizational purposes

DIR="$(dirname "$(which "$0")")"


trap ctrl_c INT

 ctrl_c() {
    echo
    echo "Ctrl-C by user"
    # do the jobs
    exit
}

sessionid=$(uuidgen)
time_date=$(date +'%a-%h-%d-%Y-%I_%M_%S-%Z')

    # FUNCTION TO ADD 1 BLANK ROW JUST BY TYPING space
        space(){

                     echo ""

         }
     # FUNCTION TO ADD 2 BLANK ROWS JUST BY TYPING double_space
         double_space(){

                    echo ""
                    echo ""

         }

# ---------------------------------------------------------------------------------------------
# LOG FILE DIRECTORIES
# Every method has a logout put directory so you can go back and review
# ---------------------------------------------------------------------------------------------
    input_dir="${sessionid}"_"${time_date}"
    LOG_METHOD_12="${DIR}"/LOGS/TyR/METHODS/12/LOGS/
    if [ ! -d "${LOG_METHOD_12}" ]; then
        mkdir -p "${LOG_METHOD_12}";
        cd  "${LOG_METHOD_12}" || return;
        mkdir "${input_dir}" && cd "${input_dir}" || exit

    elif [ -d "${LOG_METHOD_12}" ]; then
        cd "${LOG_METHOD_12}" || return
        mkdir "${input_dir}" && cd "${input_dir}" || exit

    else
        echo "Houston We HAVE A PROBLEM!!!"
    fi
# ---------------------------------------------------------------------------------------------
# Factory Reset Device
# ---------------------------------------------------------------------------------------------
    lg_reset(){
     echo "Triggering Factory Reset"
     double_space
     echo "AT%FRST" | socat -t 2 -,escape=0x0f `ls  /dev/ttyUSB*`,crnl
    }

    lg_reset | tee lg_reset.txt