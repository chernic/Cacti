#!/bin/sh
BUILD_DIR=`pwd`

cp /mnt/hgfs/LNMP-nagios-cacti/conf/nginx3.sh  /usr/local/nginx/conf/nginx.conf
# cp /mnt/hgfs/LNMP-nagios-cacti/conf/nginx1.conf  /usr/local/nginx/conf/nginx.conf
tail /usr/local/nginx/conf/nginx.conf

yum -y install net-snmp-*
# vi /etc/snmp/snmpd.conf #确保下面3个地方如下
cp ./snmpd.conf /etc/snmp/snmpd.conf
echo "cat /etc/snmp/snmpd.conf"
cat /etc/snmp/snmpd.conf

# com2sec notConfigUser  127.0.0.1 public
# access  notConfigGroup ""      any :      noauth    exact  all none none
# view all    included  .1                               80
 
chkconfig snmpd on
service snmpd start
