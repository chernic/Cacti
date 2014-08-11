#!/bin/sh
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-9
# while :; do :; done
# Tool Needed : xmlstarlet
#####################################################
# 以下用脚本生成脚本
# 用于检测被监控服务器的OID是否有效
#####################################################
LOG_FILE="$OUT__DIR/$(basename $0 .sh).log"

CheckScript()
{

}


# <interface>
	# <name>Get Unix Mounted Partitions</name>
	# <description>Queries a list of mounted partitions on a unix-based host with the 'df' command.</description>
	# <script_path>perl |path_cacti|/scripts/query_unix_partitions.pl</script_path>
	# <arg_index>index</arg_index>
	# <arg_query>query</arg_query>
	# <arg_get>get</arg_get>
	# <arg_num_indexes>num_indexes</arg_num_indexes>
	# <output_delimeter>:</output_delimeter>
	# <index_order>dskDevice</index_order>
	# <index_order_type>alphabetic</index_order_type>
	# <index_title_format>|chosen_order_field|</index_title_format>

	# <fields>
		# <dskDevice>
			# <name>Device Name</name>
			# <direction>input</direction>
			# <query_name>device</query_name>
		# </dskDevice>
		# <dskMount>
			# <name>Mount Point</name>
			# <direction>input</direction>
			# <query_name>mount</query_name>
		# </dskMount>

		# <dskTotal>
			# <name>Total Blocks</name>
			# <direction>output</direction>
			# <query_name>total</query_name>
		# </dskTotal>
		# <dskUsed>
			# <name>Used Blocks</name>
			# <direction>output</direction>
			# <query_name>used</query_name>
		# </dskUsed>
		# <dskAvailable>
			# <name>Available Blocks</name>
			# <direction>output</direction>
			# <query_name>available</query_name>
		# </dskAvailable>
		# <dskPercentUsed>
			# <name>Percent Used</name>
			# <direction>output</direction>
			# <query_name>percent</query_name>
		# </dskPercentUsed>
	# </fields>
# </interface>