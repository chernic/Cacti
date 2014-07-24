#!/bin/sh
#####################################################
# Functions of Download
#####################################################
# Version : 0.0.6
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-6-17
# v0.0.2(2014-7-22) : Add Download_Failbreak()
# v0.0.3(2014-7-22) : Add Download_Always()
# v0.0.4(2014-7-22) : Add Download_Check
# v0.0.5(2014-7-22) : Add Files_Download()
# v0.0.6(2014-7-22) : Add Files_Check()

# This function will break while downloading fail
Download_Failbreak()
{
	if [ -s "${src_url##*/}" ]; then
		echo -e "${src_url##*/} exists."
	else
		echo -e "${src_url##*/} does not exist. Downloading it ..."
		wget -c --no-check-certificate $src_url
	fi
	
	if [ ! -e "${src_url##*/}" ];then
		echo -e "\033[31mFail to downloaded ${src_url##*/}, Please contact the author! \033[0m"
		kill -9 $$
	fi
}

# This function will always download When existed not
Download_Always()
{
	if [ ! -s "${src_url##*/}" ]; then
		echo -e "${src_url##*/} does not exist, Downloading it ..."
		wget -c --no-check-certificate $src_url
	fi
}

# This function will always download
Download_Check()
{
	if [ ! -e "${src_url##*/}" ];then
		echo -e "\033[31m\nFail to download ${src_url##*/}, Please contact the author! \033[0m"
	else
		echo -e "\033[31m exists. \033[0m"
	fi
}

Files_Download()
{
	echo -e "\n******* Now We are Ready to Download Files" 
	for name in ${WGET_LINK[@]}
	do
		echo "*** Downloading $name if not found it."
		eval "for j in \${$name[@]}
			 do
				src_url=\$j && Download_Always
			 done"
	done
}

# rm npc-2.0.4.tar.gz
Files_Check()
{
	echo -e "\n******* Now We are Ready to Check Files" 
	for name in ${WGET_LINK[@]}
	do
		echo -ne "*** Searching $name ..."
		eval "for j in \${$name[0]}
			 do
				src_url=\$j && Download_Check
			 done"
	done
}

