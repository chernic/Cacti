#!/bin/bash
#####################################################
# LogFile With Color
#####################################################
# @Version : 0.0.2
# @Author   张泽钊
# @Edited by Chernic.Y.Chen @ China
# @E-Mail : iamchernic@gmail.com
# @Date : 2014-7-30

IS_LOADED_LOG_FUNC="yes";

# @function    Log2File
# @brief    写日志到文件。
# @param1    LogLevel（字符串）    日志级别（字符串）
# @param2    LogContext（字符串）  日志内容
# @param3    LogFile（字符串）     日志文件
# @return    无
function Log2File()
{
    local LogLevel=$1;
    local LogCtx=$2;
    local LogFile=$3;

    local LogTime="$(date '+%Y-%m-%d %H:%M:%S')";
    
    local LogStr="[${LogTime}][${LogLevel}]: ${LogCtx}"; 

    if [ "$LogFile" = "" ]; then
        echo -e "${LogStr}";
    else
        echo -e "${LogStr}" >> "${LogFile}";         
    fi
}

# @function    LOG_INFO,LOG_WARN,LOG_ERROR
# @brief     按指定级别写日志到文件。
# @param1    LogContext（字符串） 日志内容
# @param2    LogFile（字符串）    日志文件
# @return    无
function LOG_INFO(){
    Log2File "\033[32minfo\033[0m" "$1" "$2";
}
function LOG_WARN(){
    Log2File "\033[33mwarn\033[0m" "$1" "$2";
}
function LOG_ERROR(){
    Log2File "\033[31merror\033[0m" "$1" "$2";
}



