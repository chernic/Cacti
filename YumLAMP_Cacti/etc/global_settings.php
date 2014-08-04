<?php
/*
 +-------------------------------------------------------------------------+
 | Copyright (C) 2004-2009 The Cacti Group                                 |
 |                                                                         |
 | This program is free software; you can redistribute it and/or           |
 | modify it under the terms of the GNU General Public License             |
 | as published by the Free Software Foundation; either version 2          |
 | of the License, or (at your option) any later version.                  |
 |                                                                         |
 | This program is distributed in the hope that it will be useful,         |
 | but WITHOUT ANY WARRANTY; without even the implied warranty of          |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           |
 | GNU General Public License for more details.                            |
 +-------------------------------------------------------------------------+
 | Cacti: The Complete RRDTool-based Graphing Solution                     |
 +-------------------------------------------------------------------------+
 | This code is designed, written, and maintained by the Cacti Group. See  |
 | about.php and/or the AUTHORS file for specific developer information.   |
 +-------------------------------------------------------------------------+
 | http://www.cacti.net/                                                   |
 +-------------------------------------------------------------------------+
*/

/* tab information */
$tabs = array(
	"general" => "常规",
	"path" => "路径",
	"poller" => "轮询器",
	"export" => "图像导出",
	"visual" => "可视化",
	"authentication" => "认证");

$tabs_graphs = array(
	"general" => "常规",
	"thumbnail" => "图像缩略",
	"tree" => "树状查看方式",
	"preview" => "预览查看方式",
	"list" => "列表查看方式",
	"fonts" => "图像字体(RRDtool 1.2.x及以上版本)");

