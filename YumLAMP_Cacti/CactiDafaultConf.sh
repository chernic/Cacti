#!/bin/sh
export PS4='+[$LINENO]'

BreakPoint()
{
    while [ "y" != "$AUTO_FLAG_yn" ]
    do
        read -p "\033[33mDo you Make Sure to Continue? [y/n/q] \033[0m" AUTO_FLAG_yn;
        [ "$AUTO_FLAG_yn" == "q" ] && exit 0;
    done
    AUTO_FLAG_yn="n"
}

NotRootOut()
{
    [ "0" != "$(id -u)" ] && echo "Error: You must be root to run this script" && exit 1 
}

GetIPAddress()
{
    IPAddress=`ifconfig eth0 | grep 'inet addr' | cut -d ":" -f 2 | cut -d " " -f 1`
}

ReadConf()
{
    # 全局配置实际路径
        LOCAL_PATH=$(dirname "$0");
    # 获取脚本同名配置
        CONF_FILE="$1"
    # 加载日志函数
    if [ -f $LOCAL_PATH/$CONF_FILE ];then
        echo -e "$CONF_FILE is \033[32mFound.\033[0m"
        source $LOCAL_PATH/$CONF_FILE
    else
        echo -e "$CONF_FILE is \033[31mNot Found.\033[0m"
    fi
}

NotRootOut;
ReadConf "Global.conf";
ReadConf "$(basename $0 .sh).conf";
ReadConf "log.sh";
LOG_INFO "Load Configures Done.\n"

############### Template Version 0.1.2 ##############
#####################################################
# Function to Configure cacticn
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-08-05
# v0.0.1(2014-08-05) : File Created
# v0.1.0(2014-08-06) : File Test OK With Default Configuration For cacti-0.8.7e-cn-utf8.tar.gz

ChangePHP2_5()
{
    FILE=$1       # "$PHP_DIR/global_settings.php"
    BEGIN=$2      # "path_rrdtool_default_font"
    NEWADD=$3     # "default"
    CONTENT=$4    # "/usr/share/fonts/ukai.ttc"
    [ -z $5 ] && ENDFLAG='),' || ENDFLAG=$5             # This can be ), Or ); at the end.
    [ -z $6 ] && WHERESTART='<?php' || WHERESTART=$6    # What $BEGIN Should Start Searching
    [ -z $7 ] && WHEREEND='?>' || WHEREEND=$7           # What $BEGIN Should Stop  Searching
    # 定位 WHERESTART 段起 WHEREEND 段结束的 $BEGIN => array( 段
    ss=`sed -n '/'$WHERESTART'/,/'$WHEREEND'/{
    /\"'$BEGIN'\" => array(/{
    =
    }
    }' $FILE `
    # 判断 "default" 段是否存在(假如重复会出错)
    ct="`sed -n $ss',/'$ENDFLAG'/  s:"'$NEWADD'".*$:&:p' $FILE`"
    if [ -z "$ct" ]; then
        echo "\"$BEGIN\" <\"$NEWADD\"> Not Exited. Insert it."
        # 重复 \"method\" 段的格式
        sed -i $ss',/'$ENDFLAG'/ s/^.*\"method\".*$/&,\n&/' $FILE
        # 基于 method 段新增 $NEWADD 段
        sed -i $ss',/\"method\"/ s:\"method\".*$:\"'$NEWADD'\" => \"'$CONTENT'\",:' $FILE
    else
        echo "\"$BEGIN\" <\"$NEWADD\"> Exited. Change it."
        # 直接修改原有 \"'$NEWADD'\" 段
        sed -i $ss',/'$ENDFLAG'/ s:\"'$NEWADD'\".*$:\"'$NEWADD'\" => \"'$CONTENT'\",:' $FILE
    fi
}

