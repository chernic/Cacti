#!/bin/sh
XML__OUPT="./output//QueryDiskIO.xml"
 	echo " **** Add diskIOIndex.";
 	xmlstarlet ed -L -s //fields -t elem  -n diskIOIndex          -v " " $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOIndex  -t elem  -n "name"      -v index_of_diskIO  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOIndex  -t elem  -n "method"    -v walk  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOIndex  -t elem  -n "source"    -v value  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOIndex  -t elem  -n "direction" -v input  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOIndex  -t elem  -n "oid"       -v .1.3.6.1.4.1.2021.13.15.1.1.1  $XML__OUPT 
 	echo " **** Add diskIODevice.";
 	xmlstarlet ed -L -s //fields -t elem  -n diskIODevice          -v " " $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIODevice  -t elem  -n "name"      -v device_of_diskIO  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIODevice  -t elem  -n "method"    -v walk  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIODevice  -t elem  -n "source"    -v value  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIODevice  -t elem  -n "direction" -v input  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIODevice  -t elem  -n "oid"       -v .1.3.6.1.4.1.2021.13.15.1.1.2  $XML__OUPT 
 	echo " **** Add diskIONRead.";
 	xmlstarlet ed -L -s //fields -t elem  -n diskIONRead          -v " " $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONRead  -t elem  -n "name"      -v Not_Read_of_diskIO  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONRead  -t elem  -n "method"    -v walk  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONRead  -t elem  -n "source"    -v value  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONRead  -t elem  -n "direction" -v input  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONRead  -t elem  -n "oid"       -v .1.3.6.1.4.1.2021.13.15.1.1.3  $XML__OUPT 
 	echo " **** Add diskIONWritten.";
 	xmlstarlet ed -L -s //fields -t elem  -n diskIONWritten          -v " " $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWritten  -t elem  -n "name"      -v Not_Written_of_diskIO  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWritten  -t elem  -n "method"    -v walk  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWritten  -t elem  -n "source"    -v value  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWritten  -t elem  -n "direction" -v input  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWritten  -t elem  -n "oid"       -v .1.3.6.1.4.1.2021.13.15.1.1.4  $XML__OUPT 
 	echo " **** Add diskIOReads.";
 	xmlstarlet ed -L -s //fields -t elem  -n diskIOReads          -v " " $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOReads  -t elem  -n "name"      -v Reads_of_diskIO  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOReads  -t elem  -n "method"    -v walk  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOReads  -t elem  -n "source"    -v value  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOReads  -t elem  -n "direction" -v input  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOReads  -t elem  -n "oid"       -v .1.3.6.1.4.1.2021.13.15.1.1.5  $XML__OUPT 
 	echo " **** Add diskIOWrites.";
 	xmlstarlet ed -L -s //fields -t elem  -n diskIOWrites          -v " " $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOWrites  -t elem  -n "name"      -v Writes_of_diskIO  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOWrites  -t elem  -n "method"    -v walk  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOWrites  -t elem  -n "source"    -v value  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOWrites  -t elem  -n "direction" -v input  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIOWrites  -t elem  -n "oid"       -v .1.3.6.1.4.1.2021.13.15.1.1.6  $XML__OUPT 
 	echo " **** Add diskIONReadX.";
 	xmlstarlet ed -L -s //fields -t elem  -n diskIONReadX          -v " " $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONReadX  -t elem  -n "name"      -v Not_ReadX_of_diskIO  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONReadX  -t elem  -n "method"    -v walk  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONReadX  -t elem  -n "source"    -v value  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONReadX  -t elem  -n "direction" -v input  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONReadX  -t elem  -n "oid"       -v .1.3.6.1.4.1.2021.13.15.1.1.12  $XML__OUPT 
 	echo " **** Add diskIONWrittenX.";
 	xmlstarlet ed -L -s //fields -t elem  -n diskIONWrittenX          -v " " $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWrittenX  -t elem  -n "name"      -v Not_WrittenX_of_diskIO  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWrittenX  -t elem  -n "method"    -v walk  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWrittenX  -t elem  -n "source"    -v value  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWrittenX  -t elem  -n "direction" -v input  $XML__OUPT 
 	xmlstarlet ed -L -s ///diskIONWrittenX  -t elem  -n "oid"       -v .1.3.6.1.4.1.2021.13.15.1.1.13  $XML__OUPT 
