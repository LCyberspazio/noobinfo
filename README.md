# noobinfo
A GNU/Linux tool to generate a complete report of hardware specs, ready to share on a forum to help resolving hardware and software issues.

It also automatically upload the report to the paste bin arin.ga

# Developer
Giovanni Santostefano @LCyberspazio

# USAGE
If you have some issues with a new piece of hardware that doesn't seems 
to work with your GNU/Linux distro and you want to write on a forum 
searching for someone to help you, you have to provide many hardware and 
software specifications.

If you don't know wich is the correct data to share, try to run this 
script and then upload the report somewhere.

WARNING: this script will generate a report with private data from your 
system and could represent a security risk. So use it consciously.

To run the script you must be root or use sudo to grant privileges 
needed to access the /var/log/dmesg file. Otherwise comment the uid 
check and also comment the dmesg lines.

Run with:

/bin/bash noobinfo.sh

and then follow the instructions. Once the script has completed its 
execution please share the created reports. Report is provided in two 
forms: a tar.gz form if you can upload it somwhere and a .txt form 
containing the loooooong report.

It also upload the txt report to the paste bin arin.ga

# Thanks

Thanks for the suggestions to:

Holger_Gehrke
and everyone gave me feedback useful to improve this script.
