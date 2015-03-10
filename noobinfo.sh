#! /bin/bash

#CryptStorage  Copyright (C) 2013  Giovanni Santostefano
#This program comes with ABSOLUTELY NO WARRANTY; 
#for details type `show w'.
#This is free software, and you are welcome to redistribute it
#under certain conditions; type `show c' for details.

#Are you a GNU/Linux user who post on a forum: hey guys my wifi dongle
#won't work? And you don't add any useful information?
#This script takes all the informations about an hardware system, kernel
#and other important stuff. Then it packetize these information in a 
#tar.gz archive ready to be shared in case of GNU/Linux problem.

TARGET_TMP_DIR=$(mktemp -d)

clear
echo "NoobInfo by Giovanni Santostefano @LCyberspazio"
echo "-----------------------------------------------"
echo "This program allows you to collect info about your system"
echo "these info are useful to receive help for many GNU/Linux"
echo "related problems"
echo
echo "Warning! Sharing these informations may reveal lots of things"
echo "about your system!"
echo
if [ $(id -u) != 0 ]; then
   echo
   echo
   echo "========= ERROR!!!! ========="
   echo "This script requires root permissions"
   echo "So, if you don't want root on the system"
   echo "use sudo or /bin/su"
   exit 9
fi
echo
echo -n "Enter output archive name(no extension): "
read outarchfile

echo "##### UNAME #####" > $outarchfile.log.txt
uname -a > $TARGET_TMP_DIR/uname.log
cat $TARGET_TMP_DIR/uname.log >> $outarchfile.log.txt
echo "#################################################" >> $outarchfile.log.txt

echo "##### LSCPU #####" >> $outarchfile.log.txt
lscpu > $TARGET_TMP_DIR/lscpu.log
cat $TARGET_TMP_DIR/lscpu.log >> $outarchfile.log.txt
echo "#################################################" >> $outarchfile.log.txt

echo "##### LSMOD #####" >> $outarchfile.log.txt
lsmod > $TARGET_TMP_DIR/lsmod.log
cat $TARGET_TMP_DIR/lsmod.log >> $outarchfile.log.txt
echo "#################################################" >> $outarchfile.log.txt

echo "##### LSUSB #####" >> $outarchfile.log.txt
lsusb -v > $TARGET_TMP_DIR/lsusb.log
cat $TARGET_TMP_DIR/lsusb.log >> $outarchfile.log.txt
echo "#################################################" >> $outarchfile.log.txt

echo "##### LSPCI #####" >> $outarchfile.log.txt
lspci -v > $TARGET_TMP_DIR/lspci.log
cat $TARGET_TMP_DIR/lspci.log >> $outarchfile.log.txt
echo "#################################################" >> $outarchfile.log.txt

echo "##### LSSCSI #####" >> $outarchfile.log.txt
lsscsi -v > $TARGET_TMP_DIR/lsscsi.log
cat $TARGET_TMP_DIR/lsscsi.log >> $outarchfile.log.txt
echo "#################################################" >> $outarchfile.log.txt

echo "##### LSPCMCIA #####" >> $outarchfile.log.txt
lspcmcia -v > $TARGET_TMP_DIR/lspci.log
cat $TARGET_TMP_DIR/lspci.log >> $outarchfile.log.txt
echo "#################################################" >> $outarchfile.log.txt


echo "##### DMESG #####" >> $outarchfile.log.txt
cat /var/log/dmesg > $TARGET_TMP_DIR/dmesg.log
cat $TARGET_TMP_DIR/dmesg.log >> $outarchfile.log.txt
echo "#################################################" >> $outarchfile.log.txt

#creating the tar.gz with all the separate outputs
tar cvzf $outarchfile.tar.gz $TARGET_TMP_DIR/*

#cleaning all files
rm -rf $TARGET_TMP_DIR

clear
echo "REPORT FILES:"
echo $outarchfile.log.txt
echo $outarchfile.tar.gz 
echo "Successfully created..." 
echo
echo
echo -n "Upload the report on a pastebin resource (arin.ga)? [y/n]: "
read upchoice
if [[ $upchoice =~ ^[Yy] ]]
then
    echo "Uploading report to arin.ga, copy and paste the following link: "
    cat $outarchfile.log.txt | curl -F "aringa=<-" arin.ga
else
    echo "Have a nice day!"
fi

echo
