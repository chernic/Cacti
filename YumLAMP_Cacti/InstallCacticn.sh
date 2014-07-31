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
# Function of Install cacticn
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-31
# v0.0.1(2014-7-31) : File Created
# v0.1.0(2014-7-31) : Test SucessFull On VisualMachine

LOG_INFO "Initial Variables enoD"
	MYSQL_PATH="$(dirname `which mysql`)"
	mysqlrootpwd="focustar"

	PHP_PATH="$(dirname `which php`)"

	CACTI_LINK=/var/www/html/cacticn    # 链接后面不带 "/"
	CACTI_PATH=/var/www
	CACTI_VSIN="cacti-0.8.7e-cn-utf8" # 压缩文件名
	CACTI_DBTY="mysql"   # 数据库类型
	CACTI_DABS="cacticn" # 数据库名称
	CACTI_NAME="cacticn" # 访问用户名
	CACTI_PSWD="cacticn" # 用户的密码
LOG_INFO "Initial Variables Done\n"


LOG_INFO "Install NET-SNMP for Cacti enoD"
yum -y install net-snmp*
[ -e /etc/init.d/snmpd ] && service snmpd stop
if [ -e /etc/snmp/snmpd.conf ];
then
cat > /etc/snmp/snmpd.conf <<"EOF"
com2sec readonly  default         public
group MyROSystem v1        paranoid
group MyROSystem v2c       paranoid
group MyROSystem usm       paranoid
group MyROGroup v1         readonly
group MyROGroup v2c        readonly
group MyROGroup usm        readonly
group MyRWGroup v1         readwrite
group MyRWGroup v2c        readwrite
group MyRWGroup usm        readwrite
view all    included  .1                               80
view system included  .iso.org.dod.internet.mgmt.mib-2.system
access MyROSystem ""     any       noauth    exact  system none   none
access MyROGroup ""      any       noauth    exact  all    none   none
access MyRWGroup ""      any       noauth    exact  all    all    none
syslocation www.chernic.com (configure /etc/snmp/snmpd.local.conf)
syscontact iamchernic@gmail.com
smuxpeer .1.3.6.1.4.1.674.10892.1
EOF
fi
LOG_INFO "Install NET-SNMP for Cacti Done\n"


LOG_INFO "Install rrdtool for Cacti enoD"
	#tar -zxvf rrdtool.tar.gz
	#cd rrdtool-1.2.23
	#./configure --prefix=/usr/local/rrdtool --disable-python --disable-tcl
	# make
	# make install
	# Options : rrdtool-{devel,doc,perl,php,python,ruby,tcl}
	# 指定安装rrdtool-1.2.27版本，以免和1.2.30冲突
	yum install rrdtool-1.2.27* rrdtool-php-1.2.27* rrdtool-devel-1.2.27* rrdtool-doc-1.2.27
LOG_INFO "Install rrdtool for Cacti Done\n"


LOG_INFO "TarLink CactiFile to WWW_DIR enoD"
	if [ -d "$CACTI_PATH/$CACTI_VSIN"  ]; then
		LOG_WARN "PATH <$CACTI_PATH/$CACTI_VSIN> Existed, Delete it. "
		rm -rf "$CACTI_PATH/cacti-0.8.7e-cn-utf8"
	fi
	tar xzf $CACTI_VSIN.tar.gz
	mv $CACTI_VSIN "$CACTI_PATH/$CACTI_VSIN"

	
	
	if [ -L $CACTI_LINK ]; then
		LOG_WARN "Link <$CACTI_LINK> Existed, Delete it. "
		rm -vf $CACTI_LINK
	fi
	ln -sf "$CACTI_PATH/$CACTI_VSIN" "$CACTI_LINK"
LOG_INFO "TarLink CactiFile to WWW_DIR Done\n"


LOG_INFO "Add User enoD"
	# -r对应-m（删除/创建本地目录）
	userdel -r $CACTI_NAME
	useradd -m $CACTI_NAME
	#添加cacti用户，并添加进本用户组，以免cacticn组尚未删除无法创建用户
	useradd -m $CACTI_NAME -g $CACTI_NAME
LOG_INFO "Add User  Done\n"


LOG_INFO "Create DataBase Cacti of MySQL enoD"
	$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "drop database "$CACTI_DABS";"
	$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "create database "$CACTI_DABS";"
	$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on "$CACTI_DABS".* to root@localhost;"
	$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on "$CACTI_DABS".* to root@127.0.0.1;"
	$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on "$CACTI_DABS".* to "$CACTI_NAME"@localhost identified by '"$CACTI_PSWD"';"
	$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on "$CACTI_DABS".* to "$CACTI_NAME"@127.0.0.1 identified by '"$CACTI_PSWD"';"
	$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "flush privileges;"
