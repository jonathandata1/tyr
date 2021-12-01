#! /bin/bash

# ---------------------------------------------------------------------------------------------
#  TyR
#  Creation Date: 11/29/2021
#  Description: Android Recon & Research Tools
#  Author: Jonathan Scott
#  @jonathandata1
#
# ---------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------
# Dependencies List

    # printf "\n ${PURPLE}-------------------------- Checking For Dependencies -----------------------------------${NC}"
    # set -e
    # If you are on on a MacOS you will need to install brew package manager
    # brew install apktool
    # brew install peco
    # brew install uuidgen
    # brew install socat

    # If you are on linux
    # sudo apt install apktool
    # sudo apt install uuidgen
    # sudo apt install socat
    # sudo apt install peco

    # You will also need to make sure adb is installed
    # linux and mac you can install adb with
    # pip3 install adb

    #    BREW_PACKAGES="apktool peco wget  curl pv"
    #    brew install ${BREW_PACKAGES} && true
    #    brew cask install ${BREW_PACKAGES_CASK} && true

# ---------------------------------------------------------------------------------------------
# ADDING SOME COLOR  & EASY FORMATTING TO THE TERMINAL OUTPUT
# ---------------------------------------------------------------------------------------------


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
# PERSISTENT VARIABLES - DO NOT REMOVE!!!
# ---------------------------------------------------------------------------------------------

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    #time_date=$(date +'%a-%h-%d-%Y-%I_%M_%S-%Z')

    # This will allow ctrl c to end the specific option number
    # without having to restart the full app
    # trap ctrl-c and call ctrl_c()


    trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }


    pause(){

        read -p "The selected process has completed. Press The 'Enter' Key, and select an option." fackEnterKey
    }





    double_space

    zero="Samsung Identification - AT Commands - Linux"
    zero() {

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #0 - ${zero} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_0(){


       sh "${__dir}"/android_tools/android_identification_at_commands_samsung_linux.sh



        }
            method_0

            pause
    }

    one="Samsung Identification - AT Commands - MacOS"
    one() {

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #1 - ${one} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_1(){

        sh "${__dir}"/android_tools/android_identification_at_commands_samsung.sh


        }
            method_1

        pause
    }

    two="Pull All System APKs & Unpack Them - All Androids"
    two (){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #2 - ${two} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_2(){

         sh "${__dir}"/android_tools/pull_system_apks.sh


        }
            method_2

        pause
    }

    three="Select & Download Any APK & Unpack It - All Androids"
    three (){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #3 - ${three} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_3(){

         sh "${__dir}"/android_tools/pull_single_apk.sh


        }
            method_3

        pause
    }

    four="LG Identification - AT Commands - COMING SOON"
    four (){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #4 - ${four} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_4(){

        echo "Coming Soon"


        }
            method_4

        pause
    }

    five="Dump Secret Codes - All Androids"
    five(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #5 - ${five} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_5(){

        sh "${__dir}"/android_tools/dump_android_secret_codes.sh


        }
            method_5

        pause
    }

    six="Run Secret Codes (Manual Selection) - All Androids - COMING SOON"
    six(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #6 - ${six} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_6(){

        echo "Coming Soon"


        }
            method_6

        pause
    }