/* setting information */
$settings = array(
	"path" => array(
		"dependent_header" => array(
			"friendly_name" => "需要的应用程序路径",
			"method" => "spacer",
			),
		"path_snmpwalk" => array(
			"friendly_name" => "snmpwalk路径",
			"description" => "snmpwalk文件的全路径.",
			"method" => "filepath",
			"max_length" => "255"
			),
		"path_snmpget" => array(
			"friendly_name" => "snmpget路径",
			"description" => "snmpget文件的路径.",
			"method" => "filepath",
			"max_length" => "255"
			),
		"path_snmpbulkwalk" => array(
			"friendly_name" => "snmpbulkwalk路径",
			"description" => "snmpbulkwalk文件的路径.",
			"method" => "filepath",
			"max_length" => "255"
			),
		"path_snmpgetnext" => array(
			"friendly_name" => "snmpgetnext路径",
			"description" => "snmpgetnext文件的路径.",
			"method" => "filepath",
			"max_length" => "255"
			),
		"path_rrdtool" => array(
			"friendly_name" => "RRDTool路径",
			"description" => "rrdtool文件的路径.",
			"method" => "filepath",
			"max_length" => "255"
			),
		"path_rrdtool_default_font" => array(
			"friendly_name" => "RRDTool默认字体路径",
			"description" => "rrdtool v1.2以上版本所使用的Truetype字体路径.",
			"method" => "filepath",
			"max_length" => "255"
			),
		"path_php_binary" => array(
			"friendly_name" => "PHP路径",
			"description" => "php文件的路径(可能需要重新编辑以获得此文件).",
			"method" => "filepath",
			"max_length" => "255"
			),
		"logging_header" => array(
			"friendly_name" => "日志",
			"method" => "spacer",
			),
		"path_cactilog" => array(
			"friendly_name" => "Cacti日志文件路径",
			"description" => "Cacti日志文件的路径(如果空白,默认为<path_cacti>/log/cacti.log)",
			"method" => "filepath",
			"default" => $config["base_path"] . "/log/cacti.log",
			"max_length" => "255"
			),
		"pollerpaths_header" => array(
			"friendly_name" => "轮询器路径",
			"method" => "spacer",
			),
		"path_spine" => array(
			"friendly_name" => "Spine轮询器路径",
			"description" => "Spine的路径.",
			"method" => "filepath",
			"max_length" => "255"
			),
		"extendedpaths_header" => array(
			"friendly_name" => "RRD路径结构",
			"method" => "spacer",
			),
		"extended_paths" => array(
			"friendly_name" => "RRA路径结构(/host_id/local_data_id.rrd)",
			"description" => "每个设备使用分离的子目录保存RRD文件.",
			"method" => "checkbox"
 			)
		),
	"general" => array(
		"logging_header" => array(
			"friendly_name" => "事件日志",
			"method" => "spacer",
			),
		"log_destination" => array(
			"friendly_name" => "日志文件目的地",
			"description" => "Cacti如何处理事件日志.",
			"method" => "drop_array",
			"default" => 1,
			"array" => $logfile_options,
			),
		"web_log" => array(
			"friendly_name" => "Web事件",
			"description" => "Web站点信息的哪些被放入日志.",
			"method" => "checkbox_group",
			"tab" => "general",
			"items" => array(
				"log_snmp" => array(
					"friendly_name" => "Web SNMP信息",
					"default" => ""
					),
				"log_graph" => array(
					"friendly_name" => "Web RRD图像语法",
					"default" => ""
					),
				"log_export" => array(
					"friendly_name" => "图像导出信息",
					"default" => ""
					)
				),
			),
		"poller_header" => array(
			"friendly_name" => "轮询器特有日志",
			"method" => "spacer",
			),
		"log_verbosity" => array(
			"friendly_name" => "轮询器日志级别",
			"description" => "你需要发送到日志文件的详细资料的级别.   警告: 使用除不记录或低级别记录以外的其它选项可能会很快耗尽你的磁盘空间.",
			"method" => "drop_array",
			"default" => POLLER_VERBOSITY_LOW,
			"array" => $logfile_verbosity,
			),
		"poller_log" => array(
			"friendly_name" => "轮询器系统/事件日志选择",
			"description" => "如果你使用系统/事件日志,Cacti轮询器信息的哪些将放入系统/事件日志.",
			"method" => "checkbox_group",
			"tab" => "poller",
			"items" => array(
				"log_pstats" => array(
					"friendly_name" => "轮询器统计信息",
					"default" => ""
					),
				"log_pwarn" => array(
					"friendly_name" => "轮询器警告信息",
					"default" => ""
					),
				"log_perror" => array(
					"friendly_name" => "轮询器错误信息",
					"default" => "on"
					)
				),
			),
		"versions_header" => array(
			"friendly_name" => "需要的应用程序版本",
			"method" => "spacer",
			),
		"snmp_version" => array(
			"friendly_name" => "SNMP应用程序版本",
			"description" => "你所安装的SNMP.  如果你使用SNMP v2c或没有在PHP中嵌入SNMP支持,需安装.",
			"method" => "drop_array",
			"default" => "net-snmp",
			"array" => $snmp_implimentations,
			),
		"rrdtool_version" => array(
			"friendly_name" => "RRDTool应用程序版本",
			"description" => "你所安装的RRDTool版本.",
			"method" => "drop_array",
			"default" => "rrd-1.0.x",
			"array" => $rrdtool_versions,
			),
		"snmp_header" => array(
			"friendly_name" => "SNMP默认选项",
			"method" => "spacer",
			),
		"snmp_ver" => array(
			"friendly_name" => "SNMP版本",
			"description" => "所有新设备默认使用的SNMP版本.",
			"method" => "drop_array",
			"default" => "版本 2",
			"array" => $snmp_versions,
			),
		"snmp_community" => array(
			"friendly_name" => "SNMP连接字串",
			"description" => "所有新设备默认使用的SNMP读取连接字串.",
			"method" => "textbox",
			"default" => "public",
			"max_length" => "100",
			),
		"snmp_username" => array(
			"friendly_name" => "SNMP(v3)用户名",
			"description" => "轮询设备时使用的SNMPv3用户名.",
			"method" => "textbox",
			"default" => "",
			"max_length" => "100",
			),
		"snmp_password" => array(
			"friendly_name" => "SNMP(v3)密码",
			"description" => "轮询设备时使用的SNMPv3密码.",
			"method" => "textbox_password",
			"default" => "",
			"max_length" => "100",
			),
		"snmp_auth_protocol" => array(
			"method" => "drop_array",
			"friendly_name" => "SNMP(v3)认证协议",
			"description" => "选择SNMPv3认证协议.",
			"default" => "MD5",
			"array" => $snmp_auth_protocols,
			),
		"snmp_priv_passphrase" => array(
			"method" => "textbox",
			"friendly_name" => "SNMP(v3)加密短语",
			"description" => "选择SNMPv3的加密短语.",
			"default" => "",
			"max_length" => "200"
			),
		"snmp_priv_protocol" => array(
			"method" => "drop_array",
			"friendly_name" => "SNMP(v3)加密协议",
			"description" => "选择SNMPv3的加密协议.",
			"default" => "DES",
			"array" => $snmp_priv_protocols,
			),
		"snmp_timeout" => array(
			"friendly_name" => "SNMP超时",
			"description" => "默认以毫秒计的SNMP超时.",
			"method" => "textbox",
			"default" => "500",
			"max_length" => "10",
			"size" => "5"
			),
		"snmp_port" => array(
			"friendly_name" => "SNMP端口",
			"description" => "默认SNMP调用使用的UDP端口,常规为161..",
			"method" => "textbox",
			"default" => "161",
			"max_length" => "10",
			"size" => "5"
			),
		"snmp_retries" => array(
			"friendly_name" => "SNMP重试",
			"description" => "在确定失败前,SNMP轮询器尝试连接设备的次数.",
			"method" => "textbox",
			"default" => "3",
			"max_length" => "10",
			"size" => "5"
			),
		"other_header" => array(
			"friendly_name" => "其它默认选项",
			"method" => "spacer",
			),
		"reindex_method" => array(
			"friendly_name" => "数据查询重新索引方式",
			"description" => "所有数据查询重新索引的默认方式.",
			"method" => "drop_array",
			"default" => "1",
			"array" => $reindex_types,
			),
		"deletion_verification" => array(
			"friendly_name" => "删除验证",
			"description" => "在项目删除前提示用户.",
			"default" => "on",
			"method" => "checkbox"
			)
		),
	"export" => array(
		"export_hdr_general" => array(
			"friendly_name" => "常规",
			"method" => "spacer",
			),
		"export_type" => array(
			"friendly_name" => "导出方式",
			"description" => "选择哪种导出方式.",
			"method" => "drop_array",
			"default" => "disabled",
			"array" => array(
						"disabled" => "停用(不导出)",
						"local" => "标准(本地路径)",
						"ftp_php" => "FTP(远程) - 使用php函数",
						"ftp_ncftpput" => "FTP(远程) - 使用ncftpput",
						"sftp_php" => "SFTP(远程) - 使用ssh php函数"
						),
			),
		"export_presentation" => array(
			"friendly_name" => "图像方式",
			"description" => "选择生成的html页面使用哪种图像. 如果选择标准图像, 图像只放入一个html页面中.如果选择树状图像,图像树结构将保留在静态页面中.",
			"method" => "drop_array",
			"default" => "disabled",
			"array" => array(
						"classical" => "标准图像",
						"tree" => "树状图像",
						),
			),
		"export_tree_options" => array(
			"friendly_name" => "树设置",
			"method" => "spacer",
			),
		"export_tree_isolation" => array(
			"friendly_name" => "树隔离",
			"description" => "此设置决定整个树是保持单一层次还是分离的层次结构. 如果分离,图像将彼此独立.",
			"method" => "drop_array",
			"default" => "off",
			"array" => array(
						"off" => "单树表示",
						"on" => "多树表示"
						),
			),
		"export_user_id" => array(
			"friendly_name" => "有效用户名",
			"description" => "用此用户名建立输出权限.此用户名将决定哪些图像/树被输出.此设置与当前模板是否可用的状态相关联.",
			"method" => "drop_sql",
			"sql" => "SELECT id, username AS name FROM user_auth ORDER BY name",
			"default" => "1"
			),
		"export_tree_expand_hosts" => array(
			"friendly_name" => "展开设备树",
			"description" => "此设置决定是否设备树被展开.如果展开,每一设备将生成自己独立的子目录用来容纳数据模板或数据查询项目.",
			"method" => "drop_array",
			"default" => "off",
			"array" => array(
						"off" => "否",
						"on" => "是"
						),
			),
		"export_thumb_options" => array(
			"friendly_name" => "缩略图设置",
			"method" => "spacer",
			),
		"export_default_height" => array(
			"friendly_name" => "缩略图高度",
			"description" => "缩略图的高度(像素).",
			"method" => "textbox",
			"default" => "100",
			"max_length" => "10",
			"size" => "5"
			),
		"export_default_width" => array(
			"friendly_name" => "缩略图宽度",
			"description" => "缩略图的宽度(像素).",
			"method" => "textbox",
			"default" => "300",
			"max_length" => "10",
			"size" => "5"
			),
		"export_num_columns" => array(
			"friendly_name" => "缩略图列数",
			"description" => "一行有几个缩略图显示.",
			"method" => "textbox",
			"default" => "2",
			"max_length" => "5",
			"size" => "5"
			),
		"export_hdr_paths" => array(
			"friendly_name" => "路径",
			"method" => "spacer",
			),
		"path_html_export" => array(
			"friendly_name" => "导出目录(本地和ftp)",
			"description" => "本地或远程系统用来容纳导出数据的目录.",
			"method" => "dirpath",
			"max_length" => "255"
			),
		"export_temporary_directory" => array(
			"friendly_name" => "本地临时目录(仅ftp)",
			"description" => "通过ftp发送到远程站点前,Cacti用此目录临时存储输出.此目录下的内容将在ftp完成后删除.",
			"method" => "dirpath",
			"max_length" => "255"
			),
		"export_hdr_timing" => array(
			"friendly_name" => "定时",
			"method" => "spacer",
			),
		"export_timing" => array(
			"friendly_name" => "定时导出",
			"description" => "选择何时导出图像.",
			"method" => "drop_array",
			"default" => "disabled",
			"array" => array(
						"disabled" => "停用",
						"classic" => "标准(每x次导出)",
						"export_hourly" => "每小时的指定分钟",
						"export_daily" => "每天的指定时间"
						),
			),
		"path_html_export_skip" => array(
			"friendly_name" => "每x次导出",
			"description" => "如果你不想Cacti每5分钟导出静态图像,在此输入其它数字. 例如, 3代表15分钟(3*5分钟).",
			"method" => "textbox",
			"max_length" => "10",
			"size" => "5"
			),
		"export_hourly" => array(
			"friendly_name" => "每小时的指定分钟",
			"description" => "如果你想Cacti基于小时导出图像, 此处输入分钟来决定何时导出. Cacti假定你每五分钟运行一次数据采集脚本, 所以将四舍五入此值到最接近运行时间的一个值. 例如, 分钟43将等于分钟40.",
			"method" => "textbox",
			"max_length" => "10",
			"size" => "5"
			),
		"export_daily" => array(
			"friendly_name" => "每天的指定时间",
			"description" => "如果你想Cacti基于天导出图像, 此处输入时间来决定何时导出. Cacti假定你每五分钟运行一次数据采集脚本, 所以将四舍五入此值到最接近运行时间的一个值. 例如, 21:43将等于21:40.",
			"method" => "textbox",
			"max_length" => "10",
			"size" => "5"
			),
		"export_hdr_ftp" => array(
			"friendly_name" => "FTP选项",
			"method" => "spacer",
			),
		"export_ftp_sanitize" => array(
			"friendly_name" => "清洁远程目录",
			"description" => "删除在远程FTP目录中已存在的任何文件. 仅当使用php内置ftp函数时,使用此项.",
			"method" => "checkbox",
			"max_length" => "255"
			),
		"export_ftp_host" => array(
			"friendly_name" => "FTP设备",
			"description" => "使用ftp上传图像到此设备.",
			"method" => "textbox",
			"max_length" => "255"
			),
		"export_ftp_port" => array(
			"friendly_name" => "FTP端口",
			"description" => "FTP服务程序的通信端口(不填使用默认端口). 默认: 21.'",
			"method" => "textbox",
			"max_length" => "10",
			"size" => "5"
			),
		"export_ftp_passive" => array(
			"friendly_name" => "使用被动方式",
			"description" => "使用passive模式连接FTP服务程序.",
			"method" => "checkbox",
			"max_length" => "255"
			),
		"export_ftp_user" => array(
			"friendly_name" => "FTP用户",
			"description" => "登录到远端服务器的账户(不填使用默认账户).",
			"method" => "textbox",
			"max_length" => "255"
			),
		"export_ftp_password" => array(
			"friendly_name" => "FTP密码",
			"description" => "FTP账户的密码(不填为空).",
			"method" => "textbox_password",
			"max_length" => "255"
			)
		),
	"visual" => array(
		"graphmgmt_header" => array(
			"friendly_name" => "图像管理",
			"method" => "spacer",
			),
		"num_rows_graph" => array(
			"friendly_name" => "每页行数",
			"description" => "在图像管理页面中每页显示的行数.",
			"method" => "drop_array",
			"default" => "30",
			"array" => $item_rows
			),
		"max_title_graph" => array(
			"friendly_name" => "最大标题长度",
			"description" => "用于显示图像标题的最大字符数.",
			"method" => "textbox",
			"default" => "80",
			"max_length" => "10",
			"size" => "5"
			),
		"dataqueries_header" => array(
			"friendly_name" => "数据查询",
			"method" => "spacer",
			),
		"max_data_query_field_length" => array(
			"friendly_name" => "最大域长度",
			"description" => "用于显示数据查询区域的最大字符数.",
			"method" => "textbox",
			"default" => "15",
			"max_length" => "10",
			"size" => "5"
			),
		"graphs_new_header" => array(
			"friendly_name" => "创建图像",
			"method" => "spacer",
			),
		"default_graphs_new_dropdown" => array(
			"friendly_name" => "默认下拉选择器",
			"description" => "当创建图像时,默认你希望页面如何出现",
			"method" => "drop_array",
			"default" => "-2",
			"array" => array("-2" => "所有类型", "-1" => "通过模板/数据查询"),
			),
		"num_rows_data_query" => array(
			"friendly_name" => "数据查询图像行数",
			"description" => "每个数据查询页面里最大的数据查询行数. 此项应用于'新建图像'页面.",
			"method" => "drop_array",
			"default" => "30",
			"array" => $item_rows
			),
		"datasources_header" => array(
			"friendly_name" => "数据源",
			"method" => "spacer",
			),
		"num_rows_data_source" => array(
			"friendly_name" => "每页行数",
			"description" => "在数据源页面中每页显示的行数.",
			"method" => "drop_array",
			"default" => "30",
			"array" => $item_rows
			),
		"max_title_data_source" => array(
			"friendly_name" => "最大标题长度",
			"description" => "用于显示数据源标题的最大字符数.",
			"method" => "textbox",
			"default" => "45",
			"max_length" => "10",
			"size" => "5"
			),
		"devices_header" => array(
			"friendly_name" => "设备",
			"method" => "spacer",
			),
		"num_rows_device" => array(
			"friendly_name" => "每页行数",
			"description" => "在设备页面中每页显示的行数.",
			"method" => "drop_array",
			"default" => "30",
			"array" => $item_rows
			),
		"logmgmt_header" => array(
			"friendly_name" => "日志管理",
			"method" => "spacer",
			),
		"num_rows_log" => array(
			"friendly_name" => "默认日志文件取尾行数",
			"description" => "从Cacti日志文件尾部默认取多少行.",
			"method" => "drop_array",
			"default" => 500,
			"array" => $log_tail_lines,
			),
		"log_refresh_interval" => array(
			"friendly_name" => "刷新日志文件",
			"description" => "每隔多少时间刷新日志显示.",
			"method" => "drop_array",
			"default" => 60,
			"array" => $page_refresh_interval,
			),
		"fonts_header" => array(
			"friendly_name" => "默认RRDtool 1.2字体",
			"method" => "spacer",
			),
		"title_size" => array(
			"friendly_name" => "标题字体大小",
			"description" => "标题使用的字体大小",
			"method" => "textbox",
			"default" => "12",
			"max_length" => "10",
			"size" => "5"
			),
		"title_font" => array(
			"friendly_name" => "标题字体文件",
			"description" => "标题使用的字体文件",
			"method" => "filepath",
			"max_length" => "100"
			),
		"legend_size" => array(
			"friendly_name" => "图例字体大小",
			"description" => "图例使用的字体大小",
			"method" => "textbox",
			"default" => "10",
			"max_length" => "10",
			"size" => "5"
			),
		"legend_font" => array(
			"friendly_name" => "图例字体文件",
			"description" => "图例使用的字体文件",
			"method" => "filepath",
			"max_length" => "100"
			),
		"axis_size" => array(
			"friendly_name" => "坐标轴字体大小",
			"description" => "坐标轴使用的字体大小",
			"method" => "textbox",
			"default" => "8",
			"max_length" => "10",
			"size" => "5"
			),
		"axis_font" => array(
			"friendly_name" => "坐标轴字体文件",
			"description" => "坐标轴使用的字体文件",
			"method" => "filepath",
			"max_length" => "100"
			),
		"unit_size" => array(
			"friendly_name" => "单位符号字体大小",
			"description" => "单位符号的字体大小",
			"method" => "textbox",
			"default" => "8",
			"max_length" => "10",
			"size" => "5"
			),
		"unit_font" => array(
			"friendly_name" => "单位符号字体文件",
			"description" => "单位符号项目使用的字体文件",
			"method" => "filepath",
			"max_length" => "100"
			)
		),
	"poller" => array(
		"poller_header" => array(
			"friendly_name" => "常规",
			"method" => "spacer",
			),
		"poller_enabled" => array(
			"friendly_name" => "启用",
			"description" => "如果你想停止轮询进程, 不选此项.",
			"method" => "checkbox",
			"default" => "on",
			"tab" => "poller"
			),
		"poller_type" => array(
			"friendly_name" => "轮询器类型",
			"description" => "使用的轮询器类型.此设置将在下次轮询间隔生效.",
			"method" => "drop_array",
			"default" => 1,
			"array" => $poller_options,
			),
		"poller_interval" => array(
			"friendly_name" => "轮询间隔",
			"description" => "T使用的轮询间隔. 此设置决定rrd文件的更新效率. 要更改实际的轮询间隔, 你必须更改cron中的时间表.
			<strong><u>注: 如果你改变此数值, 你必须重建轮询器缓存. 否则可能丢失数据.</u></strong>",
			"method" => "drop_array",
			"default" => 300,
			"array" => $poller_intervals,
			),
		"cron_interval" => array(
			"friendly_name" => "Cron间隔",
			"description" => "使用cron的时间间隔. 你需要设置此项与cron中或时间表中任务的间隔一致.",
			"method" => "drop_array",
			"default" => 300,
			"array" => $cron_intervals,
			),
		"concurrent_processes" => array(
			"friendly_name" => "最大并发轮询器进程",
			"description" => "运行并发进程的数目.  当使用cmd.php时,设置较高的数值将改善性能. Spine的性能改善最好使用线程参数解决.",
			"method" => "textbox",
			"default" => "1",
			"max_length" => "10",
			"size" => "5"
			),
		"process_leveling" => array(
			"friendly_name" => "平衡进程负载",
			"description" => "选择此项, Cacti通过平均分配查询项项目至每个进程中,来平衡每个轮询进程的负载.",
			"method" => "checkbox",
			"default" => "on"
			),
		"spine_header" => array(
			"friendly_name" => "Spine特定运行参数",
			"method" => "spacer",
			),
		"max_threads" => array(
			"friendly_name" => "每进程最大线程数",
			"description" => "每个进程最大允许的线程数. 使用Spine时,设置较高的数值将改善性能.",
			"method" => "textbox",
			"default" => "1",
			"max_length" => "10",
			"size" => "5"
			),
		"php_servers" => array(
			"friendly_name" => "PHP脚本服务程序数",
			"description" => "运行每Spine进程时,并发脚本服务程序的数目. 设置区间1到10. 此参数帮助你运行多个线程和脚本服务程序.",
			"method" => "textbox",
			"default" => "1",
			"max_length" => "10",
			"size" => "5"
			),
		"script_timeout" => array(
			"friendly_name" => "脚本和脚本服务程序的超时值",
			"description" => "Cacti等待脚本结束的最大时间(秒).",
			"method" => "textbox",
			"default" => "25",
			"max_length" => "10",
			"size" => "5"
			),
		"max_get_size" => array(
			"friendly_name" => "每SNMP获取请求的最大OID's数量",
			"description" => "每个snmpbulkwalk请求能获取的最大OID's数目. 在连接较慢网络中增加此值可以提高轮询器的效率.最大值为60. 此值为0或1时将关闭snmpbulkwalk",
			"method" => "textbox",
			"default" => "10",
			"max_length" => "10",
			"size" => "5"
			),
		"availability_header" => array(
			"friendly_name" => "设备可用性设置",
			"method" => "spacer",
			),
		"availability_method" => array(
			"friendly_name" => "离线设备检测",
			"description" => "Cacti使用此方式决定设备是否可轮询.  <br><i>注: 至少,总是推荐选择SNMP.</i>",
			"method" => "drop_array",
			"default" => AVAIL_SNMP,
			"array" => $availability_options,
			),
		"ping_method" => array(
			"friendly_name" => "Ping类型",
			"description" => "发送ping包的类型. <br><i>注: Linux/UNIX中使用ICMP需要root权限.</i>",
			"method" => "drop_array",
			"default" => PING_UDP,
			"array" => $ping_methods,
			),
		"ping_port" => array(
			"friendly_name" => "Ping端口",
			"description" => "无论选择TCP或UDP,在轮询前哪个端口被检测以确定设备的可用性.",
			"method" => "textbox",
			"default" => "23",
			"max_length" => "10",
			"size" => "5"
			),
		"ping_timeout" => array(
			"friendly_name" => "Ping超时值",
			"description" => "设备ICMP和UDP Ping超时值, 此设备SNMP超时值应用于SNMP Ping.",
			"method" => "textbox",
			"default" => "400",
			"max_length" => "10",
			"size" => "5"
			),
		"ping_retries" => array(
			"friendly_name" => "Ping重试计数",
			"description" => "Cacti在确定设备失败前,尝试Ping的次数.",
			"method" => "textbox",
			"default" => "1",
			"max_length" => "10",
			"size" => "5"
			),
		"updown_header" => array(
			"friendly_name" => "设备在线/离线设置",
			"method" => "spacer",
			),
		"ping_failure_count" => array(
			"friendly_name" => "失败计数",
			"description" => "记录错误及报告设备离线前,设备离线的轮询间隔数目.",
			"method" => "textbox",
			"default" => "2",
			"max_length" => "10",
			"size" => "5"
			),
		"ping_recovery_count" => array(
			"friendly_name" => "恢复计数",
			"description" => "设备回到在线状态及发布信息前,设备保持在线的轮询间隔数目.",
			"method" => "textbox",
			"default" => "3",
			"max_length" => "10",
			"size" => "5"
			)
		),
	"authentication" => array(
		"general_header" => array(
			"friendly_name" => "常规",
			"method" => "spacer",
			),
		"auth_method" => array(
			"friendly_name" => "认证方式",
			"description" => "<blockquote><i>无</i> - 不使用认证, 所有用户都拥有全部权限.<br><br><i>内置认证</i> - Cacti处理用户认证, 允许你在Cacti中创建用户和分配不同区域的权限.<br><br><i>Web基本认证</i> - Web服务程序处理用户认证. 如果定义了模板用户,在首次登录时将自动添加或创建用户.<br><br><i>LDAP认证</i> - 允许通过LDAP服务程序进行用户认证. 如果定义了模板用户,在首次登录时将自动创建用户, 否则定义的游客权限将被使用. 如果PHP的LDAP模块没有启用, LDAP用户认证将不会做为一个可选项出现.</blockquote>",
			"method" => "drop_array",
			"default" => 1,
			"array" => $auth_methods
			),
		"special_users_header" => array(
			"friendly_name" => "特殊用户",
			"method" => "spacer",
			),
		"guest_user" => array(
			"friendly_name" => "游客用户",
			"description" => "用于查看图像的游客名称,默认 \"无用户\".",
			"method" => "drop_sql",
			"none_value" => "无用户",
			"sql" => "select username as id, username as name from user_auth where realm = 0 order by username",
			"default" => "0"
			),
		"user_template" => array(
			"friendly_name" => "用户模板",
			"description" => "Cacti在新建Web基本和LDAP用户时,用来当做模板的用户名称,默认 \"guest\".",
			"method" => "drop_sql",
			"none_value" => "无用户",
			"sql" => "select username as id, username as name from user_auth where realm = 0 order by username",
			"default" => "0"
			),
		"ldap_general_header" => array(
			"friendly_name" => "LDAP全局设置",
			"method" => "spacer"
			),
		"ldap_server" => array(
			"friendly_name" => "服务器",
			"description" => "此服务器所在设备的DNS域名或ip地址.",
			"method" => "textbox",
			"max_length" => "255"
			),
		"ldap_port" => array(
			"friendly_name" => "标准端口",
			"description" => "非SSL通讯的TCP/UDP端口.",
			"method" => "textbox",
			"max_length" => "5",
			"default" => "389",
			"size" => "5"
			),
		"ldap_port_ssl" => array(
			"friendly_name" => "SSL端口",
			"description" => "SSL通讯的TCP/UDP端口.",
			"method" => "textbox",
			"max_length" => "5",
			"default" => "636",
			"size" => "5"
			),
		"ldap_version" => array(
			"friendly_name" => "协议版本",
			"description" => "此服务程序支持的协议版本.",
			"method" => "drop_array",
			"default" => "3",
			"array" => $ldap_versions
			),
		"ldap_encryption" => array(
			"friendly_name" => "加密",
			"description" => "此服务器支持的加密方式. TLS仅被协议版本3支持.",
			"method" => "drop_array",
			"default" => "0",
			"array" => $ldap_encryption
			),
		"ldap_referrals" => array(
			"friendly_name" => "分派",
			"description" => "启用或停用LDAP分派. 如果停用, 能提高搜索速度.",
			"method" => "drop_array",
			"default" => "0",
			"array" => array( "0" => "停用", "1" => "启用")
			),
		"ldap_mode" => array(
			"friendly_name" => "方式",
		"description" => "Cacti尝试通过LDAP服务程序认证用户时使用哪种方式.<blockquote><i>不搜索</i> - 无可区别名称(DN)搜索发生, 只是尝试绑定已提供的可区别名称(DN).<br><br><i>匿名搜索</i> - 通过匿名绑定访问LDAP目录,尝试搜索用户名以定位用户可区别名称(DN).<br><br><i>特定搜索</i> - 通过特定的可区别名称(DN)和密码绑定,尝试搜索用户名以定位可区别名称(DN).",
			"method" => "drop_array",
			"default" => "0",
			"array" => $ldap_modes
			),
		"ldap_dn" => array(
			"friendly_name" => "可区别名称(DN)",
			"description" => "可区别名称句法, 如Windows: <i>\"&lt;username&gt;@win2kdomain.local\"</i> 或OpenLDAP: <i>\"uid=&lt;username&gt;,ou=people,dc=domain,dc=local\"</i>.   \"&lt;username&gt\" 被替换为登录时提供的用户名. 仅被用于\"不搜索\"方式.",
			"method" => "textbox",
			"max_length" => "255"
			),
		"ldap_group_require" => array(
			"friendly_name" => "需要组成员资格",
			"description" => "认证用户需是组成员. 组设置须选择此项,不正确的组设置将导致认证失败.",
			"default" => "",
			"method" => "checkbox"
			),
		"ldap_group_header" => array(
			"friendly_name" => "LDAP组设置",
			"method" => "spacer"
			),
		"ldap_group_dn" => array(
			"friendly_name" => "组可区别名称(DN)",
			"description" => "用户须有成员资格的组可区别名称.",
			"method" => "textbox",
			"max_length" => "255"
			),
		"ldap_group_attrib" => array(
			"friendly_name" => "组成员属性",
			"description" => "包含成员用户名属性的名称.",
			"method" => "textbox",
			"max_length" => "255"
			),
		"ldap_group_member_type" => array(
			"friendly_name" => "组成员类型",
			"description" => "定义用户是否使用可区别名称或只使用在已定义组成员属性中的用户名.",
			"method" => "drop_array",
			"default" => 1,
			"array" => array( 1 => "可区别名称", 2 => "用户名" )
			),
		"ldap_search_base_header" => array(
			"friendly_name" => "LDAP特有搜索设置s",
			"method" => "spacer"
			),
		"ldap_search_base" => array(
			"friendly_name" => "搜索基准",
			"description" => "搜索LDAP目录的搜索基准, 如 <i>\"dc=win2kdomain,dc=local\"</i> 或 <i>\"ou=people,dc=domain,dc=local\"</i>.",
			"method" => "textbox",
			"max_length" => "255"
			),
		"ldap_search_filter" => array(
			"friendly_name" => "搜索过滤",
			"description" => "搜索过滤用于定位在LDAP目录中的用户, 如Windows: <i>\"(&amp;(objectclass=user)(objectcategory=user)(userPrincipalName=&lt;username&gt;*))\"</i> 或OpenLDAP: <i>\"(&(objectClass=account)(uid=&lt;username&gt))\"</i>.  \"&lt;username&gt\" 被替换为登录时提供的用户名. ",
			"method" => "textbox",
			"max_length" => "255"
			),
		"ldap_specific_dn" => array(
			"friendly_name" => "搜索可区别名称(DN)",
			"description" => "绑定到LDAP目录的可区别名称用于特定的搜索.",
			"method" => "textbox",
			"max_length" => "255"
			),
		"ldap_specific_password" => array(
			"friendly_name" => "搜索密码",
			"description" => "绑定到LDAP目录的密码用于特定的搜索.",
			"method" => "textbox_password",
			"max_length" => "255"
			)
		)
	);

