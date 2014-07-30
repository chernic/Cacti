#!/bin/bash
#####################################################
# Template
#####################################################
# Version : 0.0.7
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-22
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
############### Template Version 0.0.6 ##############

export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#BUILD_DIR=`pwd`

CACTI_LINK=/home/wwwroot/default/cacticn    # 链接后面不带 "/"
CACTI_PATH=$BUILD_DIR/cacti-0.8.7e-cn-utf8

MYSQL_PATH="/usr/local/mysql/bin"
mysqlrootpwd="focustar"
DATABASE="cacticn"

tar xzf cacti-0.8.7e-cn-utf8.tar.gz
if [ -L cacticn ]; then
	rm -vf $CACTI_LINK
fi
ln -sf $CACTI_PATH $CACTI_LINK
# rm $CACTI_LINK    -rf
# mv ./cacti-0.8.8a $CACTI_LINK 


userdel -r cacticn
#添加cacti用户
useradd -m cacticn


# 当我们导入数据的时候可能会出错，
# 有可能是因为我们安装的mysql是高版本的，
# 并不支持TYPE=MyISAM,需要改成ENGINE=MyISAM这样就好了
$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "drop database cacticn;"
$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "create database cacticn;"

$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on cacticn.* to root@localhost;"
$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on cacticn.* to root@127.0.0.1;"
$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on cacticn.* to cacticn@localhost identified by 'cacticn';"
$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on cacticn.* to cacticn@127.0.0.1 identified by 'cacticn';"
$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "flush privileges;"

sed -i 's@TYPE=MyISAM@@g' $CACTI_LINK/cacti.sql
$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd cacticn < $CACTI_LINK/cacti.sql

# 修改 $CACTI_LINK/include/config.php
sed -i 's@^$database_type.*@$database_type = "mysql";@g' $CACTI_LINK/include/config.php
sed -i 's@^$database_default.*@$database_default = "cacticn";@g' $CACTI_LINK/include/config.php
sed -i 's@^$database_hostname.*@$database_hostname = "127.0.0.1";@g' $CACTI_LINK/include/config.php
sed -i 's@^$database_username.*@$database_username = "cacticn";@g' $CACTI_LINK/include/config.php
sed -i 's@^$database_password.*@$database_password = "cacticn";@g' $CACTI_LINK/include/config.php
sed -i 's@^$database_port.*@$database_port = "3306";@g' $CACTI_LINK/include/config.php
sed -i 's@^$database_ssl.*@$database_ssl = "false";@g' $CACTI_LINK/include/config.php
sed -i 's@^//$url_path@$url_path@g' $CACTI_LINK/include/config.php

# 修改 $CACTI_LINK/include/global.php
# 使用 http://IP/cacti
sed -i 's@^$database_type.*@$database_type = "mysql";@g' $CACTI_LINK/include/global.php
sed -i 's@^$database_default.*@$database_default = "cacticn";@g' $CACTI_LINK/include/global.php
sed -i 's@^$database_hostname.*@$database_hostname = "127.0.0.1";@g' $CACTI_LINK/include/global.php
sed -i 's@^$database_username.*@$database_username = "cacticn";@g' $CACTI_LINK/include/global.php
sed -i 's@^$database_password.*@$database_password = "cacticn";@g' $CACTI_LINK/include/global.php
sed -i 's@^$database_port.*@$database_port = "3306";@g' $CACTI_LINK/include/global.php
sed -i 's@^$database_ssl.*@$database_ssl = "false";@g' $CACTI_LINK/include/global.php
sed -i 's@^//$url_path@$url_path@g' $CACTI_LINK/include/global.php

# # For PHP 5.3
# sed -i 's@=&@=@g' $CACTI_LINK/lib/adodb/adodb.inc.php

# 赋予权限给rra/ log/
chown -R cacti $CACTI_LINK/rra/
chown -R cacti $CACTI_LINK/log/
chgrp -R cacti $CACTI_LINK/

echo '*/5 * * * * /usr/local/php/bin/php $CACTI_LINK/poller.php > \
 /dev/null 2>$CACTI_LINK/log/pooler-error.log' >> /etc/crontab
service crond restart
