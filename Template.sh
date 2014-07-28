#!/bin/bash
#####################################################
# Template
#####################################################
# Version : 0.0.6
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-22
export PS4='+[$LINENO]'
AUTO_FLAG_yn="n"
BreakPoint()
{
	while [ "$AUTO_FLAG_yn" != "y" ]
	do
		read -p "Do you Make Sure to Continue? [y/n/q] " AUTO_FLAG_yn;
		[ "$AUTO_FLAG_yn" == "q" ] && exit 0;
	done
}

NotRootOut()
{
	[ $(id -u) != "0" ] && echo "Error: You must be root to run this script" && exit 1 
}

GetIPAddress()
{
	IPAddress=`ifconfig eth0 | grep 'inet addr' | cut -d ":" -f 2 | cut -d " " -f 1`
}

ReadConf()
{
	# [获取本文件路径中 的 文件名称] 即本文件名的配置文件
	CONF_FILE=$(basename $0 .sh).conf
	# 判断对应文件是否存在,若存在则导入
	[ -f $CONF_FILE ] && . $CONF_FILE
}
############### Template Version 0.0.6 ##############

# v0.0.2(2014-7-22) : Add NotRootOut()
# v0.0.3(2014-7-22) : Add BreakPoint()
# v0.0.4(2014-7-22) : Add Debug Flag
# v0.0.5(2014-7-22) : Add ReadConf()
# v0.0.6(2014-7-24) : Add GetIPAddress()