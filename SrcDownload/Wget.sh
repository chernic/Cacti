#!/bin/bash
#####################################################
# Functions of Wget Source File
#####################################################
# Version : 0.0.2
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-22
# v0.0.2(2014-7-22) : Confs are to be add automaticly.
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
FUNC__DIR=`pwd`
. $FUNC__DIR/Download.sh

cd $FUNC__DIR
[ -d src ] && echo "Exited: directory of source(src)" || mkdir -v src 

cd $FUNC__DIR
[ -f WgetDBIDBD.conf ] && . WgetDBIDBD.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Download;

cd $FUNC__DIR
[ -f WgetNagios.conf ] && . WgetNagios.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Download;

cd $FUNC__DIR
[ -f WgetNDOUtils.conf ] && . WgetNDOUtils.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Download;

cd $FUNC__DIR
[ -f WgetNDOUtils.conf ] && . WgetPlugin.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Download;

cd $FUNC__DIR
[ -f WgetSNMP.conf ] && . WgetSNMP.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Download;

# cd $FUNC__DIR
# [ -f WgetDoc.conf ] && . WgetDoc.conf
# # 先判断该目录的属性
# [ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Download;

cd $FUNC__DIR
[ -f WgetCacti.conf ] && . WgetCacti.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Download;









cd $FUNC__DIR
[ -f WgetDBIDBD.conf ] && . WgetDBIDBD.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Check;

cd $FUNC__DIR
[ -f WgetNagios.conf ] && . WgetNagios.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Check;

cd $FUNC__DIR
[ -f WgetNDOUtils.conf ] && . WgetNDOUtils.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Check;

cd $FUNC__DIR
[ -f WgetPlugin.conf ] && . WgetPlugin.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Check;

cd $FUNC__DIR
[ -f WgetSNMP.conf ] && . WgetSNMP.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Check;

# cd $FUNC__DIR
# [ -f WgetDoc.conf ] && . WgetDoc.conf
# # 先判断该目录的属性
# [ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Check;

cd $FUNC__DIR
[ -f WgetCacti.conf ] && . WgetCacti.conf
# 先判断该目录的属性
[ "$WGET_LINK" != "" ] && cd $FUNC__DIR/src && Files_Check;