LOG_INFO "Create DataBase Cacti of MySQL Done\n"


LOG_INFO "Import Cacti Data to MySQL enoD"
	# 当我们导入数据的时候可能会出错，
	# 有可能是因为我们安装的mysql是高版本的，
	# 并不支持TYPE=MyISAM,需要改成ENGINE=MyISAM这样就好了
	sed -i 's@TYPE=MyISAM@@g' $CACTI_LINK/cacti.sql
	$MYSQL_PATH/mysql -uroot -p$mysqlrootpwd $CACTI_DABS < $CACTI_LINK/cacti.sql
LOG_INFO "Import Cacti Data to MySQL Done\n"


LOG_INFO "Edited config.php/global.php in Cacti enoD"
	# 修改 $CACTI_LINK/include/config.php
	sed -i 's@^$database_type.*@$database_type = "mysql";@g' $CACTI_LINK/include/config.php
	sed -i 's@^$database_default.*@$database_default = "'$CACTI_DABS'";@g' $CACTI_LINK/include/config.php
	sed -i 's@^$database_hostname.*@$database_hostname = "127.0.0.1";@g' $CACTI_LINK/include/config.php
	sed -i 's@^$database_username.*@$database_username = "'$CACTI_NAME'";@g' $CACTI_LINK/include/config.php
	sed -i 's@^$database_password.*@$database_password = "'$CACTI_PSWD'";@g' $CACTI_LINK/include/config.php
	sed -i 's@^$database_port.*@$database_port = "3306";@g' $CACTI_LINK/include/config.php
	sed -i 's@^$database_ssl.*@$database_ssl = "false";@g' $CACTI_LINK/include/config.php
	sed -i 's@^//$url_path@$url_path@g' $CACTI_LINK/include/config.php

	# 修改 $CACTI_LINK/include/global.php
	sed -i 's@^$database_type.*@$database_type = "mysql";@g' $CACTI_LINK/include/global.php
	sed -i 's@^$database_default.*@$database_default = "'$CACTI_DABS'";@g' $CACTI_LINK/include/global.php
	sed -i 's@^$database_hostname.*@$database_hostname = "127.0.0.1";@g' $CACTI_LINK/include/global.php
	sed -i 's@^$database_username.*@$database_username = "'$CACTI_NAME'";@g' $CACTI_LINK/include/global.php
	sed -i 's@^$database_password.*@$database_password = "'$CACTI_PSWD'";@g' $CACTI_LINK/include/global.php
	sed -i 's@^$database_port.*@$database_port = "3306";@g' $CACTI_LINK/include/global.php
	sed -i 's@^$database_ssl.*@$database_ssl = "false";@g' $CACTI_LINK/include/global.php
	sed -i 's@^//$url_path@$url_path@g' $CACTI_LINK/include/global.php
LOG_INFO "Edited global.php in Cacti Done\n"


# # # For PHP 5.3
# # sed -i 's@=&@=@g' $CACTI_LINK/lib/adodb/adodb.inc.php


LOG_INFO "Chown Right Of log And rra enoD"
	# 赋予权限给rra/ log/
	chown -vR $CACTI_NAME:$CACTI_NAME $CACTI_LINK/{rra,log}
LOG_INFO "Chown Right Of log And rra Done\n"


LOG_INFO "Add Crond enoD"
	# 检索/stc/crontab, 若不存在 "本次新规则" 才添加
	if [ "" == "`grep "$CACTI_NAME $PHP_PATH/php $CACTI_LINK/poller.php > $CACTI_LINK/log/pooler-error.log" /etc/crontab`" ];then
		echo "*/5 * * * * $CACTI_NAME $PHP_PATH/php $CACTI_LINK/poller.php > $CACTI_LINK/log/pooler-error.log" >> /etc/crontab
	fi
LOG_INFO "Add Crond Done\n"


LOG_INFO "Restart Server enoD"
	service snmpd restart
	service crond restart
LOG_INFO "Restart Server Done\n"
LOG_INFO "Configure FireWall enoD"
	if [ "enabled" == "$FIRE_WALL" ];then
		# 检索/etc/sysconfig/iptables, 若不存在 "本次新规则"的特征 才添加
		if [ "" == "`awk '/udp/&&/161/&&/ACCEPT/{ print $0 }' /etc/sysconfig/iptables`" ];then
			iptables -I RH-Firewall-1-INPUT -p udp -m state -m udp --dport 161 --state RELATED -j ACCEPT
		fi
		service iptables save
		service iptables restart
	elif [ "disabled" == "$FIRE_WALL" ];then
		service iptables stop
	else
		LOG_WARN "Switch of <Firewall> hasn't been set."
	fi
LOG_INFO "Configure FireWall enoD\n"
