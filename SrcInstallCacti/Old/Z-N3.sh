#!/bin/sh
BUILD_DIR=`pwd`


#Nginx配置（服务端）
ln -s /usr/local/nagios/share /home/wwwroot/default/nagios
#对比
ls -l -i /usr/local/nagios/share /home/wwwroot/default/nagios

#find / -name nginx.conf
# nginx.conf配置文件
#cp  /usr/local/nginx/conf/nginx.conf ./nginx.conf.bak
cp ./nginx.conf.bak /usr/local/nginx/conf/nginx.conf

echo "************************************"
echo "cat /usr/local/nginx/conf/nginx.conf"
cat /usr/local/nginx/conf/nginx.conf

# 创建web验证用户
/usr/local/apache/bin/htpasswd -nb admin 123456 > /usr/local/nagios/etc/htpasswd.users
chown nagcmd.nagios /usr/local/nagios/etc/htpasswd.users
