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
        source $CONF_FILE
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
# v0.1.1(2014-8-04) : Test SucessFull On 1.203

LOG_INFO "Initial Variables enoD"
    # Default Path:
    # /usr/bin/mysql
    # /usr/bin/php
    # /usr/bin/snmpwalk
    # /usr/bin/snmpget
    # /usr/bin/snmpbulkwalk
    # /usr/bin/snmpgetnext
    # /usr/bin/rrdtool
    MYSQL_PATH="$(dirname `which mysql`)"             # httpd 运行路径( MySQL 部署时决定 )
    mysqlrootpwd="focustar"                           # MySQL 根用户密码( MySQL 部署时决定 )
    PHP_PATH="$(dirname `which php`)"                 # PHP 运行路径( PHP 部署时决定 )
    SNMPWALK_PATH="$(dirname `which snmpwalk`)"       # snmpwalk 运行路径( snmpwalk 部署时决定 )
    SNMPGET_PATH="$(dirname `which snmpget`)"         # snmpget 运行路径( snmpget 部署时决定 )
    SNMPBULK_PATH="$(dirname `which snmpbulkwalk`)"   # snmpbulkwalk 运行路径( snmpbulkwalk 部署时决定 )
    SNMPGETTEXT_PATH="$(dirname `which snmpgetnext`)" # snmpgetnext 运行路径( snmpgetnext 部署时决定 )
    RRDTOOL_PATH="$(dirname `which rrdtool`)"         # rrdtool 运行路径( rrdtool 部署时决定 )
    TRUETYPE_PATH=/usr/share/fonts/ukai.ttc           # RRDTool 默认字体路径
    
    CACTI_LINK=/var/www/html/cacticn  # httpd 站点主目录( httpd部署时决定, 末尾不带 "/" )
    CACTI_PATH=/var/www               # Cacti 主目录名称( 可更改, 末尾不带 "/" )
    CACTI_VSIN="cacti-0.8.7e-cn-utf8" # Cacti 压缩文件名( 暂时只支持该版本)
    CACTI_DBTY="mysql"                # Cacti 数据库类型( 暂时只支持MySQL )
    CACTI_DABS="cacticn"              # Cacti 数据库名称( 可更改, 未测试 )
    CACTI_NAME="cacticn"              # Cacti 访问用户名( 可更改, 未测试 )
    CACTI_PSWD="cacticn"              # Cacti 用户的密码( 可更改, 未测试 )
    CACTI_UFT8="utf8"                 # Cacti 数据库字符类型( uft8 <推荐> 或者 gd2312 或 Others)

LOG_INFO "Initial Variables Done\n"


LOG_INFO "Stop Services enoD"
	service crond stop  # 关闭计划会有影响
	service snmpd stop
	service httpd stop
	[ -e /etc/init.d/crond ] && service crond stop
	[ -e /etc/init.d/snmpd ] && service snmpd stop
	[ -e /etc/init.d/httpd ] && service httpd stop
LOG_INFO "Stop Services Done\n"


LOG_INFO "Install NET-SNMP for Cacti enoD"

yum -y install net-snmp*
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
syslocation www.focustar.net
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
    cd $LOCAL_PATH
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
    cd $LOCAL_PATH
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
    $MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "create database "$CACTI_DABS" default character set utf8;"
    $MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on "$CACTI_DABS".* to root@localhost;"
    $MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on "$CACTI_DABS".* to root@127.0.0.1;"
    $MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on "$CACTI_DABS".* to "$CACTI_NAME"@localhost identified by '"$CACTI_PSWD"';"
    $MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "grant all on "$CACTI_DABS".* to "$CACTI_NAME"@127.0.0.1 identified by '"$CACTI_PSWD"';"
    $MYSQL_PATH/mysql -uroot -p$mysqlrootpwd -e "flush privileges;"
LOG_INFO "Create DataBase Cacti of MySQL Done\n"


