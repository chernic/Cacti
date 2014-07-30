#!/bin/sh
cd /mnt/hgfs/LNMP-nagios-cacti/libexec/
echo 	"##########  check_apt"	> ./check.log;	/usr/local/nagios/libexec/check_apt	 >> ./check.log;
echo 	"##########  check_breeze"	>> ./check.log;	/usr/local/nagios/libexec/check_breeze	 >> ./check.log;
echo 	"##########  check_by_ssh"	>> ./check.log;	/usr/local/nagios/libexec/check_by_ssh	 >> ./check.log;
echo 	"##########  check_clamd"	>> ./check.log;	/usr/local/nagios/libexec/check_clamd	 >> ./check.log;
echo 	"##########  check_cluster"	>> ./check.log;	/usr/local/nagios/libexec/check_cluster	 >> ./check.log;
echo 	"##########  check_dhcp"	>> ./check.log;	/usr/local/nagios/libexec/check_dhcp	 >> ./check.log;
echo 	"##########  check_dig"	>> ./check.log;	/usr/local/nagios/libexec/check_dig	 >> ./check.log;
echo 	"##########  check_disk"	>> ./check.log;	/usr/local/nagios/libexec/check_disk	 >> ./check.log;
echo 	"##########  check_disk_smb"	>> ./check.log;	/usr/local/nagios/libexec/check_disk_smb	 >> ./check.log;
echo 	"##########  check_dns"	>> ./check.log;	/usr/local/nagios/libexec/check_dns	 >> ./check.log;
echo 	"##########  check_dummy"	>> ./check.log;	/usr/local/nagios/libexec/check_dummy	 >> ./check.log;
echo 	"##########  check_file_age"	>> ./check.log;	/usr/local/nagios/libexec/check_file_age	 >> ./check.log;
echo 	"##########  check_flexlm"	>> ./check.log;	/usr/local/nagios/libexec/check_flexlm	 >> ./check.log;
echo 	"##########  check_ftp"	>> ./check.log;	/usr/local/nagios/libexec/check_ftp	 >> ./check.log;
echo 	"##########  check_http"	>> ./check.log;	/usr/local/nagios/libexec/check_http	 >> ./check.log;
echo 	"##########  check_icmp"	>> ./check.log;	/usr/local/nagios/libexec/check_icmp	 >> ./check.log;
echo 	"##########  check_ide_smart"	>> ./check.log;	/usr/local/nagios/libexec/check_ide_smart	 >> ./check.log;
echo 	"##########  check_ifoperstatus"	>> ./check.log;	/usr/local/nagios/libexec/check_ifoperstatus	 >> ./check.log;
echo 	"##########  check_ifstatus"	>> ./check.log;	/usr/local/nagios/libexec/check_ifstatus	 >> ./check.log;
echo 	"##########  check_imap"	>> ./check.log;	/usr/local/nagios/libexec/check_imap	 >> ./check.log;
echo 	"##########  check_ircd"	>> ./check.log;	/usr/local/nagios/libexec/check_ircd	 >> ./check.log;
echo 	"##########  check_jabber"	>> ./check.log;	/usr/local/nagios/libexec/check_jabber	 >> ./check.log;
echo 	"##########  check_load"	>> ./check.log;	/usr/local/nagios/libexec/check_load	 >> ./check.log;
echo 	"##########  check_log"	>> ./check.log;	/usr/local/nagios/libexec/check_log	 >> ./check.log;
echo 	"##########  check_mailq"	>> ./check.log;	/usr/local/nagios/libexec/check_mailq	 >> ./check.log;
echo 	"##########  check_mrtg"	>> ./check.log;	/usr/local/nagios/libexec/check_mrtg	 >> ./check.log;
echo 	"##########  check_mrtgtraf"	>> ./check.log;	/usr/local/nagios/libexec/check_mrtgtraf	 >> ./check.log;
echo 	"##########  check_mysql"	>> ./check.log;	/usr/local/nagios/libexec/check_mysql	 >> ./check.log;
echo 	"##########  check_mysql_query"	>> ./check.log;	/usr/local/nagios/libexec/check_mysql_query	 >> ./check.log;
echo 	"##########  check_nagios"	>> ./check.log;	/usr/local/nagios/libexec/check_nagios	 >> ./check.log;
echo 	"##########  check_nntp"	>> ./check.log;	/usr/local/nagios/libexec/check_nntp	 >> ./check.log;
echo 	"##########  check_nntps"	>> ./check.log;	/usr/local/nagios/libexec/check_nntps	 >> ./check.log;
echo 	"##########  check_nrpe"	>> ./check.log;	/usr/local/nagios/libexec/check_nrpe	 >> ./check.log;
echo 	"##########  check_nt"	>> ./check.log;	/usr/local/nagios/libexec/check_nt	 >> ./check.log;
echo 	"##########  check_ntp"	>> ./check.log;	/usr/local/nagios/libexec/check_ntp	 >> ./check.log;
echo 	"##########  check_ntp_peer"	>> ./check.log;	/usr/local/nagios/libexec/check_ntp_peer	 >> ./check.log;
echo 	"##########  check_ntp_time"	>> ./check.log;	/usr/local/nagios/libexec/check_ntp_time	 >> ./check.log;
echo 	"##########  check_nwstat"	>> ./check.log;	/usr/local/nagios/libexec/check_nwstat	 >> ./check.log;
echo 	"##########  check_oracle"	>> ./check.log;	/usr/local/nagios/libexec/check_oracle	 >> ./check.log;
echo 	"##########  check_overcr"	>> ./check.log;	/usr/local/nagios/libexec/check_overcr	 >> ./check.log;
echo 	"##########  check_ping"	>> ./check.log;	/usr/local/nagios/libexec/check_ping	 >> ./check.log;
echo 	"##########  check_pop"	>> ./check.log;	/usr/local/nagios/libexec/check_pop	 >> ./check.log;
echo 	"##########  check_procs"	>> ./check.log;	/usr/local/nagios/libexec/check_procs	 >> ./check.log;
echo 	"##########  check_real"	>> ./check.log;	/usr/local/nagios/libexec/check_real	 >> ./check.log;
echo 	"##########  check_rpc"	>> ./check.log;	/usr/local/nagios/libexec/check_rpc	 >> ./check.log;
echo 	"##########  check_sensors"	>> ./check.log;	/usr/local/nagios/libexec/check_sensors	 >> ./check.log;
echo 	"##########  check_simap"	>> ./check.log;	/usr/local/nagios/libexec/check_simap	 >> ./check.log;
echo 	"##########  check_smtp"	>> ./check.log;	/usr/local/nagios/libexec/check_smtp	 >> ./check.log;
echo 	"##########  check_spop"	>> ./check.log;	/usr/local/nagios/libexec/check_spop	 >> ./check.log;
echo 	"##########  check_ssh"	>> ./check.log;	/usr/local/nagios/libexec/check_ssh	 >> ./check.log;
echo 	"##########  check_ssmtp"	>> ./check.log;	/usr/local/nagios/libexec/check_ssmtp	 >> ./check.log;
echo 	"##########  check_swap"	>> ./check.log;	/usr/local/nagios/libexec/check_swap	 >> ./check.log;
echo 	"##########  check_tcp"	>> ./check.log;	/usr/local/nagios/libexec/check_tcp	 >> ./check.log;
echo 	"##########  check_time"	>> ./check.log;	/usr/local/nagios/libexec/check_time	 >> ./check.log;
echo 	"##########  check_udp"	>> ./check.log;	/usr/local/nagios/libexec/check_udp	 >> ./check.log;
echo 	"##########  check_ups"	>> ./check.log;	/usr/local/nagios/libexec/check_ups	 >> ./check.log;
echo 	"##########  check_users"	>> ./check.log;	/usr/local/nagios/libexec/check_users	 >> ./check.log;
echo 	"##########  check_wave"	>> ./check.log;	/usr/local/nagios/libexec/check_wave	 >> ./check.log;
echo 	"##########  negate"	>> ./check.log;	/usr/local/nagios/libexec/negate	 >> ./check.log;
echo 	"##########  urlize"	>> ./check.log;	/usr/local/nagios/libexec/urlize	 >> ./check.log;
echo 	"##########  utils.pm"	>> ./check.log;	/usr/local/nagios/libexec/utils.pm	 >> ./check.log;
echo 	"##########  utils.sh"	>> ./check.log;	/usr/local/nagios/libexec/utils.sh	 >> ./check.log;







