#!/bin/sh
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
	if [ -f $CONF_FILE ];then
		. $CONF_FILE
		echo -e "Configure is \033[32mFound.\033[0m"
	else
		echo -e "Configure is \033[32mNot Found.\033[0m"
	fi
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

NotRootOut;
ReadConf
ReadLogf;
LOG_INFO "Load Configure Done.\n"

############### Template Version 0.1.0 ##############
#####################################################
# Function of Check The Paths Of MySQL
#####################################################
# Version : 0.0.11
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-30
# v0.0.1(2014-7-30) : File Created
GetInfoMysqld_safe()
{
	#ps -ef|grep  "/mysqld_safe "
	datadir=`ps -ef|grep  "/mysqld_safe " | awk -F"--datadir="   '{ print $2 }' | awk -F" "  '{ print $1 }'`
	pid_file=`ps -ef|grep "/mysqld_safe " | awk -F"--pid-file="  '{ print $2 }' | awk -F" "  '{ print $1 }'`
	echo "datadir=$datadir"
	echo "pid_file=$pid_file"
}

GetInfoMysqld()
{
	#ps -ef|grep  "/mysqld "
	basedir=`ps -ef|grep  "/mysqld "   | awk -F"--basedir="     '{ print $2 }' | awk -F" "  '{ print $1 }'`
	datadir=`ps -ef|grep  "/mysqld "   | awk -F"--datadir="     '{ print $2 }' | awk -F" "  '{ print $1 }'`
	plugin_dir=`ps -ef|grep  "/mysqld "| awk -F"--plugin-dir="  '{ print $2 }' | awk -F" "  '{ print $1 }'`
	user=`ps -ef|grep  "/mysqld "      | awk -F"--user="        '{ print $2 }' | awk -F" "  '{ print $1 }'`
	log_error=`ps -ef|grep  "/mysqld " | awk -F"--log-error="   '{ print $2 }' | awk -F" "  '{ print $1 }'`
	pid_file=`ps -ef|grep  "/mysqld "  | awk -F"--pid-file="    '{ print $2 }' | awk -F" "  '{ print $1 }'`
	socket=`ps -ef|grep  "/mysqld "    | awk -F"--socket="      '{ print $2 }' | awk -F" "  '{ print $1 }'`
	
	echo "user=$user"
	
	echo "basedir=$basedir"
	echo "plugin_dir=$plugin_dir"
	echo "log_error=$log_error"		
	
	echo "datadir=$datadir"
	echo "pid_file=$pid_file"
	echo "socket=$socket"
}

LOG_INFO "List Process enoD"
	echo " // Process Mysqld_safe"
	GetInfoMysqld_safe;

	echo " // Process mysqld"
	GetInfoMysqld;
LOG_INFO "List Process Done.\n"