PhpConfGeneral()
{
    CG_FILE="$CACTI_LINK/include/global_settings.php"
    ChangePHP2_5 $CG_FILE "log_destination"             "default" "1"               # 日志文件目的地
    ChangePHP2_5 $CG_FILE "log_snmp"                    "default" ""                # Web SNMP信息
    ChangePHP2_5 $CG_FILE "log_graph"                   "default" ""                # Web RRD图像语法
    ChangePHP2_5 $CG_FILE "log_export"                  "default" ""                # 图像导出信息
    ChangePHP2_5 $CG_FILE "log_verbosity"               "default" "1"               # 轮询器日志级别(低 - 统计和错误信息)
    ChangePHP2_5 $CG_FILE "log_pstats"                  "default" ""                # 轮询器统计信息
    ChangePHP2_5 $CG_FILE "log_pwarn"                   "default" ""                # 轮询器警告信息
    ChangePHP2_5 $CG_FILE "log_perror"                  "default" "on"              # 轮询器错误信息
    
    ChangePHP2_5 $CG_FILE "snmp_version"                "default" "2"               # NET-SNMP 5.x(Change When Install)
    ChangePHP2_5 $CG_FILE "rrdtool_version"             "default" "2"               # rrd-1.2.x(Change When Install)
    
    ChangePHP2_5 $CG_FILE "snmp_ver"                    "default" "2"               # SNMP版本
    ChangePHP2_5 $CG_FILE "snmp_community"              "default" "public"          # SNMP连接字串
    ChangePHP2_5 $CG_FILE "snmp_timeout"                "default" "500"             # SNMP超时
    ChangePHP2_5 $CG_FILE "snmp_port"                   "default" "161"             # SNMP端口    
    
    ChangePHP2_5 $CG_FILE "snmp_username"               "default" ""                # SNMP(v3)用户名
    ChangePHP2_5 $CG_FILE "snmp_password"               "default" ""                # SNMP(v3)密码
    ChangePHP2_5 $CG_FILE "snmp_auth_protocol"          "default" "MD5"             # SNMP(v3)认证协议
    ChangePHP2_5 $CG_FILE "snmp_priv_passphrase"        "default" ""                # SNMP(v3)加密短语
    ChangePHP2_5 $CG_FILE "snmp_priv_protocol"          "default" "DES"             # SNMP(v3)加密协议
    ChangePHP2_5 $CG_FILE "snmp_retries"                "default" "3"               # SNMP重试次数
    
    ChangePHP2_5 $CG_FILE "reindex_method"              "default" "1"               # 数据查询重新索引方式(运行时间回退)
    ChangePHP2_5 $CG_FILE "deletion_verification"       "default" "off"             # 删除验证
}

PhpConfPath()
{
    CP_FILE="$CACTI_LINK/include/global_settings.php"
    ChangePHP2_5 $CP_FILE "path_snmpwalk"               "default" ""                # snmpwalk路径(Change When Install)
    ChangePHP2_5 $CP_FILE "path_snmpget"                "default" ""                # snmpget路径(Change When Install)
    ChangePHP2_5 $CP_FILE "path_snmpbulkwalk"           "default" ""                # snmpbulkwalk路径(Change When Install)
    ChangePHP2_5 $CP_FILE "path_snmpgetnext"            "default" ""                # snmpgetnext路径(Change When Install)
    ChangePHP2_5 $CP_FILE "path_rrdtool"                "default" ""                # RRDTool路径(Change When Install)
    ChangePHP2_5 $CP_FILE "path_rrdtool_default_font"   "default" "$TRUETYPE_PATH"  # RRDTool默认字体路径(Change When Install)
    ChangePHP2_5 $CP_FILE "path_php_binary"             "default" ""                # PHP路径(Change When Install)
    
    ChangePHP2_5 $CP_FILE "path_cactilog"               "default" ""                # Cacti日志文件路径(Change When Install)
    
    ChangePHP2_5 $CP_FILE "path_spine"                  "default" ""                # Spine轮询器路径
    
    ChangePHP2_5 $CP_FILE "extended_paths"              "default" ""                # RRA路径结构
}

