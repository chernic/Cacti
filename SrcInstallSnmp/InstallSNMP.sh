#!/bin/bash
#####################################################
# Fuction of Install NET-SNMP
#####################################################
# Version : 0.0.5
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

ReadConf()
{
	# [获取本文件路径中 的 文件名称] 即本文件名的配置文件
	CONF_FILE=$(basename $0 .sh).conf
	# 判断对应文件是否存在,若存在则导入
	[ -f $CONF_FILE ] && . $CONF_FILE
}
############### Template Version 0.0.5 ##############

cd .
FUC_DIR=`pwd`
cd ..
PRO_DIR=`pwd`
cd $FUC_DIR
OSREQUIREMENT=$1


# net-snmp-5.3.2.2-22.el5_10.1
# net-snmp-libs-5.3.2.2-22.el5_10.1
# net-snmp-utils-5.3.2.2-22.el5_10.1
# net-snmp-devel-5.3.2.2-22.el5_10.1
# net-snmp-perl-5.3.2.2-22.el5_10.1

# \cp /mnt/hgfs/GitHub/Repository/Cacti/* /root/SNMP/

DIR_SNMP="/usr/local/net-snmp-5.5.2.1"
YumInstallNETSNMP()
{
	case ${OSREQUIREMENT} in
		 src)
			echo "Install SNMP Use src."
			cd $PRO_DIR/SrcDownload/src
			tar zxvf net-snmp-5.5.2.1.tar.gz
			cd net-snmp-5.5.2.1
			./configure --prefix=$DIR_SNMP \
			--enable-mfd-rewrites \
			--with-default-snmp-version="2" \
			--with-sys-contact="Chernic,Email:iamchernic@gmail.com" \
			--with-sys-location="China" \
			--with-logfile="/var/log/snmpd.log" \
			--with-persistent-directory="/var/net-snmp"
			make && make install
			cp EXAMPLE.conf $DIR_SNMP/share/snmp/snmpd.conf

# if [ -e /etc/snmp/snmpd.conf ]; 
# then
# cat > /etc/snmp/snmpd.conf <<"EOF"
# com2sec readonly  default         public
# group MyROSystem v1        paranoid
# group MyROSystem v2c       paranoid
# group MyROSystem usm       paranoid
# group MyROGroup v1         readonly
# group MyROGroup v2c        readonly
# group MyROGroup usm        readonly
# group MyRWGroup v1         readwrite
# group MyRWGroup v2c        readwrite
# group MyRWGroup usm        readwrite
# view all    included  .1                               80
# view system included  .iso.org.dod.internet.mgmt.mib-2.system
# access MyROSystem ""     any       noauth    exact  system none   none
# access MyROGroup ""      any       noauth    exact  all    none   none
# access MyRWGroup ""      any       noauth    exact  all    all    none
# syslocation Unknown (configure /etc/snmp/snmpd.local.conf)
# syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
# smuxpeer .1.3.6.1.4.1.674.10892.1
# EOF
# fi

			# /usr/local/net-snmp/sbin/snmpd -c /usr/local/net-snmp/share/snmp/snmpd.conf &
			# PATH=/usr/local/net-snmp/bin:/usr/local/net-snmp/sbin:$PATH
				;;
		 rpm) 
			echo "Install SNMP Use rpm."
			cd $PRO_DIR/RpmDownlaod/rpm
				;;
		 yum)
			echo "Install SNMP Use yum."
			yum -y install net-snmpd*
				;;
		 *)
			echo "Input Install Method."
			exit 1
				;;
	esac            
}
YumInstallNETSNMP;