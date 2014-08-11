#!/bin/sh
#####################################################
# Version : 0.0.1
# Make by Chernic.Y.Chen @ China
# E-Mail : iamchernic@gmail.com
# Date : 2014-7-9
# while :; do :; done
# Tool Needed : xmlstarlet
#####################################################
# 为了处理方便,在csv文件开始就对其进行拆分处理
# 该csv文件的特征是
# 第一列的元素开头的字符串 以所属类别的英文缩写小写开头
#####################################################
LOG_FILE=$OUT__DIR/$(basename $0 .sh).log

PrintXML()
{

	# 截获监控部分
	sed -n '/^'$OFlag'/p'  $CSV__FILE > $CSV__TEMP

	# 定义XML表头
	oid_indexB=`awk -F "," 'NR==1{printf $6}' $CSV__TEMP`
	V_query=(
		"Queries for $Object"
		"Queries a net-snmp host for a $Object listing -- By Chernic"
		"Any Question Email to iamchernic@gmail.com"
		"${oid_indexB%.*}"
		"`awk -F "," 'NR==2{printf $1}' $CSV__TEMP;awk -F "," 'NR==1{print ":"$1}' $CSV__TEMP`"
		"numeric"
		"|chosen_order_field|"
		"OID/REGEXP:.*\.1\.5\.1\.1\.(.*)$"
	)

	# XML文件名称
	XML__OUPT="$OUT__DIR/Query$Object.xml"
	
	# 订制XML“表头"
	cat $XML__INPT  > $XML__OUPT
	xmlstarlet ed -L -u "/query/name" 					-v "${V_query[0]}" 	$XML__OUPT
	xmlstarlet ed -L -u "/query/description" 			-v "${V_query[1]}" 	$XML__OUPT 
	xmlstarlet ed -L -u "/query/comment" 				-v "${V_query[2]}" 	$XML__OUPT 
	xmlstarlet ed -L -u "/query/oid_index" 				-v "${V_query[3]}" 	$XML__OUPT 
	xmlstarlet ed -L -u "/query/index_order" 			-v "${V_query[4]}" 	$XML__OUPT
	xmlstarlet ed -L -u "/query/index_order_type" 		-v "${V_query[5]}"  $XML__OUPT 
	xmlstarlet ed -L -u "/query/index_title_format" 	-v "${V_query[6]}"	$XML__OUPT
	xmlstarlet ed -L -u "/query/oid_index_parse" 		-v "${V_query[7]}"  $XML__OUPT
	
	# 订制XML“表身”
	echo  "#!/bin/sh" > $XML__TEMP
	echo  "XML__OUPT=\"$XML__OUPT\"" >> $XML__TEMP
	cat $CSV__TEMP | awk -F"," '{print " \
	echo \" **** Add "$1".\";\n \
	xmlstarlet ed -L -s //fields -t elem  -n "$1"          -v \" \" $XML__OUPT \n \
	xmlstarlet ed -L -s ///"$1"  -t elem  -n \"name\"      -v "$2"  $XML__OUPT \n \
	xmlstarlet ed -L -s ///"$1"  -t elem  -n \"method\"    -v "$3"  $XML__OUPT \n \
	xmlstarlet ed -L -s ///"$1"  -t elem  -n \"source\"    -v "$4"  $XML__OUPT \n \
	xmlstarlet ed -L -s ///"$1"  -t elem  -n \"direction\" -v "$5"  $XML__OUPT \n \
	xmlstarlet ed -L -s ///"$1"  -t elem  -n \"oid\"       -v "$6"  $XML__OUPT "}'\
	>> $XML__TEMP

	# 执行订制
	sh $XML__TEMP 2>&1  | tee -a $LOG_FILE
	
	# 验证XML有效
	xmlstarlet val $XML__OUPT
}