PhpConfExport()
{
    CE_FILE="$CACTI_LINK/include/global_settings.php"
    ChangePHP2_5 $CE_FILE "export_type"                 "default" "disabled"        # 导出方式
    ChangePHP2_5 $CE_FILE "export_presentation"         "default" "classical"       # 图像方式

    ChangePHP2_5 $CE_FILE "export_tree_isolation"       "default" "off"             # 单树表示
    ChangePHP2_5 $CE_FILE "export_user_id"              "default" "1"               # admin 
    ChangePHP2_5 $CE_FILE "export_tree_expand_hosts"    "default" "off"             # 否

    ChangePHP2_5 $CE_FILE "export_default_height"       "default" "100"             # 缩略图高度
    ChangePHP2_5 $CE_FILE "export_default_width"        "default" "300"             # 缩略图宽度
    ChangePHP2_5 $CE_FILE "export_num_columns"          "default" "2"               # 缩略图列数

    ChangePHP2_5 $CE_FILE "path_html_export"            "default" ""                # 导出目录(本地和ftp)
    ChangePHP2_5 $CE_FILE "export_temporary_directory"  "default" ""                # 本地临时目录(仅ftp)

    ChangePHP2_5 $CE_FILE "export_timing"               "default" "disabled"        # 定时导出
    ChangePHP2_5 $CE_FILE "path_html_export_skip"       "default" ""                # 每x次导出
    ChangePHP2_5 $CE_FILE "export_hourly"               "default" ""                # 每小时的指定分钟
    ChangePHP2_5 $CE_FILE "export_daily"                "default" ""                # 每天的指定时间

    ChangePHP2_5 $CE_FILE "export_ftp_sanitize"         "default" ""                # 清洁远程目录
    ChangePHP2_5 $CE_FILE "export_ftp_host"             "default" ""                # FTP设备
    ChangePHP2_5 $CE_FILE "export_ftp_port"             "default" ""                # FTP端口
    ChangePHP2_5 $CE_FILE "export_ftp_passive"          "default" ""                # 使用被动方式
    ChangePHP2_5 $CE_FILE "export_ftp_user"             "default" ""                # FTP用户
    ChangePHP2_5 $CE_FILE "export_ftp_password"         "default" ""                # FTP密码
}

PhpConfVisual()
{
    CV_FILE="$CACTI_LINK/include/global_settings.php"
    ChangePHP2_5 $CV_FILE "num_rows_graph"              "default" "30"              # 每页行数
    ChangePHP2_5 $CV_FILE "max_title_graph"             "default" "80"              # 图像最大标题长度

    ChangePHP2_5 $CV_FILE "max_data_query_field_length" "default" "15"              # 数据查询区域最大长度

    ChangePHP2_5 $CV_FILE "default_graphs_new_dropdown" "default" "-2"              # 默认下拉选择器
    ChangePHP2_5 $CV_FILE "num_rows_data_query"         "default" "30"              # 数据查询图像行数

    ChangePHP2_5 $CV_FILE "num_rows_data_source"        "default" "30"              # 每页行数
    ChangePHP2_5 $CV_FILE "max_title_data_source"       "default" "45"              # 数据源最大标题长度

    ChangePHP2_5 $CV_FILE "num_rows_device"             "default" "30"              # 每页行数

    ChangePHP2_5 $CV_FILE "num_rows_log"                "default" "500"             # 默认日志文件取尾行数
    ChangePHP2_5 $CV_FILE "log_refresh_interval"        "default" "60"              # 刷新日志文件

    ChangePHP2_5 $CV_FILE "title_size"  "default" "12"  "" "" "settings_graphs"     # 标题字体大小
    ChangePHP2_5 $CV_FILE "title_font"  "default" ""    "" "" "settings_graphs"     # 标题字体文件
    ChangePHP2_5 $CV_FILE "legend_size" "default" "10"  "" "" "settings_graphs"     # 图例字体大小
    ChangePHP2_5 $CV_FILE "legend_font" "default" ""    "" "" "settings_graphs"     # 图例字体文件
    ChangePHP2_5 $CV_FILE "axis_size"   "default" "8"   "" "" "settings_graphs"     # 坐标轴字体大小
    ChangePHP2_5 $CV_FILE "axis_font"   "default" ""    "" "" "settings_graphs"     # 坐标轴字体文件
    ChangePHP2_5 $CV_FILE "unit_size"   "default" "8"   "" "" "settings_graphs"     # 单位符号字体大小
    ChangePHP2_5 $CV_FILE "unit_font"   "default" ""    "" "" "settings_graphs"     # 单位符号字体文件
}

