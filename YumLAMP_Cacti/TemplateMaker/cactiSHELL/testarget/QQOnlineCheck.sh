#!/bin/bash
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-11
export PS4='+[$LINENO]'
set -x && set +x
#####################################################

ORI_DIR="/mnt/hgfs/Share4Con/MyScript"
TAR_DIR="/home/wwwroot/default/cacti/scripts"

. ./QQOnlineCheck.conf

Create()
{
set -x
	cp $0  $TAR_DIR
	ls $TAR_DIR/"$(basename $0)"
set +x
}

Running()
{
	echo "QQ_Now:`curl im.qq.com/online.shtml | grep qqdata | cut -d":" -f 3 | cut -d">" -f 2 | cut -d"<" -f 1`"

}

if [ "$1" == "c" ]; then
	echo "Now , First time to Copy...."
	Create
else
	Running
fi




