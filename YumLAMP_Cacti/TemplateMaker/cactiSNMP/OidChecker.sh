#!/bin/sh
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-9
# while :; do :; done
# Tool Needed : xmlstarlet
#####################################################
# 以下用脚本生成脚本
# 用于检测被监控服务器的OID是否有效
#####################################################
LOG_FILE="$OUT__DIR/$(basename $0 .sh).log"

CheckOid()
{
	echo " " > $SNMP_TEMP
	echo  "#!/bin/sh" > $SNMP_TEMP
	
	# Note -F和','之间不能有空格
	cat $CSV__FILE | awk -F"," '{print " \
	echo \" snmpwalk "$1".\";\n \
	snmpwalk -v2c -c public localhost  "$6}' >> $SNMP_TEMP
	sh $SNMP_TEMP 2>&1  | tee -a $LOG_FILE
}