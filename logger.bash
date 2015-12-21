#!/bin/bash

###################################################
# Patrick DuRussel II
# Feb 14 2014
# The logger | My first test to make a logging
# system.  This will allow me to type comments into
# the terminal and save them to a file with 
# time and date stamps
# Version: 1
###################################################

# Functions ::::::::::::::
function cleanup {
    #clean up on hot key exit
    if [ -a "file.txt" ];then
    rm $file.txt;
    fi
    echo "You have exited properly";
    printf "You logged today: \n";
    cat $title.txt; 
    exit 1;
}

#Variables _------------------------
stop=0;

echo "Please enter test data: \n"

echo "---notes: |"

echo "Please enter the name of your notes"
read title
echo "\nStart logging notes.\n"

while [ "$stop" -eq 0 ];
do

while read line ;
do

  # break if the line is empty
 [ -z "$line" ] && break
echo $line>>file.txt
done
if [[ -f "file.txt" ]]; then
date "+$title DATE: %Y-%m-%d TIME: %H:%M:%S">>$title.txt
cat file.txt>>$title.txt
printf "\n">>$title.txt
cat file.txt
rm file.txt
fi
trap cleanup INT

done



exit 