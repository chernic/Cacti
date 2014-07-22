#!/bin/sh
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-6-12
#####################################################
# This Shell Script has been Test on RHEL-5
# This Shell Script has benn Test in Static/DHCP Mode
#####################################################
# 获取本文件所在路径
FUNC__DIR=`pwd`
# 获取安装路径
BUILD_DIR=$(dirname $(pwd))
# [获取本文件路径中 的 文件名称] 即本文件名的配置文件
CONF_FILE=$(basename $0 .sh).conf
# 判断对应文件是否存在,若存在则导入
[ -f $CONF_FILE ] && . $CONF_FILE
. $FUNC__DIR/Download.sh


# 下载Ntop源码(现已升级到Ntopng)(Wget 有问题)
wget -N -c http://sourceforge.net/projects/ntop/files/ntop/ntop-4.0.1/ntop-4.0.1.tar.gz/download
wget -N -c http://sourceforge.net/projects/nagios/files/ndoutils-1.x/ndoutils-1.4b9/ndoutils-1.4b9.tar.gz/download