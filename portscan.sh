#!/bin/bash

# Author --> IRVING ST --> AK --> (th3hostname) nmap y pa dentro

#Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

export DEBIAN_FRONTEND=noninteractive

trap  ctrl_c INT

# control_C
function ctrl_c(){

	echo  -e "\n\t${yellowColour}[!]${endColour}${grayColour}Saliendo...\n${endColour}"
	tput  cnorm; exit  1

}

# helpPanel

function helpPanel(){
	echo -e "\n${yellowColour}Author:${endColour} th3hostname${redColour}${endColour}"
	echo -e "\n\t${yellowColour}[*]${endColour}${purpleColour}Uso:${endColour}${redColour}./portscan.sh -t 127.0.0.1 -i tcp${endColour}"
	echo -e "\t\t${yellowColour}-t)${endColour}${purpleColour}Objetivo${endColour}"
	echo -e "\t\t${yellowColour}-i)${endColour}${purpleColour}Modos de escaneo${endColour}"
	echo -e "\t\t${yellowColour} 1)${endColour}${purpleColour}Tcp${endColour}"
	echo -e "\t\t${yellowColour} 2)${endColour}${purpleColour}Udp${endColour}"
}

# Scanning  ports
function scaning_ports(){

	if  [ $(echo $scaning_ports) ==  "tcp" ];  then 
	     
	for port1 in {1..64000}; do
		echo '' > /dev/tcp/$target/$port1 
		if [ "$(echo $?)" == "0" ]; then
		      echo  -e "\n\t${yellowColour}[*]${endColour}${purpleColour}Puerto: ${endColour}${redColour} $port1 ${endColour}${purpleColour}abierto...${endColour}" 
	        fi
	done

elif [ $(echo $scaning_ports) == "udp" ]; then  

	for port2 in {1..64000}; do
		echo '' > /dev/udp/$target/$port2
		if [ "$(echo $?)" == "0" ]; then
			echo  -e "\n\t${yellowColour}[*]${endColour}${purpleColour}Puerto: ${endColour}${redColour} $port2 ${endColour}${purpleColour}abierto...${endColour}" 
		fi
	done
        else
		echo -e "${redColour}Modo de ataque -->  no existente  ${endColour}"
	fi
}

# main

parameter_counter=0; while  getopts ":t:i:h:" arg; do
	case $arg in
		t) target=$OPTARG; let  parameter_counter+=1;;
		i) scaning_ports=$OPTARG; let parameter_counter+=1;;
		h) helpPanel;;
	esac
done

# Use correc  verification.

if [ $parameter_counter -eq 0 ]; then
	helpPanel
else
	scaning_ports 2>/dev/null
fi

