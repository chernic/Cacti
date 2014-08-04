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

############### Template Version 0.0.11 ##############
#####################################################
# Function of installing LAMP
#####################################################
# Version : 0.0.11
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-30
# v0.0.1(2014-7-30) : File Created


LOG_INFO "Environment enoD"
	LOG_INFO "YunInfo Environment enoD"
		yum repolist
		yum info httpd nginx mysql php 
	LOG_INFO "Stop Server enoD"
		service nginx stop
		service httpd stop
	LOG_INFO "Kill Process enoD"
		# netstat -lnp|grep 80
		ps -aux|grep http
		ps -aux|grep apache
	LOG_INFO "List Chkconfig enoD"
		chkconfig --list nginx && chkconfig --del nginx
		chkconfig --list httpd && chkconfig --del httpd
LOG_INFO "Environment Done.\n"


LOG_INFO "install apache & php enoD"
	BreakPoint;
	if [ "enabled" == "YUM_EARSE" ];then
		LOG_WARN "Erase Some Rpms"
		yum -y erase httpd httpd-devel php php-devel php-mysql php-common php-cli php-pdo  php-gd php-mbstring php-mcrtpt  php-xml
		# for packages in httpd httpd-devel php php-mysql php-common php-cli php-pdo  php-gd php-mbstring php-mcrtpt php-devel php-xml;
		# do yum -y erase $packages; done
	fi
	
	yum -y install httpd httpd-devel php php-devel php-mysql php-cli php-pdo php-common php-gd php-mbstring php-mcrtpt php-xml
	# for packages in httpd httpd-devel php php-devel php-mysql php-common php-gd php-mbstring php-mcrtpt  php-xml;
	# do 
		# yum -y install $packages; 
	# done
LOG_INFO "install apache & php Done\n"


LOG_INFO "Copy Files enoD"
	cp ./wwwroot/* /var/www/html/
	
	
    sed -i 's@^#ServerName.*@ServerName www.focustarmotor.com:80@g' /etc/httpd/conf/httpd.conf
LOG_INFO "Copy Files Done\n"


LOG_INFO "Restart Server enoD"
	LOG_INFO "Restart mysql:"
	/etc/init.d/mysql restart
	
	LOG_INFO "Restart apache :"
	/etc/init.d/httpd restart	
LOG_INFO "Restart Server Done\n"


LOG_INFO "Configure FireWall enoD"
	if [ "enabled" == "$FIRE_WALL" ];then
		if [ "" == "`awk '/tcp/&&/21/&&/ACCEPT/{ print $0 }' /etc/sysconfig/iptables`" ];then
			iptables -I RH-Firewall-1-INPUT -p tcp -m state -m tcp --dport 21 --state RELATED -j ACCEPT
		fi
		if [ "" == "`awk '/tcp/&&/22/&&/ACCEPT/{ print $0 }' /etc/sysconfig/iptables`" ];then
			iptables -I RH-Firewall-1-INPUT -p tcp -m state -m tcp --dport 22 --state RELATED -j ACCEPT
		fi
		if [ "" == "`awk '/tcp/&&/80/&&/ACCEPT/{ print $0 }' /etc/sysconfig/iptables`" ];then
			iptables -I RH-Firewall-1-INPUT -p tcp -m state -m tcp --dport 80 --state RELATED -j ACCEPT
		fi
		if [ "" == "`awk '/tcp/&&/8080/&&/ACCEPT/{ print $0 }' /etc/sysconfig/iptables`" ];then
			iptables -I RH-Firewall-1-INPUT -p tcp -m state -m tcp --dport 8080 --state RELATED -j ACCEPT
		fi
		service iptables save
		service iptables restart
	elif [ "disabled" == "$FIRE_WALL" ];then
		service iptables stop 
	else
		LOG_WARN "Switch of <Firewall> hasn't been set."
	fi
LOG_INFO "Configure FireWall Done\n"
