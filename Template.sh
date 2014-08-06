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
    # 全局配置实际路径
		LOCAL_PATH=$(dirname "$0");
    # 获取脚本同名配置
		CONF_FILE="$1"
    # 加载日志函数
    if [ -f $LOCAL_PATH/$CONF_FILE ];then
        echo -e "$CONF_FILE is \033[32mFound.\033[0m"
        source $LOCAL_PATH/$CONF_FILE
    else
        echo -e "$CONF_FILE is \033[31mNot Found.\033[0m"
    fi
}

NotRootOut;
ReadConf "Global.conf";
ReadConf "$(basename $0 .sh).conf";
ReadConf "log.sh";
LOG_INFO "Load Configures Done.\n"

############### Template Version 0.1.2 ##############
#####################################################
# Template
#####################################################
# Version : 0.0.11
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-22
# v0.0.1(2014-7-22) : File Created
# v0.0.2(2014-7-22) : Add NotRootOut()
# v0.0.3(2014-7-22) : Add BreakPoint()
# v0.0.4(2014-7-22) : Add Debug Flag
# v0.0.5(2014-7-22) : Add ReadConf()
# v0.0.6(2014-7-24) : Add GetIPAddress()
# v0.0.7(2014-7-28) : Add ReadLogf()
# v0.0.8(2014-7-30) : More ColorFul Now.
# v0.0.9(2014-7-30) : CommonFirst And BreakPoint Debuged.
# v0.0.10(2014-7-30) : ReadConf() Add Check info
# v0.1.0(2014-7-31) : Template Update to V0.1
# v0.1.1(2014-8-5) : Add ReadGlobal()
# v0.1.2(2014-8-5) : Add < ReadGlobal ReadConf ReadLogf > in one