#!/bin/sh
BUILD_DIR=`pwd`

# 服务端配置文件修改
sed -i 's@allowed_hosts=.*$@allowed_hosts=127.0.0.1,192.168.1.98,192.168.1.127@g' /usr/local/nagios/etc/nrpe.cfg
sed -i 's@command[check_hda1]@#command[check_hda1]@g' /usr/local/nagios/etc/nrpe.cfg
sed -i '223a command[check_df]=/usr/local/nagios/libexec/check_disk -w 20 -c 10' /usr/local/nagios/etc/nrpe.cfg
sed -i '224a command[check_cpu_procs]=/usr/local/nagios/libexec/check_procs -w 50 -c 90 --metric=CPU' /usr/local/nagios/etc/nrpe.cfg
sed -i '225a command[check_swap]=/usr/local/nagios/libexec/check_swap -w 20% -c 5%' /usr/local/nagios/etc/nrpe.cfg
echo '/usr/local/nagios/bin/nrpe -c /usr/local/nagios/etc/nrpe.cfg -d' >> /etc/rc.local
/usr/local/nagios/bin/nrpe -c /usr/local/nagios/etc/nrpe.cfg -d #启动nrpe


#修改配置文件归类
sed -i 's@cfg_file=/usr/local/nagios/etc/objects/templates.cfg@#cfg_file=/usr/local/nagios/etc/objects/templates.cfg@g' /usr/local/nagios/etc/nagios.cfg
sed -i 's@cfg_file=/usr/local/nagios/etc/objects/localhost.cfg@#cfg_file=/usr/local/nagios/etc/objects/localhost.cfg@g' /usr/local/nagios/etc/nagios.cfg
sed -i '32a cfg_file=/usr/local/nagios/etc/objects/hosts.cfg' /usr/local/nagios/etc/nagios.cfg
sed -i '33a cfg_file=/usr/local/nagios/etc/objects/hostgroups.cfg' /usr/local/nagios/etc/nagios.cfg
sed -i '34a cfg_file=/usr/local/nagios/etc/objects/contactsgroups.cfg' /usr/local/nagios/etc/nagios.cfg
sed -i '35a cfg_file=/usr/local/nagios/etc/objects/services.cfg' /usr/local/nagios/etc/nagios.cfg


#命令检查时间间隔
sed -i 's@^command_check_interval.*$@command_check_interval=10s@g' /usr/local/nagios/etc/nagios.cfg


#指定用户admin可以通过浏览器操纵nagios服务的关闭、重启等各种操作
sed -i 's@authorized_for_system_information=.*$@authorized_for_system_information=admin@g' /usr/local/nagios/etc/cgi.cfg
sed -i 's@authorized_for_configuration_information=.*$@authorized_for_configuration_information=admin@g' /usr/local/nagios/etc/cgi.cfg
sed -i 's@authorized_for_system_commands=.*$@authorized_for_system_commands=admin@g' /usr/local/nagios/etc/cgi.cfg
sed -i 's@authorized_for_all_services=.*$@authorized_for_all_services=admin@g' /usr/local/nagios/etc/cgi.cfg
sed -i 's@authorized_for_all_hosts=.*$@authorized_for_all_hosts=admin@g' /usr/local/nagios/etc/cgi.cfg
sed -i 's@authorized_for_all_service_commands=.*$@authorized_for_all_service_commands=admin@g' /usr/local/nagios/etc/cgi.cfg
sed -i 's@authorized_for_all_host_commands=.*$@authorized_for_all_host_commands=admin@g' /usr/local/nagios/etc/cgi.cfg