PhpConfPoller()
{
    CP_FILE="$CACTI_LINK/include/global_settings.php"
    # 常规
    ChangePHP2_5 $CP_FILE "poller_enabled"              "default" "on"              # 启用
    ChangePHP2_5 $CP_FILE "poller_type"                 "default" "1"               # 轮询器类型:cmd.php
    ChangePHP2_5 $CP_FILE "poller_interval"             "default" "300"             # 轮询间隔
    ChangePHP2_5 $CP_FILE "cron_interval"               "default" "300"             # 使用cron的时间间隔
    ChangePHP2_5 $CP_FILE "concurrent_processes"        "default" "1"               # 最大并发轮询器进程
    ChangePHP2_5 $CP_FILE "process_leveling"            "default" "on"              # 平衡进程负载
    # Spine特定运行参数
    ChangePHP2_5 $CP_FILE "max_threads"                 "default" "1"               # 每进程最大线程数
    ChangePHP2_5 $CP_FILE "php_servers"                 "default" "1"               # PHP脚本服务程序数
    ChangePHP2_5 $CP_FILE "script_timeout"              "default" "25"              # 脚本和脚本服务程序的超时值
    ChangePHP2_5 $CP_FILE "max_get_size"                "default" "10"              # 每SNMP获取请求的最大OID's数量
    # 设备可用性设置
    ChangePHP2_5 $CP_FILE "availability_method"         "default" "2"      			# 离线设备检测:Ping&SNMP
    ChangePHP2_5 $CP_FILE "ping_method"                 "default" "3"        		# Ping类型:PING_UDP
    ChangePHP2_5 $CP_FILE "ping_port"                   "default" "23"              # Ping端口
    ChangePHP2_5 $CP_FILE "ping_timeout"                "default" "400"             # Ping超时值
    ChangePHP2_5 $CP_FILE "ping_retries"                "default" "1"               # Ping重试计数
    # 设备在线/离线设置
    ChangePHP2_5 $CP_FILE "ping_failure_count"          "default" "2"               # 失败计数
    ChangePHP2_5 $CP_FILE "ping_recovery_count"         "default" "3"               # 恢复计数

}

PhpConfAuthen()
{
    CA_FILE="$CACTI_LINK/include/global_settings.php"
    # 常规
    ChangePHP2_5 $CA_FILE "auth_method"                 "default" "1"               # 恢复计数
    # 特殊用户
    ChangePHP2_5 $CA_FILE "guest_user"                  "default" "0"               # 游客用户
    ChangePHP2_5 $CA_FILE "user_template"               "default" "0"               # 用户模板
    # LDAP全局设置
    ChangePHP2_5 $CA_FILE "ldap_server"                 "default" ""                # 服务器
    ChangePHP2_5 $CA_FILE "ldap_port"                   "default" "389"             # 标准端口
    ChangePHP2_5 $CA_FILE "ldap_port_ssl"               "default" "636"             # SSL端口
    ChangePHP2_5 $CA_FILE "ldap_version"                "default" "3"               # 协议版本:版本 3
    ChangePHP2_5 $CA_FILE "ldap_encryption"             "default" "0"               # 加密:无
    ChangePHP2_5 $CA_FILE "ldap_referrals"              "default" "0"               # 分派:停用
    ChangePHP2_5 $CA_FILE "ldap_mode"                   "default" "0"               # 方式:不搜索
    ChangePHP2_5 $CA_FILE "ldap_dn"                     "default" ""                # 可区别名称(DN)
    ChangePHP2_5 $CA_FILE "ldap_group_require"          "default" ""                # 需要组成员资格
    # LDAP组设置
    ChangePHP2_5 $CA_FILE "ldap_group_dn"               "default" ""                # 组可区别名称(DN)
    ChangePHP2_5 $CA_FILE "ldap_group_attrib"           "default" ""                # 组成员属性
    ChangePHP2_5 $CA_FILE "ldap_group_member_type"      "default" "1"               # 组成员类型:可区别名称
    # LDAP特有搜索设置s
    ChangePHP2_5 $CA_FILE "ldap_search_base"            "default" ""                # 搜索基准
    ChangePHP2_5 $CA_FILE "ldap_search_filter"          "default" ""                # 搜索过滤
    ChangePHP2_5 $CA_FILE "ldap_specific_dn"            "default" ""                # 搜索可区别名称(DN)
    ChangePHP2_5 $CA_FILE "ldap_specific_password"      "default" ""                # 搜索密码
}

PhpConfGeneral;
PhpConfPath;
PhpConfExport;
PhpConfVisual;
PhpConfPoller;
PhpConfAuthen;
