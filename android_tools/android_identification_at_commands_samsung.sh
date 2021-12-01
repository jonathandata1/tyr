#! /bin/bash

################################################################
# Description: This program identify a Samsung Device that is plugged into a host via AT Commands
# NOTE: This is written for Mac Only Currently
#
# Author: Jonathan Scott
# Date Modified: 11/29/2021
# Program Name: "TyR" (Android Recon & Research Tools)
# Dependencies: This app requires, adb, and apktool, socat, and peco and uuidgen  see README.md
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
    RED='\033[0;31m'
    PURPLE='\033[0;35m'
    YELLOW='\033[1;33m'
    ORANGE='\033[0;33m'
    CYAN='\033[1;36m'
    NC='\033[0m' # No Color

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
    LOG_METHOD_1="${DIR}"/LOGS/TyR/METHODS/1/LOGS/
    if [ ! -d "${LOG_METHOD_1}" ]; then
        mkdir -p "${LOG_METHOD_1}";
        cd  "${LOG_METHOD_1}" || return;
        mkdir "${input_dir}" && cd "${input_dir}" || exit

    elif [ -d "${LOG_METHOD_1}" ]; then
        cd "${LOG_METHOD_1}" || return
        mkdir "${input_dir}" && cd "${input_dir}" || exit

    else
        echo "Houston We HAVE A PROBLEM!!!"
    fi


    sam_id(){
    #################### MANUFACTURER ####################################

#    ATZ &>/dev/null
    echo "ATZ" | socat -t 2 - escape=0x0f `ls /dev/cu.usbmodem*`, crnl &>/dev/null

    echo "AT+CGMI" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_manufacturer_var_AT_2.log

    aos_sam_manufacturer_AT_2=$(cat /tmp/aos_sam_manufacturer_var_AT_2.log  | sed '/AT+CGMI/d;/OK/d' | tail -1)

         printf "\n${PURPLE}[INFO]${NC}${CYAN} Manufacturer:${NC}${PURPLE} ${aos_sam_manufacturer_AT_2}${NC}"

    #################### MODEL ####################################
    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null
    echo "AT+GMM" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_model_AT.log
    aos_sam_model_AT=$(cat /tmp/aos_sam_model_AT.log | sed '/AT+GMM/d;/OK/d' | tail -1)

    if [[ ${aos_sam_model_AT} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Model:${NC}${PURPLE} ${aos_sam_model_AT}${NC}"
    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Model:${NC}${YELLOW} No Result Found${NC}"
    fi

   #################### IMEI ####################################

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null
    echo "AT+GSN" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_imei_AT_1.log
    echo "AT+IMEINUM" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_imei_AT_2.log
    aos_sam_imei_AT_1=$(cat /tmp/aos_sam_imei_AT_1.log | sed '/AT+GSN/d;/OK/d')
    aos_sam_imei_AT_2=$(cat /tmp/aos_sam_imei_AT_2.log | sed '/AT+IMEINUM/d;/OK/d' | awk '{print $NF}')

    if [[ ${aos_sam_imei_AT_1} && ! ${aos_sam_imei_AT_2} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} IMEI:${NC}${PURPLE} ${aos_sam_imei_AT_1}${NC}"
    elif [[ ! ${aos_sam_imei_AT_1} && ${aos_sam_imei_AT_2} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} IMEI:${NC}${PURPLE} ${aos_sam_imei_AT_2}${NC}"
    elif [[ ${aos_sam_imei_AT_1} && ${aos_sam_imei_AT_2} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} IMEI:${NC}${PURPLE} ${aos_sam_imei_AT_2}${NC}"
    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} IMEI:${NC}${YELLOW} No Result Found${NC}"
    fi

    #################### AOS VERSION ####################################

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null

    echo "AT+VERSNAME=3,2,3" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_ver_AT.log
    aos_sam_ver_AT=$(cat /tmp/aos_sam_ver_AT.log | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl | awk -F ':3,' '{print $NF}' | sed '/AT+VERSNAME=3,2,3/d;/OK/d' | uniq)

    if [[ ${aos_sam_ver_AT} != "ERROR" ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} AOS Ver:${NC}${PURPLE} ${aos_sam_ver_AT}${NC}"
    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} AOS Ver:${NC}${YELLOW} No Result Found${NC}"
    fi

    #################### OS ####################################

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null

    echo "AT+VERSNAME=3,2,2" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_os_AT.log
    aos_sam_os_AT=$(cat /tmp/aos_sam_os_AT.log | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl | awk -F ':3,' '{print $NF}' | sed '/AT+VERSNAME=3,2,2/d;/OK/d' | uniq)

    if [[ ${aos_sam_os_AT} != "ERROR" ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Operating System:${NC}${PURPLE} ${aos_sam_os_AT}${NC}"
    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Operating System:${NC}${YELLOW} No Result Found${NC}"
    fi

    #################### FIRMWARE VER ####################################

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null
    sleep 2
    echo "AT+GMR" | socat -t 3 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_firmware_ver_AT_1.log

    aos_sam_firmware_ver_AT_1=$(cat /tmp/aos_sam_firmware_ver_AT_1.log | sed '/AT+GMR/d;/OK/d' | tr -s '\n' | uniq)

    printf "\n${PURPLE}[INFO]${NC}${CYAN} Firmware Version:${NC}${PURPLE} ${aos_sam_firmware_ver_AT_1}${NC}"

    #################### SERIAL NUMBER ####################################

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null

    echo "AT+SERIALNO" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_serial_no_AT.log
    aos_sam_serial_no_AT=$(cat /tmp/aos_sam_serial_no_AT.log | awk -F ',' '{print $2}' | tr -s '\n' | uniq | tail -1)

    if [[ ${aos_sam_serial_no_AT} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Serial Number:${NC}${PURPLE} ${aos_sam_serial_no_AT}${NC}"
    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Serial Number:${NC}${YELLOW} No Result Found${NC}"
    fi

    #################### MEMORY ####################################

    #   This is how I am getting the total memory for the device For AT Ver1
    #   Different Models have different partitions
    #   I am adding the above numbers together with awk
    #   Conversion bytes to gigabytes
    #
    #   Ex.
    #   /dev:1.3G
    #   /system:3.7G:
    #   /data:25.2G
    #   /storage:1.3G
    #

    # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

    # When I created the logic for the memory size I made sure I was only looking at the values that had the following
    # Output Example - Cleaned Up
        # /data/knox/secure_fs/enc_user:55883972:1627312:54164500:3%:/data/enc_user
        # /data/knox/secure_fs/enc_media:55883972:1627312:54164500:3%:/data/knox/secure_fs/enc_media\r\nOK\r\nAT+SIZECHECK=\rAT+SIZECHECK=\rAT+SIZECHECK=\rFilesystem:1K-blocks:Used:Available:Use%"
        # tmpfs:1697596:764:1696832:1%:/dev
        # tmpfs:1697596:0:1697596:0%:/storage
        # /dev/block/dm-0:4578356:4444308:134048:98%:/system
        # /dev/block/sda16:97232:47648:49584:50%:/firmware
        # /dev"
        # /dev/block/sda5:28144:204:27940:1%:/persist
        # /dev/block/sda20:595136:9372:585764:2%:/cache
        # /dev/block/sda6:16048:928:15120:6%:/efs
        # /dev/block/sda15:97232:47648:49584:50%:/firmware
        # /dev/block/sda16:112576:74736:37840:67%"
    #
    #
    # The cleaned up values are still not what we want
    # When I grep for the following memory blocks: dev,system,data,storage
    # I am only looking for the memory blocks that have the variable at the end of the line.
    # Once I have cleaned up the output of the SIZECHECK again we are left wit this:
    # Ex:
    # tmpfs:1697596:764:1696832:1%:/dev
    # /dev/block/dm-0:4578356:4444308:134048:98%:/system
    # /data/knox/secure_fs/enc_user:55883972:1627312:54164500:3%:/data/enc_user - Yes there are 2 data variables that appear at the end of the line but the enc_user and enc_media are the same value in this example
    # tmpfs:1697596:0:1697596:0%:/storage
    #
    #
    # After I have cleaned up the output again I trim it down more and isolate the first ':' delimiter for each line
    # The int after the ':' delimiter is the number that I am going to make a sum of
    # I clean up the output one more time making sure that I get only numbers and no special characters or alpha characters
    # I then take the sum of each line
    # Finally, I cut the output to only 2 digits
    # I need to fix this logic - look back at samsung_device_id_raw.sh, and I wrote out 3 different memory logic functions to overcome this issues

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null

    echo "AT+SIZECHECK=" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_memory_size_AT.log



    aos_sam_memory_size_AT_1() {

        aos_sam_memory_size_AT_m1=$(cat /tmp/aos_sam_memory_size_AT.log | sed -e 's/\AT+SIZECHECK=//g' | tr -d '"/r\\' | tr ';' '\n' | grep -E "dev$|system$|data$|storage$" | cut -d ':' -f2 | grep '[[:digit:]]' | awk '{ SUM += $1} END { print SUM }' | cut -c 1,2)
        #aos_sam_memory_size_AT_m1=$(cat /tmp/aos_sam_memory_size_AT.log | tr ';' '\n' | grep -E "/dev:|/system:|/data:|/storage:" | cut -d ':' -f2 | grep  '[[:digit:]]' | awk '{ SUM += $1} END { print SUM }' | cut -d '.' -f1)

            if [[ ${aos_sam_memory_size_AT_m1} -ge 2 && ${aos_sam_memory_size_AT_m1} -le 5 ]] ;then
                echo "4GB"
                    elif [[ ${aos_sam_memory_size_AT_m1} -ge 6 && ${aos_sam_memory_size_AT_m1} -le 13 ]] ;then
                        echo "8GB"
                            elif [[ ${aos_sam_memory_size_AT_m1} -ge 14 && ${aos_sam_memory_size_AT_m1} -le 28 ]] ;then
                                echo "16GB"
                                    elif [[ ${aos_sam_memory_size_AT_m1} -ge 29 && ${aos_sam_memory_size_AT_m1} -le 56 ]] ;then
                                        echo "32GB"
                                            elif [[ ${aos_sam_memory_size_AT_m1} -ge 57 && ${aos_sam_memory_size_AT_m1} -le 124 ]] ;then
                                                echo "64GB"
                                                    elif [[ ${aos_sam_memory_size_AT_m1} -ge 125 && ${aos_sam_memory_size_AT_m1} -le 253 ]] ;then
                                                        echo "128GB"
                                                            elif [[ ${aos_sam_memory_size_AT_m1} -ge 254 && ${aos_sam_memory_size_AT_m1} -le 509 ]]; then
                                                                echo "256GB"
                                                                    elif [[ ${aos_sam_memory_size_AT_m1} -ge 510 && ${aos_sam_memory_size_AT_m1} -le 1000 ]]; then
                                                                        echo "512GB"
                                                                            else
                                                                                printf "${YELLOW}No Result Found${NC}"
           fi
        }

    aos_sam_memory_size_AT_1=$(aos_sam_memory_size_AT_1)

    if [[ ${aos_sam_memory_size_AT_1} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Memory Size:${NC}${PURPLE} ${aos_sam_memory_size_AT_1}${NC}"

    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Memory Size:${NC}${YELLOW} No Result Found${NC}"
    fi

    #################### ROOTED STATUS ####################################

    # There are 3 sysscope status's
    # 1. Normal
    # 2. Modified - Rooted
    # 3. Scanning - The Device is booting up and preparing to query

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null

    echo "AT+SYSSCOPE=1,0" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_rooted_status.log

    aos_sam_rooted_status_AT_1=$(cat /tmp/aos_sam_rooted_status.log |  sed -e 's/\\r//g' | sed -e 's/\AT+SYSSCOPE//g' | grep -o "NORMAL" | uniq | sed 's/NORMAL/Not Rooted/')

    printf "\n${PURPLE}[INFO]${NC}${CYAN} Rooted Status:${NC}${PURPLE} ${aos_sam_rooted_status_AT_1}${NC}"


    #################### NETWORK LOCK STATUS ####################################

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null

    echo "AT+SVCIFPGM=1,4" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_sam_network_lock_status.log

    aos_sam_network_lock_status_AT=$(cat /tmp/aos_sam_network_lock_status.log | sed -e 's/\\r//g' | sed -e 's/\AT+SVCIFPGM=1,4//g' | grep -o "UNLOCK" | sed 's/UNLOCK/Unlocked/' | uniq)

    printf "\n${PURPLE}[INFO]${NC}${CYAN} Network Lock Status:${NC}${PURPLE} ${aos_sam_network_lock_status_AT}${NC}"

    #################### CARRIER CODE ####################################

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null
    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null
    sleep 2

    echo "AT+DEVCONINFO" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_carrier_code_AT.log
    echo "AT+DEVCONINFO" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_carrier_code_AT.log
    echo "AT+DEVCONINFO" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_carrier_code_AT.log

    aos_sam_carrier_code_AT=$(cat /tmp/aos_carrier_code_AT.log | grep "PRD(" | awk -F ';' '{print $0}' | tr ';' '\n' | grep "PRD" | grep -o '....$' | sed -e 's/\PRD//g' | tr -d '()' | uniq | xargs)

    if [[ ${aos_sam_carrier_code_AT} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Carrier Code:${NC}${PURPLE} ${aos_sam_carrier_code_AT}${NC}"
    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Carrier Code:${NC}${YELLOW} No Result Found${NC}"
    fi

    #################### CARRIER NAME ####################################

    aos_sam_carrier_name_AT_case(){

        aos_sam_carrier_name_AT_case=$(cat /tmp/aos_carrier_code_AT.log | grep "PRD(" | awk -F ';' '{print $0}' | tr ';' '\n' | grep "PRD" | grep -o '....$' | sed -e 's/\PRD//g' | tr -d '()' | uniq | xargs)

    case ${aos_sam_carrier_name_AT_case} in

        "ATT")
            echo "AT&T"
            ;;
        "SPR")
            echo "Sprint"
            ;;
        "VZW")
            echo "Verizon"
            ;;
        "TMO")
            echo "T-Mobile"
            ;;
        "TMB")
            echo "T-Mobile"
            ;;
        "USC")
            echo "US Cellular"
            ;;
        "PCT")
            echo "Claro"
            ;;
        "AIO")
            echo "Cricket Wireless"
            ;;
        "BST")
            echo "Boost Mobile"
            ;;
        "VMU")
            echo "Virgin Mobile"
            ;;
        "CCT")
            echo "Comcast"
            ;;
        "null")
            echo "Generic Carrier"
            ;;
        "XAS")
            echo "Sprint Sub_Carrier"
            ;;
        "XAA")
            echo "Factory Unlocked"
            ;;
        "TMK")
            echo "T-Mobile"
            ;;
        "LUC")
            echo "LG Uplus - Korea"
            ;;
        "KTC")
            echo "KT Corporation"
            ;;
        "SKC")
            echo "SK Telecom"
            ;;
            *)
            esac
    }

    aos_sam_carrier_name_AT_case=$(aos_sam_carrier_name_AT_case)

    if [[ ${aos_sam_carrier_name_AT_case} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Carrier Name:${NC}${PURPLE} ${aos_sam_carrier_name_AT_case}${NC}"
    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Carrier Name:${NC}${YELLOW} No Result Found${NC}"
    fi

    #################### FRP LOCK STATUS ####################################
    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null
    # I have commented out this section so that I can use it as a stand along module if needed
    # Since DEVCONINFO is already being run, I'm just going to take the same output and parse it
    # This will save io, memory, and increase the device ID speed.
    echo "AT+REACTIVE=1,0,0" | socat -t 3 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/frp_lock_status.log

    aos_sam_frp_lock_status_AT=$(cat /tmp/frp_lock_status.log | grep -o "TRIGGERED\|UNLOCK\|LOCK" | sed 's/UNLOCK/OFF/;s/TRIGGERED/ON/;s/LOCK/ON/' | uniq)

    printf "\n${PURPLE}[INFO]${NC}${CYAN} FRP Lock Status:${NC}${PURPLE} ${aos_sam_frp_lock_status_AT}${NC}"



    ####################################################################################################################
    #################### DIAGNOSTICS ###################################################################################
    ####################################################################################################################

    double_space
    printf "\n${PURPLE}####################################################################################${NC}"
    printf "\n${PURPLE}------------------------------ Android - Samsung - Diagnostics ---------------------${NC}"
    printf "\n${PURPLE}####################################################################################${NC}"

    double_space

    #################### BATTERY PERCENTAGE ####################################

    echo "ATZ" | socat -t 2 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/dev/null

    echo "AT+CBC" | socat -t 3 -,escape=0x0f `ls /dev/cu.usbmodem*`,crnl &>/tmp/aos_battery_percentage_AT.log
    aos_sam_battery_percentage_AT=$(cat /tmp/aos_battery_percentage_AT.log | sed -e 's/\AT+CBC//g' | awk -F ',' '{print $2}' | tr -s '\n' | tail -1)

    if [[ ${aos_sam_battery_percentage_AT} ]]; then
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Battery Percentage:${NC}${PURPLE} ${aos_sam_battery_percentage_AT}${NC}"
    else
        printf "\n${PURPLE}[INFO]${NC}${CYAN} Battery Percentage:${NC}${YELLOW} No Result Found${NC}"
    fi

    double_space
}

sam_id | tee sam_id.txt