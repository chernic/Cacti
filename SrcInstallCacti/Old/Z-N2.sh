#!/bin/sh
BUILD_DIR=`pwd`

userdel nagios
groupdel nagcmd
# Nagios安装(服务端)
useradd -s /sbin/nologin nagios
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd www
tar xzf nagios-3.5.0.tar.gz
cd nagios
yum -y install gd-devel
./configure --prefix=/usr/local/nagios --with-command-group=nagcmd
make all
make install #用于安装主要的程序、CGI及HTML文件
make install-init #用于生成init启动脚本
make install-config #用于安装示例配置文件
make install-commandmode #用于设置相应的目录权限
chkconfig --add nagios
chkconfig nagios on
cd ../

# Nagios插件必须安装
tar xzf nagios-plugins-1.4.16.tar.gz
cd nagios-plugins-1.4.16
./configure --prefix=/usr/local/nagios --with-nagios-user=nagios --with-nagios-group=nagios
make && make install
cd ../

# Nagios的Linux客户端。
tar xzf nrpe-2.14.tar.gz
cd nrpe-2.14
./configure
make && make install
cp sample-config/nrpe.cfg /usr/local/nagios/etc/
chown nagios.nagios /usr/local/nagios/etc/nrpe.cfg
cd ../