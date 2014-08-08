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
# Function to Configure cacticn
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-08-05
# v0.0.1(2014-08-05) : File Created

SqlConf3_1()
{
	FILE=$1       # 文件名称
	START=$2      # 开始标志
	ADDFLG=$3     # 分割标志
	CONTENT=$4    # 更改内容
	ADDWHERE=$5   # 第几段内容
		TARGET='\([^'$ADDFLG']*\)'$ADDFLG
		BEFORE=''
		for((i=1;i<=$ADDWHERE;i++));
		do 
			TARGET=$TARGET'\([^'$ADDFLG']*\)'$ADDFLG
			BEFORE=$BEFORE'\\('$i'\),'
		done
		#echo $TARGET # TARGET='\([^,]*\),\([^,]*\),\([^,]*\),\([^,]*\),\([^,]*\),\([^,]*\),\([^,]*\),'
		#echo $BEFORE # BEFORE='\1,\2,\3,\4,\5,\6,'
		sed -i "/$START/{
		s@$START.*@$START (1, 8, '本机', '127.0.0.1', '', 'public', 2, '', '', 'MD5', '', 'DES', '', 161, 500, 2, 3, 23, 400, 1, 10, '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 9.99999, 0.00000, 0.00000, 0.00000, 0, 0, 100.00000);@
		}" $FILE
		# sed -i "/$START/{
		# s@$TARGET@$BEFORE $CONTENT,@
		# }" $FILE
		sed -n "/$START/p" $FILE
} 

sed -i 's@TYPE=MyISAM@ENGINE=MyISAM@g' $CACTI_LINK/cacti.sql
# sed -i "s@^INSERT INTO \`host\` VALUES.*@INSERT INTO \`host\` VALUES (1, 8, '本机', '127.0.0.1', '', 'public', 2, '', '', 'MD5', '', 'DES', '', 161, 500, 2, 3, 23, 400, 1, 10, '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 9.99999, 0.00000, 0.00000, 0.00000, 0, 0, 100.00000);@
# }"
# SqlConf3_1 "$CACTI_LINK/cacti.sql"  "INSERT INTO \`host\` VALUES"  ","  2  6 