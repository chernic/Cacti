#!/bin/sh
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-1
# while :; do :; done
# Tool Needed : xmlstarlet
#####################################################
# 打印头 / 宏
#####################################################
LABLE3='\n\n### Cc@FS: '
LABLE2='\n## Cc@FS: '
LABLE1='# Cc@FS: '
BUILD_DIR=`pwd`
# 本文件名称
FILE_NAME=$(basename $0 .sh)
# 配置文件
CONF_FILE=$(basename $0 .sh).conf
# 判断对应文件是否存在,若存在则导入
[ -f $CONF_FILE ] && . $CONF_FILE

#####################################################
# 函数调用
#####################################################
. ./XMLPrinter.sh
. ./OidChecker.sh

#####################################################
# 总输入文件
#####################################################
CSV__FILE=./input/Input.csv
XML__INPT=./input/InputQueryTemplate.xml

##
 # 总输入文件
 #
SNMP_TEMP=./temp/TempSnmp.sh
CSV__TEMP=./temp/TempCsv.csv
XML__TEMP=./temp/TempXML.sh

##
 # 输出文件路径
 #
OUT__DIR=./output/
 

# 确认OID可监控
CheckOid;


# 制作XML文件
Object="CPU" 	&& OFlag="ss"		&& PrintXML;
Object="Memory" && OFlag="mem"		&& PrintXML;
Object="Disk" 	&& OFlag="dsk" 		&& PrintXML;
Object="DiskIO" && OFlag="diskIO"	&& PrintXML;