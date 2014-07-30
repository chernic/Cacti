#!/bin/sh
BUILD_DIR=`pwd`

tar xzf cacti-spine-0.8.8a.tar.gz
cd cacti-spine-0.8.8a
./configure --prefix=/usr/local/spine
make && make install
cp /usr/local/spine/etc/spine.conf.dist /usr/local/spine/etc/spine.conf
sed -i 's@DB_Pass.*$@DB_Pass         cactiuser@' /usr/local/spine/etc/spine.conf
cd ../

