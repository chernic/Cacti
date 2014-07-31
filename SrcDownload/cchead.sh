#!/bin/bash
# Author:  yeho <lj2007331 AT gmail.com>
# Blog:  http://blog.linuxeye.com

LABLE3='\n\n### Cc@FS: '
LABLE2='\n## Cc@FS: '
LABLE1='# Cc@FS: '

Download_src()
{
	[ -s "${src_url##*/}" ] && echo "${src_url##*/} found" || wget -c --no-check-certificate $src_url
        if [ ! -e "${src_url##*/}" ];then
                echo -e "\033[31m${src_url##*/} download failed, Please contact the author! \033[0m"
                kill -9 $$
        fi
}
Cc_Wait()
{
	while :
	do
		echo
		read -p "Wait! And do you want to go ahead now? [y/n]: " step_yn
		if [ "$step_yn" != 'y' -a "$step_yn" != 'n' ];then
			echo -e "\033[31minput error! Please only input 'y' or 'n'\033[0m"
		elif [ "$step_yn" == 'y' ];then
			echo -e "\033[31mYou choose to go ahead.\033[0m" && break
		else
			echo -e "\033[31mYou choose to stop the game.\033[0m" && exit 0
		fi
	done
}

GetValFromURL()
{
	#echo "Here we get values from url"
	filename=${src_url##*/} 
	#&& echo "filename=$filename"
	softwarename=${filename%-*} 
	#&& echo "softwarename=$softwarename"
	version=$( echo "$filename" | sed -n '/^.*-/{s///;s/\.[a-z].*//;p}' ) 
	#&& echo "version=$version"
}
