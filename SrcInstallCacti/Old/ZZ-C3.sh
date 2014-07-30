#!/bin/sh
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
BUILD_DIR=`pwd`
MAIN_PATH="/home/wwwroot/default" 
MYSQL_PATH="/usr/local/mysql/bin"
mysqlrootpwd="focustar"

tar xzf cacti-0.8.8a.tar.gz
rm /home/wwwroot/default/cacti  -rf
mv ./cacti-0.8.8a /home/wwwroot/default/cacti 
cp /home/wwwroot/default/cacti/cacti.sql /home/wwwroot/default/cacti/cacti.sql.bak
cp /home/wwwroot/default/cacti/include/config.php /home/wwwroot/default/cacti/include/config.php.bak
cp /home/wwwroot/default/cacti/include/global.php /home/wwwroot/default/cacti/include/global.php.bak


#删除cacti用户
userdel -r cacti
#添加cacti用户
useradd -m cacti

# 当我们导入数据的时候可能会出错，
# 有可能是因为我们安装的mysql是高版本的，
# 并不支持TYPE=MyISAM,需要改成ENGINE=MyISAM这样就好了
/usr/local/mysql/bin/mysql -uroot -pfocustar -e "drop database cacti;"
/usr/local/mysql/bin/mysql -uroot -pfocustar -e "create database cacti;"

/usr/local/mysql/bin/mysql -uroot -pfocustar -e "grant all on cacti.* to root@localhost;"
/usr/local/mysql/bin/mysql -uroot -pfocustar -e "grant all on cacti.* to root@127.0.0.1;"
/usr/local/mysql/bin/mysql -uroot -pfocustar -e "grant all on cacti.* to cacti@localhost identified by 'cacti';"
/usr/local/mysql/bin/mysql -uroot -pfocustar -e "grant all on cacti.* to cacti@127.0.0.1 identified by 'cacti';"
/usr/local/mysql/bin/mysql -uroot -pfocustar -e "flush privileges;"

sed -i 's@TYPE=MyISAM@@g' /home/wwwroot/default/cacti/cacti.sql
/usr/local/mysql/bin/mysql -uroot -pfocustar cacti < /home/wwwroot/default/cacti/cacti.sql

# 修改 /home/wwwroot/default/cacti/include/config.php
sed -i 's@$database_type.*@$database_type = "mysql";@g' /home/wwwroot/default/cacti/include/config.php
sed -i 's@$database_default.*@$database_default = "cacti";@g' /home/wwwroot/default/cacti/include/config.php
sed -i 's@$database_hostname.*@$database_hostname = "127.0.0.1";@g' /home/wwwroot/default/cacti/include/config.php
sed -i 's@$database_username.*@$database_username = "cacti";@g' /home/wwwroot/default/cacti/include/config.php
sed -i 's@$database_password.*@$database_password = "cacti";@g' /home/wwwroot/default/cacti/include/config.php
sed -i 's@$database_port.*@$database_port = "3306";@g' /home/wwwroot/default/cacti/include/config.php
sed -i 's@$database_ssl.*@$database_ssl = "false";@g' /home/wwwroot/default/cacti/include/config.php
sed -i 's@//$url_path@$url_path@g' /home/wwwroot/default/cacti/include/config.php

# 修改 /home/wwwroot/default/cacti/include/global.php
# 使用 http://IP/cacti
sed -i 's@$database_type.*@$database_type = "mysql";@g' /home/wwwroot/default/cacti/include/global.php
sed -i 's@$database_default.*@$database_default = "cacti";@g' /home/wwwroot/default/cacti/include/global.php
sed -i 's@$database_hostname.*@$database_hostname = "127.0.0.1";@g' /home/wwwroot/default/cacti/include/global.php
sed -i 's@$database_username.*@$database_username = "cacti";@g' /home/wwwroot/default/cacti/include/global.php
sed -i 's@$database_password.*@$database_password = "cacti";@g' /home/wwwroot/default/cacti/include/global.php
sed -i 's@$database_port.*@$database_port = "3306";@g' /home/wwwroot/default/cacti/include/global.php
sed -i 's@$database_ssl.*@$database_ssl = "false";@g' /home/wwwroot/default/cacti/include/global.php
sed -i 's@//$url_path@$url_path@g' /home/wwwroot/default/cacti/include/global.php

# 赋予权限给rra/ log/
chown -R cacti /home/wwwroot/default/cacti/rra/
chown -R cacti /home/wwwroot/default/cacti/log/
chgrp -R cacti /home/wwwroot/default/cacti/

# cat /home/wwwroot/default/cacti/include/config.php
# cat /home/wwwroot/default/cacti/include/global.php

service crond restart