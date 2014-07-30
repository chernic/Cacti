#!/bin/sh
BUILD_DIR=`pwd`

### Nginx对Perl的CGI支持
#安装FCGI模块
tar xzf FCGI-0.74.tar.gz
cd FCGI-0.74
perl Makefile.PL
make && make install
cd ../

# 安装FCGI-ProcManager模块
tar xzf FCGI-ProcManager-0.24.tar.gz
cd FCGI-ProcManager-0.24
perl Makefile.PL
make && make install
cd ../


# Perl脚本
cp perl-fcgi.pl /usr/local/nginx
chmod +x /usr/local/nginx/perl-fcgi.pl
/usr/local/nginx/perl-fcgi.pl > /usr/local/nginx/logs/perl-fcgi.log 2>&1 & #启动Perl
chmod 777 /usr/local/nginx/logs/perl-fcgi.sock #Nginx Log中提示Permision Denied方法
cd ../




