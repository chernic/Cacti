#!/bin/bash
#####################################################
# Version : 0.0.2
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
##
 # V0.01 2014-7-11 File Created.
 # V0.02 2014-7-11 DeBug Added.
## 
# Debug Tool
export PS4='+[$LINENO]'
set -x && set +x
#####################################################
# Default Configuration
ORI_DIR="/mnt/hgfs/Share4Con/MyScript"
TAR_DIR="/home/wwwroot/default/cacti/scripts"
#####################################################
# User Configuration(No Blank before .conf)
[ -f "$(basename $0 .sh).conf" ] && . ./"$(basename $0 .sh).conf"
#####################################################

Create()
{
set -x
	cp $0  $TAR_DIR
	ls $TAR_DIR/"$(basename $0)"
set +x
}

#1 <div id="qqdata" class="hide">当前在线:
#2 <span class="red" style="margin-right: 
###3 20px">211405300</span>最高在线:
#4 <span class="red">212922217

#1 20px">
###2 211405300</span>最高在线:

###1 211405300<
#2 /span>最高在线:
Running()
{
	echo "QQ_Now:`curl im.qq.com/online.shtml | grep qqdata | cut -d":" -f 3 | cut -d">" -f 2 | cut -d"<" -f 1`"

}

if [ "$1" == "c" ]; then
	echo "Now's First time, So Copy As You Want."
	Create
else
	Running
fi

