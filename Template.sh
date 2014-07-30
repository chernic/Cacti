#!/bin/bash
#####################################################
# Template
#####################################################
# Version : 0.0.9
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-22
export PS4='+[$LINENO]'

BreakPoint()
{
	while [ "y" != "$AUTO_FLAG_yn" ]
	do
		read -p "\033[33mDo you Make Sure to Continue? [y/n/q] \033[0m" AUTO_FLAG_yn;
		[ "$AUTO_FLAG_yn" == "q" ] && exit 0;
	done
	AUTO_FLAG_yn="n"
}

NotRootOut()
{
	[ "0" != "$(id -u)" ] && echo "Error: You must be root to run this script" && exit 1 
}

GetIPAddress()
{
	IPAddress=`ifconfig eth0 | grep 'inet addr' | cut -d ":" -f 2 | cut -d " " -f 1`
}

ReadConf()
{
	# 获取脚本同名配置
	CONF_FILE=$(basename $0 .sh).conf
	# 加载日志函数
	[ -f $CONF_FILE ] && . $CONF_FILE
}

ReadLogf()
{
	if [ -z $LOG_IS_NEEDED ]; then
	# 日志脚本实际路径
	  LOCAL_PATH=$(dirname "$0");
	# 加载日志函数
	  source "${LOCAL_PATH}/log.sh";
	fi
}
############### Template Version 0.0.9 ##############

# v0.0.2(2014-7-22) : Add NotRootOut()
# v0.0.3(2014-7-22) : Add BreakPoint()
# v0.0.4(2014-7-22) : Add Debug Flag
# v0.0.5(2014-7-22) : Add ReadConf()
# v0.0.6(2014-7-24) : Add GetIPAddress()
# v0.0.7(2014-7-28) : Add ReadLogf()
# v0.0.8(2014-7-30) : More ColorFul Now.
# v0.0.9(2014-7-30) : CommonFirst And BreakPoint Debuged.