#! /bin/bash

################################################################
# Description: This program will auto enable adb on a Samsung Device Using AT commands, it will also tap trust to authorize the RSA key pairing
# For Linux Only
#
# Author: Jonathan Scott
# Date Modified: 12/01/2021
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
    LOG_METHOD_14="${DIR}"/LOGS/TyR/METHODS/14/LOGS/
    if [ ! -d "${LOG_METHOD_14}" ]; then
        mkdir -p "${LOG_METHOD_14}";
        cd  "${LOG_METHOD_14}" || return;
        mkdir "${input_dir}" && cd "${input_dir}" || exit

    elif [ -d "${LOG_METHOD_14}" ]; then
        cd "${LOG_METHOD_14}" || return
        mkdir "${input_dir}" && cd "${input_dir}" || exit

    else
        echo "Houston We HAVE A PROBLEM!!!"
    fi
# ---------------------------------------------------------------------------------------------
# Samsung Enable ADB
# ---------------------------------------------------------------------------------------------
# Description: Initialization taken from my ATSEND Program
# github.com/jonathandata1/atsend
# Find the available modem /dev/cu ports on MacOS
# Dependencies: Python2 and 3, gsmterm.py
# Installation:
# pip3 install python-gsmmodem-new
# pip3 install pyserial
#
# For: Jonathan Scott - 2017
# Updated: 08/12/2021
# I am having to update this code, because it is the year 2021, and its pretty cool that my code lasted 5 years
# The python serial module I was using to list out the comports is not retired, but its time to update!
# I will be using python 3.9, project io2.sh has also been updated, but now I will need to clean up the sloppy 5 year old
# code I wrote, so here we go


    modem_list_upgrade=$(python3 -m serial.tools.list_ports -v | sed 'N;N;s/\n/ /g')

    sessionid=$(uuidgen)
    modem=$(ls -A /dev/* | grep -e "ttyUSB*\|ttyACM*" | head -1 | awk '{print $NF}')
    modem_count=$(ls -A /dev/* | grep -e "ttyUSB*\|ttyACM*" | wc -l | sed 's/^[ \t]*//')
    modem_list=$(echo "${modem_list_upgrade}" | sed '/Bluetooth/d;/AirPods/d' | grep -e "ttyUSB*\|ttyACM*")
    modem_list_tmp=$(echo "${modem_list_upgrade}" | sed '/Bluetooth/d;/AirPods/d' | grep -e "ttyUSB*\|ttyACM*" >/tmp/modem_list.txt)


enable_adb_samsung(){
        mdm_cnt_logic(){

            if [[ ${modem_count} -eq 1 ]]; then
                echo "[${modem_count}] Modem Found: ${modem_list}"
            elif [[ ${modem_count} -gt 1 ]]; then
                echo "[${modem_count}] Modems Found: "
            # i'm doing a while loop to make sure that each modem present has its own line for the modem location
            # I'm saving ${modem_list} to a temp dir so that I can read each line the the wile loop
                while read line ; do
                    echo "Modem Location: ${line}"
                done < /tmp/modem_list.txt

            else [[ ${modem_count} -eq 0 ]]
                echo "No Modem Found: Check Your Connection or Restart The Device."
            fi

        }

        mdm_cnt_logic=$(mdm_cnt_logic)


            if [[ ${modem_count} -ge 1 ]]; then
                echo ""
                echo "---------------------------------------------------------------------------------------------------------------------------------------------"
                echo "${mdm_cnt_logic}"
                echo "---------------------------------------------------------------------------------------------------------------------------------------------"
                echo ""

               echo "Enabling ADB Do Not Unplug"
                double_space
                    echo "AT+SYSSCOPE=1,0" | socat -t 2 -,escape=0x0f `ls   /dev/ttyUSB*`,crnl 1>/dev/null
                    echo "AT+USBMODEM" | socat -t 2 -,escape=0x0f `ls   /dev/ttyUSB*`,crnl 1>/dev/null
                    sleep 5
                    echo "AT+CTSA=2,170,1209" | socat -t 2 -,escape=0x0f `ls  /dev/ttyUSB*`,crnl 1>/dev/null
                    echo "AT+CTSA=2,1140,1558" | socat -t 2 -,escape=0x0f `ls  /dev/ttyUSB*`,crnl 1>/dev/null
                    echo "AT+CTSA=2,880,1420" | socat -t 2 -,escape=0x0f `ls  /dev/ttyUSB*`,crnl 1>/dev/null
                    echo "AT+CTSA=2,928,1365" | socat -t 2 -,escape=0x0f `ls  /dev/ttyUSB*`,crnl 1>/dev/null
                    echo "AT+CTSA=2,1200,1786" | socat -t 2 -,escape=0x0f `ls  /dev/ttyUSB*`,crnl 1>/dev/null
               echo "ADB Has Been Enabled"
               sleep 3
               adb shell getprop

            else [[ ${modem_count} -eq 0 ]];

                echo "---------------------------------------------------------------------------------------------------------------------------------------------"
                echo "${mdm_cnt_logic}"
                echo "---------------------------------------------------------------------------------------------------------------------------------------------"

            fi
            
            }
            enable_adb_samsung | tee enable_adb_samsung.txt