seven="Bug Report Dump - All Androids - COMING SOON"
    seven(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #7 - ${seven} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_7(){

        echo "Coming Soon"


        }
            method_7

        pause
    }

    eight="View Bug Report Data In GUI - All Androids - COMING SOON"
    eight(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #8 - ${eight} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_8(){

       echo "Coming Soon"


        }
            method_8

        pause
    }

    nine="Instant Factory Reset - Samsung Devices - Linux"
    nine(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #9 - ${nine} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_9(){

        sh "${__dir}"/android_tools/factory_reset_samsung_linux.sh


        }
            method_9

        pause
    }

    ten="Instant Factory Reset - Samsung Devices - MacOS"
    ten(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #10 - ${ten} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_10(){

        sh "${__dir}"/android_tools/factory_reset_samsung.sh



        }
            method_10

        pause
    }

    eleven="Instant Factory Reset - LG Devices - Linux"
    eleven(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #11 - ${eleven} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_11(){

       sh "${__dir}"/android_tools/factory_reset_lg_linux.sh



        }
            method_11

        pause
    }

    twelve="Instant Factory Reset - LG Devices - MacOS"
    twelve(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #12 - ${twelve} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_12(){

        sh "${__dir}"/android_tools/factory_reset_lg.sh


        }
            method_12

        pause
    }
    thirteen="Auto Enable ADB - Samsung - MacOS"
    thirteen(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #13 - ${thirteen} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_13(){

       sh "${__dir}"/android_tools/enable_adb_at_samsung.sh


        }
            method_13

        pause
    }
    fourteen="Auto Enable ADB - Samsung - Linux"
    fourteen(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #14 - ${fourteen} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_14(){

       sh "${__dir}"/android_tools/enable_adb_at_samsung_linux.sh


        }
            method_14

        pause
    }
    fifteen="Bypass FRP, MDM, Passcode (Use Auto Enable ADB Method First)"
    fifteen(){

        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        printf "%s\n${CYAN} RUNNING METHOD #15 - ${fifteen} ${NC}"
        printf "%s\n${PURPLE}--------------------------------------------------------------${NC}"
        double_space
        trap ctrl_c INT

          function ctrl_c() {
            echo
            echo "Ctrl-C Ended the Application"
            # do the jobs
            exit
    }
        method_15(){

       sh "${__dir}"/android_tools/bypass_frp_mdm_passcode.sh


        }
            method_15

        pause
    }

    ##############################################
    ##############################################
    show_menus() {
      clear

    printf "%s\n${PURPLE}##############################################################################################################################################################################${NC}"
    printf "%s\n${PURPLE}
	--                     ..::..
	:.                   ..:-=-:....
	                 ....::..:::......
	                :::::::.....::::...
	                    . .::::::::::::
	                       .:::..::::::.          -+==-+---+-:=-======+-+
	                       .::::.:::::::               .....       .   .
	    .:.::---.-::       .:::::.::::::
	     :::-:-::-::       .::::..:::::::
	                       :::.........-::.
	                       :::::........-:::.
	                       ::::::::.:...-=..::.
	--::::::-::::--:      .::::-+=--:::..      ..
	:-:::::::.::::-.      .:::-----:..
	                      .:--=--:.  .
	     -+++-++-*=-      .:----::. .:......
	                       ...:..:.:::----::.              :.
	                       ......:.:::----::::             -*- .
	                       ......::::-:::::...            :+*- =+-
	          :=+==.        ......:.:.........          .-++.  :+*+:
	                          .....:::::..........    :+*=-: ..=*+:   ::::...
	                            .......:::::.:..:-===+==-.....:++.....:::::::::::..
	                               .......:--::::.:::......:-=+=---------:--::::::::::.
	                                  .......:....:.:.:..:-=-::-::-::::-:::----------:::
	                                     .....:....:..:.:..:..:.:....:.::.::.:::-::::-::::.:.
	                  +:-=--:+:-             ...:..............:.......
	                  :... ...                .:.: .. ...
	                                            :..  .
	                                            :....
	                                           ::::.            -=++===--==*
	                                        .:::::              ..-:--:-----.:::-:
	                                :::::--::.:::::.:.          ...:::.::.::...:::

    ${NC}"
    printf "%s\n${PURPLE}-----------------------------------------------------------------------------------------------------------${NC}"
    printf "%s\n${PURPLE}-------------------------------------- Brought To You By: Jonathan Scott -------------------------${NC}"
    printf "%s\n${PURPLE}-------------------------------------- Updated On: 12/01/2021 --------------------------------------${NC}"
    printf "%s\n${PURPLE}-------------------------------------- Version 1.2 -----------------------------------------------------${NC}"
    printf "%s\n${PURPLE}-------------------------------------- Android Recon & Research Tools -------------------------${NC}"
    printf "%s\n${PURPLE}##############################################################################################################################################################################${NC}"


    double_space

	  printf "%s\n${PURPLE}-----------------------------------------------------------------------------------------------------------------------------------------------------${NC}"
    printf "%s\n${YELLOW} TyR Menu ${NC}"
    printf "%s\n${PURPLE}-----------------------------------------------------------------------------------------------------------------------------------------------------${NC}"

    double_space

    echo "0. ${zero}"
    echo "1. ${one}"
    echo "2. ${two}"
    echo "3. ${three}"
    echo "4. ${four}"
    echo "5. ${five}"
    echo "6. ${six}"
    echo "7. ${seven}"
    echo "8. ${eight}"
    echo "9. ${nine}"
    echo "10. ${ten}"
    echo "11. ${eleven}"
    echo "12. ${twelve}"
    echo "13. ${thirteen}"
    echo "14. ${fourteen}"
    echo "15. ${fifteen}"
    echo "16. Exit"

    }
    # Read the user input

    read_options(){
      local choice
      read -p "Enter choice [ 0 - 16 ] " choice
      case ${choice} in
        0) zero ;;
        1) one ;;
        2) two ;;
        3) three ;;
        4) four ;;
        5) five ;;
        6) six ;;
        7) seven ;;
        8) eight ;;
        9) nine ;;
        10) ten ;;
        11) eleven ;;
        12) twelve ;;
        13) thirteen ;;
        14) fourteen ;;
        15) fifteen ;;
        16) exit 0;; #This will exit out of the application
		*) printf "%s\n${RED}Error...Option Not Valid, Please Choose Another${NC}" && sleep 2
	esac


    }

      # ----------------------------------------------
      # Close The Pipes and Stop Transmitting Data
      # ----------------------------------------------
      trap '' SIGINT SIGQUIT SIGTSTP

      # ----------------------------------------------
      # Initialize While Loops For The Main Logic
      # ----------------------------------------------
      while true
      do
        show_menus
        read_options
      done