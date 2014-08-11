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
    LOCAL_IP=`ifconfig eth0 | grep 'inet addr' | cut -d ":" -f 2 | cut -d " " -f 1`
}

ReadConf()
{
    # 全局配置实际路径
		LOCAL_PATH=$(dirname "$0");
    # 获取脚本同名配置
		CONF_FILE="$1"
    # 加载日志函数
    if [ -f $LOCAL_PATH/$CONF_FILE ];then
        echo -e "$CONF_FILE is \033[32mFound.\033[0m"
        source $LOCAL_PATH/$CONF_FILE
    else
        echo -e "$CONF_FILE is \033[31mNot Found.\033[0m"
    fi
}

NotRootOut;
GetIPAddress;
ReadConf "Global.conf";
ReadConf "$(basename $0 .sh).conf";
ReadConf "log.sh";
LOG_INFO "Load Configures Done.\n"

SERVER_IP="192.168.0.96"
FTP_USER="Chernic"
FTP_PSWD="Ftp_Chernic!"
CACTI_CLIENT="cacti_clients"		# DO NOT CHANGE IT

############### Template Version 0.1.2 ##############
#####################################################
# Function of Install cacticn Client
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-08-08
# v0.0.1(2014-08-08) : File Created
cacti_ftp_get()
{
FILE_NAME=$1
ncftp -u$FTP_USER -p$FTP_PSWD $SERVER_IP<<EOF
bin
passive
set confirm-close no
lcd /etc/snmp
cd $CACTI_LINK
get $FILE_NAME
passive
quit
EOF
}


cacti_ftp_put()
{
FILE_NAME=$1
ncftp -u$FTP_USER -p$FTP_PSWD $SERVER_IP<<EOF
bin
passive
set confirm-close no
lcd /etc/snmp
cd $CACTI_LINK
put $FILE_NAME
passive
quit
EOF
}


Cacti_config_modify()
{
    cd /etc/snmp
    cacti_ftp_get "$CACTI_CLIENT"
    if [ -e $CACTI_CLIENT ];
    then
	# Chernic's Comment: Here Can Add Time Flag.
	echo "HOSTNAME:$LOCAL_IP:$HOSTNAME" >> $CACTI_CLIENT
	cacti_ftp_put "$CACTI_CLIENT"
	rm $CACTI_CLIENT
    fi
    echo -e "Modified config files..... "
}

LOG_INFO "Stop Services enoD"
	service snmpd stop
	[ -e /etc/init.d/snmpd ] && service snmpd stop
LOG_INFO "Stop Services Done\n"


LOG_INFO "Install NET-SNMP for Cacti enoD"
rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-4.noarch.rpm
yum -y ftp perl
yum -y install net-snmp*
yum list *NCFTP*
yum -y install ncftp 
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


