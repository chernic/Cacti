#!/bin/sh
function BreakPoint()
{
    while [ "y" != "$AUTO_FLAG_yn" ]
    do
        read -p "\033[33mDo you Make Sure to Continue? [y/n/q] \033[0m" AUTO_FLAG_yn;
        [ "$AUTO_FLAG_yn" == "q" ] && exit 0;
    done
    AUTO_FLAG_yn="n"
}

function NotRootOut()
{
    [ "0" != "$(id -u)" ] && echo "Error: You must be root to run this script" && exit 1 
}
# @function    Log2File
# @brief    写日志到文件。
# @param1    LogLevel（字符串）    日志级别（字符串）
# @param2    LogContext（字符串）  日志内容
# @param3    LogFile（字符串）     日志文件
# @return    无
function Log2File()
{
    local LogLevel=$1;
    local LogCtx=$2;
    local LogFile=$3;

    local LogTime="$(date '+%Y-%m-%d %H:%M:%S')";
    
    local LogStr="[${LogTime}][${LogLevel}]: ${LogCtx}"; 

    if [ "$LogFile" = "" ]; then
        echo -e "${LogStr}";
    else
        echo -e "${LogStr}" >> "${LogFile}";         
    fi
}

# @function    LOG_INFO,LOG_WARN,LOG_ERROR
# @brief     按指定级别写日志到文件。
# @param1    LogContext（字符串） 日志内容
# @param2    LogFile（字符串）    日志文件
# @return    无
function LOG_INFO(){
    Log2File "\033[32minfo\033[0m" "$1" "$2";
}
function LOG_WARN(){
    Log2File "\033[33mwarn\033[0m" "$1" "$2";
}
function LOG_ERROR(){
    Log2File "\033[31merror\033[0m" "$1" "$2";
}

NotRootOut;
############### Template Version 0.1.2- #############
#####################################################
# Function Of Device Check
# Run this Script every 5 min on CACTI SERVER.
# Format should be : HOSTNAME:<IP-Addr>:<Description>
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-08-07
# v0.0.1(2014-08-07) : File Created
# v0.1.0(2014-08-08) : Version 1 Done. Local Tested.

DB_user="cacticn"		         # 数据库用户 : 默认 cacticn
DB_pswd="cacticn"		         # 数据库密码 : 默认 cacticn
PHP_PATH="/usr/bin/"             # PHP程序路径
CHK_PATH=`pwd`                   # "/usr/share/cacti/"
CLI_PATH="/var/www/html/cacticn" # Cacti

LOG_INFO "Read $CHK_PATH/cacti_clients"
while read line
do
	# 信息提取
	IP=`echo -e "$line" | grep "HOSTNAME" | awk -F: '{print $2}'`
	DESC=`echo -e "$line" | grep "HOSTNAME" | awk -F: '{print $3}'`
	Device_Flag="NEW"	
	#IP=192.168.1.2
	#DESC="Chernic"
	
	# 信息匹配
	if [ "$DESC" != "" ];then
		# 查找该设备描述是否已经对应存在IP
		# LOG_INFO "\n`$PHP_PATH/php -q $CLI_PATH//cli/add_data_query.php --list-hosts | grep "$DESC"`"
		for i in `$PHP_PATH/php -q $CLI_PATH/cli/add_data_query.php --list-hosts | grep "$DESC" | sed 's/\t/,/g' | awk -F, '{print $2}'`
		do
			if [ "$IP" == "$i" ];then
				Device_Flag="IPDESC"			
				break;
			fi
			Device_Flag="DESC"
		done
	else
		Device_Flag="NODESC"
	fi
	
	# 方案判断
	case $Device_Flag in
		NEW)    
			LOG_INFO "A1 ADD New";
		;;
		DESC)   
			LOG_INFO "A2 ADD weN";
			OLDIP="$i"
			NUM=0;
			# IP地址冲突
			while [ "$OLDIP" != "" ];
			do
				# 修改设备描述符
				NDESC="$DESC""_""$NUM";
				# 再次查找是否存在冲突
				OLDIP=`$PHP_PATH/php -q $CLI_PATH/cli/add_data_query.php --list-hosts | grep -w "\b$NDESC\b" | sed 's/\t/,/g' | awk -F, '{print $2}'`
				# 冲突标号自加1
				NUM=$[$NUM+1];
			done
			DESC="$NDESC"
		;; 
		IPDESC)
			LOG_WARN "A3 Added yet, $IP $DESC";
			continue;
		;;
		NODESC)
			LOG_INFO "A4 ADD None";
			continue;
		;;
		*)      
			LOG_ERROR "A5 ADD What";
			continue;
		;;
	esac
	
	# 执行:添加设备
	LOG_INFO "Try Adding Host : ID=$ID DESC=$DESC  IP=$IP"
		$PHP_PATH/php -q $CLI_PATH/cli/add_device.php --description=$DESC --ip=$IP --template=3 --avail=pingsnmp --ping_method=udp --community="public" --version=2	
		ID=`$PHP_PATH/php -q $CLI_PATH/cli/add_data_query.php --list-hosts | grep -w "\b$DESC\b" | sed 's/\t/,/g' | awk -F, '{print $1}'`
		LOG_INFO "Added Host : ID=$ID DESC=$DESC  IP=$IP"
	
	# 执行:添加图像
	LOG_INFO "Adding Maps."
		# $PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=ds --graph-template-id=2 --snmp-query-id=1 --snmp-query-type-id=13 --snmp-field=ifOperStatus --snmp-value=Up
		$PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=4
		$PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=7
		$PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=8
		$PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=9
		$PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=10
		# $PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=11
		$PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=12
		$PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=13
		# $PHP_PATH/php -q $CLI_PATH/cli/add_graphs.php --host-id=$ID --graph-type=cg --graph-template-id=21

		# 执行:添加硬盘(先查询)
		Disk=`/usr/bin/php -q /usr/share/cacti/cli/add_graphs.php --host-id=$ID --snmp-field=dskDevice --list-snmp-values | grep -v "Known"`
		for i in $Disk
		do
			/usr/bin/php php -q /usr/share/cacti/cli/add_graphs.php --host-id=$ID --graph-type=ds --graph-template-id=21 --snmp-query-id=6 --snmp-query-type-id=15 --snmp-field=dskDevice --snmp-value=$i
		done
	
	# 执行:添加树
	LOG_INFO "Adding Host to Tree : ID=$ID DESC=$DESC  IP=$IP"
		dbase=`mysql -u$DB_user -p$DB_pswd -e"use cacticn; select host_id from graph_tree_items where host_id =$ID;"`
		res=`echo $dbase | awk '{print $2}'`
		if [ "$res" != "$ID" ];then
			$PHP_PATH/php -q $CLI_PATH/cli/add_tree.php --type=node --node-type=host --tree-id=1 --host-id=$ID
		else
			echo -e "\nAlready Graph Tree Exists fo this Host\n"
		fi
	
done <"$CHK_PATH/cacti_clients"
LOG_INFO "End."