#hosts.cfg
cat > /usr/local/nagios/etc/objects/hosts.cfg << EOF
define host {
host_name                 linux4
alias                     nagios-server
address                   192.168.1.98
contact_groups            sagroup
check_command             check-host-alive
max_check_attempts          10
notification_interval       5
notification_period         24x7
notification_options        d,u,r
}
define host {
host_name                 linux3
alias                     192.168.1.99
address                   192.168.1.99
contact_groups            sagroup
check_command             check-host-alive
max_check_attempts          10
notification_interval       5
notification_period         24x7
notification_options        d,u,r
}
EOF
chown nagios.nagios /usr/local/nagios/etc/objects/hosts.cfg
chmod 664 /usr/local/nagios/etc/objects/hosts.cfg


#hostgroups.cfg
cat > /usr/local/nagios/etc/objects/hostgroups.cfg << EOF
define hostgroup {
hostgroup_name  sa-servers
alias           sa servers
members         linux4,linux3
}
EOF
chown nagios.nagios /usr/local/nagios/etc/objects/hostgroups.cfg
chmod 664 /usr/local/nagios/etc/objects/hostgroups.cfg


#contacts.cfg
cp /usr/local/nagios/etc/objects/contacts.cfg /usr/local/nagios/etc/objects/contacts.cfg.bk
cat > /usr/local/nagios/etc/objects/contacts.cfg << EOF
define contact {
contact_name    admin
alias           system administrator
service_notification_period    24x7
host_notification_period       24x7
service_notification_options   w,u,c,r
host_notification_options       d,u,r
host_notification_commands     notify-host-by-email
service_notification_commands  notify-service-by-email
email                          admin@linuxeye.com
}
EOF


#services.cfg
cat > /usr/local/nagios/etc/objects/services.cfg << EOF
define service {
host_name               linux4,linux3
service_description     check-host-alive
check_command           check-host-alive
check_period            24x7
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
contact_groups          sagroup
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
}
define service {
host_name               linux4,linux3
service_description     check_http
check_command           check_http
check_period            24x7
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
contact_groups          sagroup
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
}
define service{
host_name               linux4,linux3
service_description     check_ssh
check_command           check_ssh
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
check_period            24x7
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
contact_groups          sagroup
}
define service{
host_name               linux4,linux3
service_description     check-disk
check_command           check_nrpe!check_df
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
check_period            24x7
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
contact_groups          sagroup
}
define service{
host_name               linux4,linux3
service_description     check_cpu_procs
check_command           check_nrpe!check_cpu_procs
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
check_period            24x7
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
contact_groups          sagroup
}
define service{
host_name               linux4,linux3
service_description     check_load
check_command           check_nrpe!check_load
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
check_period            24x7
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
contact_groups          sagroup
}
define service{
host_name               linux4,linux3
service_description     check_users
check_command           check_nrpe!check_users
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
check_period            24x7
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
contact_groups          sagroup
}
define service{
host_name               linux4,linux3
service_description     check_swap
check_command           check_nrpe!check_swap
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
check_period            24x7
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
contact_groups          sagroup
}
define service{
host_name               linux4,linux3
service_description     check_zombie_procs
check_command           check_nrpe!check_zombie_procs
max_check_attempts      4
normal_check_interval   3
retry_check_interval    2
check_period            24x7
notification_interval   10
notification_period     24x7
notification_options    w,u,c,r
contact_groups          sagroup
}
EOF
 
chown nagios.nagios /usr/local/nagios/etc/objects/services.cfg
chmod 664 /usr/local/nagios/etc/objects/services.cfg


#commands.cfg
echo 'define command{
command_name check_nrpe
command_line $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
}' >> /usr/local/nagios/etc/objects/commands.cfg


#contactsgroups.cfg
cat > /usr/local/nagios/etc/objects/contactsgroups.cfg << EOF
define contactgroup {
contactgroup_name    sagroup
alias                system administrator group
members              admin
}
EOF
chown nagios.nagios /usr/local/nagios/etc/objects/contactsgroups.cfg
chmod 664 /usr/local/nagios/etc/objects/contactsgroups.cfg
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg #检查配置是否有错误
service nagios start