LOG_INFO "Import Cacti Data to MySQL enoD"
    # 当我们导入数据的时候可能会出错
    # 有可能是因为我们安装的mysql是高版本的
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


ChangePHP()
{
	FILE=$1     # "$PHP_DIR/global_settings.php"
	BEGIN=$2    # "path_rrdtool_default_font"
	ENDIN=$3    # "max_length"
	CONTENT=$4  # "/usr/share/fonts/ukai.ttc"
		# 定位 path_rrdtool_default_font 段到 max_length 段的字符串
		ss=$(grep -n $BEGIN $FILE | cut -d ':' -f 1)
		# 重复 max_length 段的格式
		sed -i $ss',/'$ENDIN'/ s/^.*'$ENDIN'.*$/&\n&/' $FILE
		# 修改 新增的 max_length 段
		sed -i $ss',/'$ENDIN'/ s:"'$ENDIN'.*$:"default" => "'$CONTENT'",:' $FILE
}
LOG_INFO "Edited config.php/global.php in Cacti enoD"
	sed -i 's@"default" => "Version 1",@"default" => "版本 2",@g' $CACTI_LINK/include/global_settings.php
	ChangePHP "$CACTI_LINK/include/global_settings.php"  "path_rrdtool_default_font"  "max_length"  "$TRUETYPE_PATH"
LOG_INFO "Edited global.php in Cacti Done\n"


LOG_INFO "Chown Right Of log And rra enoD"
    # 赋予权限给rra/ log/
    chown -vR $CACTI_NAME:$CACTI_NAME $CACTI_LINK/{rra,log}
LOG_INFO "Chown Right Of log And rra Done\n"
    
    
LOG_INFO "Install Character enoD"
    if [ ! -f $TRUETYPE_PATH ];then
        cd $LOCAL_PATH
            wget -Nc http://us.archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-ukai/ttf-arphic-ukai_0.2.20080216.1.orig.tar.gz
            #只解压出所需字库文件
            tar -zxf ttf-arphic-ukai_0.2.20080216.1.orig.tar.gz "${TRUETYPE_PATH##*/}"
            cp "${TRUETYPE_PATH##*/}" $TRUETYPE_PATH 
        cd $LOCAL_PATH
    else
        LOG_WARN "$TRUETYPE_PATH is Already Exited."
    fi
LOG_INFO "Install Character Done\n"


# # For PHP 5.3
# sed -i 's@=&@=@g' $CACTI_LINK/lib/adodb/adodb.inc.php


LOG_INFO "Add Crond enoD"
    # 检索/etc/crontab, 若不存在 "本次新规则" 才添加
    if [ "" == "`grep "$CACTI_NAME $PHP_PATH/php $CACTI_LINK/poller.php > $CACTI_LINK/log/pooler-error.log" /etc/crontab`" ];then
        echo "*/5 * * * * $CACTI_NAME $PHP_PATH/php $CACTI_LINK/poller.php > $CACTI_LINK/log/pooler-error.log" >> /etc/crontab
    fi
LOG_INFO "Add Crond Done\n"


LOG_INFO "Restart Server enoD"
	service httpd restart
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
        LOG_WARN "service iptables stop Now."
    else
        LOG_WARN "Switch of <Firewall> hasn't been set yet."
    fi
LOG_INFO "Configure FireWall enoD\n"
LOG_INFO "Auto Start enoD"
    if [ "enabled" == "$CHK_CONFIG" ];then
		chkconfig httpd on
		chkconfig snmpd on
		chkconfig crond on
	fi
LOG_INFO "Auto Start enoD"


# [ $? -eq 0 ] && echo -e "\n\tNow Cacti is ready to be used via: http://localhost/cacti The default login and password are admin." && echo -e "\tCacti will check if all the required tools are correctly installed.\n"

# echo "" > /usr/share/cacti/cacti_clients
