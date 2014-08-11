#!/bin/sh
#####################################################
# Version : 0.0.2
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-2
#####################################################
# This Shell Script has been Test on RHEL-5
# This Shell Script has benn Test in Static/DHCP Mode
#####################################################
# Chernic's Report Head
LABLE3='\n\n### Cc@FS: '
LABLE2='\n## Cc@FS: '
LABLE1='# Cc@FS: '
#####################################################
BUILD_DIR=`pwd`
# 文件名的配置文件
CONF_FILE=$(basename $0 .sh).conf
# 判断对应文件是否存在,若存在则导入
[ -f $CONF_FILE ] && . $CONF_FILE
# 本文件名称
OID=$(basename $0 .sh)
# 本文件输出日志文件名称
LOG=$(basename $0 .sh).log


OID_List=(
	$OID
)

echo -e $LABLE3"List [$OID] : " 2>&1  | tee  $LOG

for name in ${OID_List[@]}
do
	echo -e $LABLE2"List [$name] : " 2>&1  | tee -a $LOG
	echo -e $LABLE1"snmpwalk -v2c -c public localhost $name" 2>&1  | tee -a $LOG
	snmpwalk -v2c -c public localhost $name  2>&1  | tee -a $LOG
done

