#!/bin/sh
#####################################################
# Version : 0.0.3
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
# 本文件名称
CSV=$(basename $0 .sh).csv
# 本文件输出日志文件名称
LOG=$(basename $0 .sh).log
# 临时tmp.sh
TMP=$(basename $0 .sh).tmp.sh

# 本地地址
IPLocal=localhost

# 以下用脚本生成脚本
# csv文件末位有换行,所以每行最后一个元素带有换行符
# 最后一列不参与shell脚本运行则可避免运行出错
echo  "#!/bin/sh" > $TMP
cat $CSV | awk -F"," '{print "\
echo -ne \" ***  "$1" : \";\n\
snmpwalk -v2c -c public localhost  "$2\
}' >> $TMP

# 制造语法错误
# echo  "if else" >> $TMP
# 执行前先检查语法错误
echo -e $LABLE3"List [$OID] : " 2>&1  | tee  $LOG
sh -n $TMP && sh  $TMP  -s  2>&1  | tee -a $LOG   # && rm $TMP