$settings_graphs = array(
	"general" => array(
		"default_rra_id" => array(
			"friendly_name" => "默认循环档",
			"description" => "当缩略图没有显示或缩略图时间段设为0时,使用默认循环档.",
			"method" => "drop_sql",
			"sql" => "select id,name from rra order by timespan",
			"default" => "1"
			),
		"default_view_mode" => array(
			"friendly_name" => "默认查看方式",
			"description" => "当你访问'graph_view.php'时选择哪种显示方式",
			"method" => "drop_array",
			"array" => $graph_views,
			"default" => "1"
			),
		"default_timespan" => array(
			"friendly_name" => "默认图像查看时间段",
			"description" => "当显示图像时你希望显示的默认时间段",
			"method" => "drop_array",
			"array" => $graph_timespans,
			"default" => GT_LAST_DAY
			),
		"timespan_sel" => array(
			"friendly_name" => "显示图像查看时间段选择器",
			"description" => "选择是否显示时间段选择框.",
			"method" => "checkbox",
			"default" => "on"
		),
		"default_timeshift" => array(
			"friendly_name" => "默认图像查看时间位移",
			"description" => "当显示图像时你希望显示的默认的时间位移",
			"method" => "drop_array",
			"array" => $graph_timeshifts,
			"default" => GTS_1_DAY
			),
		"allow_graph_dates_in_future" => array(
			"friendly_name" => "允许图像扩展到未来",
			"description" => "当显示图像时,允许图像日期扩展到'未来'",
			"method" => "checkbox",
			"default" => "on"
		),
		"first_weekdayid" => array(
			"friendly_name" => "周的第一天",
			"description" => "按周显示的图片中,周的第一天",
			"method" => "drop_array",
			"array" => $graph_weekdays,
			"default" => WD_MONDAY
			),
		"day_shift_start" => array(
			"friendly_name" => "按天位移的开始时间",
			"description" => "按天位移的开始时间.",
			"method" => "textbox",
			"default" => "07:00",
			"max_length" => "5"
			),
		"day_shift_end" => array(
			"friendly_name" => "按天位移的结束时间",
			"description" => "按天位移的结束时间.",
			"method" => "textbox",
			"default" => "18:00",
			"max_length" => "5"
			),
		"default_date_format" => array(
			"friendly_name" => "图像日期显示格式",
			"description" => "图像所使用的日期格式",
			"method" => "drop_array",
			"array" => $graph_dateformats,
			"default" => GD_Y_MO_D
			),
		"default_datechar" => array(
			"friendly_name" => "图像日期分割符",
			"description" => "图像所使用的日期分割符",
			"method" => "drop_array",
			"array" => $graph_datechar,
			"default" => GDC_SLASH
			),
		"page_refresh" => array(
			"friendly_name" => "页面刷新",
			"description" => "每隔多少秒自动刷新页面.",
			"method" => "textbox",
			"default" => "300",
			"max_length" => "10"
			)
		),
	"thumbnail" => array(
		"default_height" => array(
			"friendly_name" => "缩略图高度",
			"description" => "缩略图的高度(像素).",
			"method" => "textbox",
			"default" => "100",
			"max_length" => "10"
			),
		"default_width" => array(
			"friendly_name" => "缩略图宽度",
			"description" => "缩略图的宽度(像素).",
			"method" => "textbox",
			"default" => "300",
			"max_length" => "10"
			),
		"num_columns" => array(
			"friendly_name" => "缩略图列数",
			"description" => "当显示图略图时使用的列数.",
			"method" => "textbox",
			"default" => "2",
			"max_length" => "5"
			),
		"thumbnail_sections" => array(
			"friendly_name" => "缩略图区域",
			"description" => "Cacti的哪些区域使用缩略图.",
			"method" => "checkbox_group",
			"items" => array(
				"thumbnail_section_preview" => array(
					"friendly_name" => "预览查看方式",
					"default" => "on"
					),
				"thumbnail_section_tree_1" => array(
					"friendly_name" => "树状查看(单面板)",
					"default" => "on"
					),
				"thumbnail_section_tree_2" => array(
					"friendly_name" => "树状查看(双面板)",
					"default" => ""
					)
				)
			)
		),
	"tree" => array(
		"default_tree_id" => array(
			"friendly_name" => "默认图像树",
			"description" => "当在树方式下显示图像时使用的默认图像树.",
			"method" => "drop_sql",
			"sql" => "select id,name from graph_tree order by name",
			"default" => "0"
			),
		"default_tree_view_mode" => array(
			"friendly_name" => "默认树状查看方式",
			"description" => "树状查看时默认的使用方式.",
			"method" => "drop_array",
			"array" => $graph_tree_views,
			"default" => "2"
			),
		"treeview_graphs_per_page" => array(
			"friendly_name" => "每页图像数",
			"description" => "预览查看时每页的图像数.",
			"method" => "drop_array",
			"default" => "10",
			"array" => $graphs_per_page
			),
		"default_dual_pane_width" => array(
			"friendly_name" => "双面板树宽度",
			"description" => "当使用双面板树状查看方式时,树所占的宽度(像素).",
			"method" => "textbox",
			"max_length" => "5",
			"default" => "200"
			),
		"expand_hosts" => array(
			"friendly_name" => "展开设备",
			"description" => "选择在双框树下是否展开设备所使用的图像模板.",
			"method" => "checkbox",
			"default" => ""
			),
		"show_graph_title" => array(
			"friendly_name" => "显示图像标题",
			"description" => "在页面中显示图像标题以便浏览器用来查询.",
			"method" => "checkbox",
			"default" => ""
			)
		),
	"preview" => array(
		"preview_graphs_per_page" => array(
			"friendly_name" => "每页图像数",
			"description" => "在预览查看方式下单个页面显示的图像数.",
			"method" => "drop_array",
			"default" => "10",
			"array" => $graphs_per_page
			)
		),
	"list" => array(
		"list_graphs_per_page" => array(
			"friendly_name" => "每页图像数",
			"description" => "在列表查看方式下单个页面显示的图像数.",
			"method" => "drop_array",
			"default" => "30",
			"array" => $graphs_per_page
			)
		),
	"fonts" => array(
		"custom_fonts" => array(
			"friendly_name" => "使用自定义字体",
			"description" => "选择使用自定义字体和字体大小还是使用系统默认设置.",
			"method" => "checkbox",
			"on_change" => "graphSettings()",
			"default" => ""
			),
		"title_size" => array(
			"friendly_name" => "标题字体大小",
			"description" => "标题使用的字体大小",
			"method" => "textbox",
			"default" => "12",
			"max_length" => "10"
			),
		"title_font" => array(
			"friendly_name" => "标题字体文件",
			"description" => "标题使用的字体文件",
			"method" => "filepath",
			"max_length" => "100"
			),
		"legend_size" => array(
			"friendly_name" => "图例字体大小",
			"description" => "图例使用的字体大小",
			"method" => "textbox",
			"default" => "10",
			"max_length" => "10"
			),
		"legend_font" => array(
			"friendly_name" => "图例字体文件",
			"description" => "图例使用的字体文件",
			"method" => "filepath",
			"max_length" => "100"
			),
		"axis_size" => array(
			"friendly_name" => "坐标轴字体大小",
			"description" => "坐标轴使用的字体大小",
			"method" => "textbox",
			"default" => "8",
			"max_length" => "10"
			),
		"axis_font" => array(
			"friendly_name" => "坐标轴字体文件",
			"description" => "坐标轴使用的字体文件",
			"method" => "filepath",
			"max_length" => "100"
			),
		"unit_size" => array(
			"friendly_name" => "单位符号字体大小",
			"description" => "单位符号使用的字体大小",
			"method" => "textbox",
			"default" => "8",
			"max_length" => "10"
			),
		"unit_font" => array(
			"friendly_name" => "单位符号字体文件",
			"description" => "单位符号项目使用的字体文件",
			"method" => "filepath",
			"max_length" => "100"
			)
		)
	);

?>
