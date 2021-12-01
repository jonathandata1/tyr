#! /bin/bash

################################################################
# Description: This program will bypass FRP Locks, MDM Locks, and Passcode Locks
# Depending on the Operating System Version, and the model of the device you may have custom
# run this program a few times. It should work on every android device, and it has specific
# commands to bypass samsung, and lg frp locks
# adb must be enabled, you can auto enable adb, from the methods in this program
#
# Author: Jonathan Scott 
# Date Modified: 12/01/2021
# Program Name: "TyR" (Android Recon & Research Tools)
# Dependencies: This app requires, adb see README.md
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
    LOG_METHOD_15="${DIR}"/LOGS/TyR/METHODS/15/LOGS/
    if [ ! -d "${LOG_METHOD_15}" ]; then
        mkdir -p "${LOG_METHOD_15}";
        cd  "${LOG_METHOD_15}" || return;
        mkdir "${input_dir}" && cd "${input_dir}" || exit

    elif [ -d "${LOG_METHOD_15}" ]; then
        cd "${LOG_METHOD_15}" || return
        mkdir "${input_dir}" && cd "${input_dir}" || exit

    else
        echo "Houston We HAVE A PROBLEM!!!"
    fi
# ---------------------------------------------------------------------------------------------
# Bypassing FRP, MDM, Passcode
# ---------------------------------------------------------------------------------------------


    bypass_frp_mdm_passcode(){

           printf "\n${PURPLE}[INFO] Please accept the RSA prompt if prompted${NC}\n"

           adb wait-for-device shell getprop | grep -o 'ro.adb.secure' | sed 's/ro.adb.secure/ADB Authorized/'

           double_space



        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell svc power stayon true"
        printf "\n${PURPLE}[INFO][+]${NC} This is only being sent to keep the screen awake"
                adb shell svc power stayon true

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put secure user_setup_complete 1"
                adb shell settings put secure user_setup_complete 1

         printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell settings put system setup_wizard_has_run 1"
            adb shell settings put global setup_wizard_has_run 1

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell pm clear com.samsung.klmsagent"
        printf "\n${PURPLE}[INFO][+]${NC} This is Samsung Specific"
            adb shell pm clear com.samsung.klmsagent

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell pm clear com.sec.android.app.SecSetupWizard"
        printf "\n${PURPLE}[INFO][+]${NC} This is Samsung Specific"


                adb shell pm clear com.sec.android.app.SecSetupWizard
                adb shell pm clear com.google.android.setupwizard

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell pm clear com.android.LGSetupWizard"
        printf "\n${PURPLE}[INFO][+]${NC} This is LG Specific"

                adb shell pm clear com.android.LGSetupWizard

        printf "\n${PURPLE}[INFO][+]${NC} Sending command: adb shell monkey -c android.intent.category.HOME 1"
                adb shell monkey -c android.intent.category.HOME 1 &>/dev/null

        printf "\n${PURPLE}[INFO][+]${NC} Please wait while the device setup is being bypassed"


         space

}

     bypass_frp_mdm_passcode | tee bypass.txt
