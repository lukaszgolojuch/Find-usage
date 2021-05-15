#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

findLogs(){
echo ""
echo "Give name of the log (without extention):"
read log_name
sudo find / -type f -name "$log_name.log"
echo ""
}

findEmptyFiles(){
echo ""
echo "Give file directory where you would like to find empty files"
read file_dir
sudo find /$file_dir -type f -empty 
echo ""
}

findEditedFiles(){
echo ""
echo "Timeline of change (minutes): "
read timeline
echo "Give file directory where you would like to find empty files"
read file_dir
echo "Files that had been change in lat $timeline minutes under /$file_dir direction"
sudo find /$file_dir -cmin -$timeline
echo ""
}

findHiddenFiles(){
echo ""
echo "Give file directory where you would like to find hidden files"
read file_dir
find /$file_dir -type f -name ".*"
echo ""
}

findExecutable(){
echo ""
echo "Give direction where you would like to find executable file:"
read file_dir
sudo find / -perm /a=x
echo ""
}

runProgramWithout777(){
echo "${RED}This program will edit access on your file ${RESET}"
echo "Give direction where you would like to find executable file:"
read file_dir
echo "File name:"
read file_name

sudo find /$file_dir -type f ! -perm 777 -name $file_name -exec chmod 777 {} \;
echo "${GREEN}Running $file_name... ${RESET}"
sudo ./$file_name
}

echo "=================================================="
echo "Author: Lukasz Golojuch"
echo "Operating system: Linux"
echo "Version of system: Knoppix 9.1"
echo "Language: bash"
echo "=================================================="
echo "Program description: grep functionality usage"
echo "=================================================="
echo "Hello $USER" 
echo ""
echo "Menu"
echo "1. Find logs with set name"
echo "2. Find all empty files under certain direction"
echo "3. Find file that were edited"
echo "4. Find hidden files"
echo "5. Find executable files"
echo "6. Run .sh program that do not have 777 permission"
echo ""
echo "Twoj wybor:"
read answ

 if [ $answ -eq 1 ]
 then 
	findLogs
 elif [ $answ -eq 2 ]
 then
	findEmptyFiles
 elif [ $answ -eq 3 ]
 then
	findEditedFiles
 elif [ $answ -eq 4 ]
 then
	findHiddenFiles
 elif [ $answ -eq 5 ]
 then
	findExecutable
 elif [ $answ -eq 6 ]
 then
	runProgramWithout777
 fi