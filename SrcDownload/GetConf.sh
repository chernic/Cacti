#!/bin/bash
#####################################################
# Functions of Get SNMP's configure -h/snmp.conf
#####################################################
# Version : 0.0.2
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-22
# v0.0.2(2014-7-22) : Confs are to be add automaticly.
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

ReadConf()
{
	# [获取本文件路径中 的 文件名称] 即本文件名的配置文件
	CONF_FILE=$(basename $0 .sh).conf
	# 判断对应文件是否存在,若存在则导入
	[ -f $CONF_FILE ] && . $CONF_FILE
}
############### Template Version 0.0.5 ##############

FUNC__DIR=`pwd`

NotRootOut;
if [ "$1" == "-d" ];then
	DefaultDIR="/mnt/hgfs/GitHub/Repository/Cacti/SrcInstallSnmp/SnmpConfExample"
else
	exit 0;
fi

GetSnmpConf()
{
	cd $FUNC__DIR/src
	if [ -d ${FILE%.tar*} ] ;then 
		echo -e "${FILE%.tar*} is found."
	else 
		echo -e "\033[31m Tar $FILE \033[0m"
		tar zxf $FILE
	fi
	
	
	DIR_SNMP="/usr/local/${FILE%.tar*}"
	cd ${FILE%.tar*}
	./configure -h > $DefaultDIR/${FILE%.tar*}.congigureh
	./configure --prefix=$DIR_SNMP \
	--enable-mfd-rewrites \
	--with-default-snmp-version="2" \
	--with-sys-contact="Chernic,Email:iamchernic@gmail.com" \
	--with-sys-location="Focustar,Guanzhou,China" \
	--with-logfile="/var/log/${FILE%.tar*}.log" \
	--with-persistent-directory="/var/${FILE%.tar*}"
	make #&& make install
	cp EXAMPLE.conf $DefaultDIR/${FILE%.tar*}.conf.original
}

FILE="net-snmp-5.4.4.tar.gz";GetSnmpConf;
FILE="net-snmp-5.5.2.1.tar.gz";GetSnmpConf;
FILE="net-snmp-5.5.2.tar.gz";GetSnmpConf;
FILE="net-snmp-5.6.2.1.tar.gz";GetSnmpConf;
FILE="net-snmp-5.6.2.tar.gz";GetSnmpConf;
FILE="net-snmp-5.7.1.tar.gz";GetSnmpConf;
FILE="net-snmp-5.7.2.1.tar.gz";GetSnmpConf;
FILE="net-snmp-5.7.2.tar.gz";GetSnmpConf;
