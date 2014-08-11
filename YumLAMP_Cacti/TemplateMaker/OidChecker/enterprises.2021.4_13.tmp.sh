#!/bin/sh
echo -ne " ***  Total Swap Size : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.3
echo -ne " ***  Available Swap Space : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.4
echo -ne " ***  Total RAM in machine : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.5
echo -ne " ***  Total RAM used : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.6
echo -ne " ***  Total RAM Free : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.7
echo -ne " ***  Total RAM Shared : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.8
echo -ne " ***  Total RAM Buffered : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.9
echo -ne " ***  Total Cached Memory : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.10
echo -ne " ***  Path where the disk is mounted : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.11
echo -ne " ***  Path of the device for the partition : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.12
echo -ne " ***  Total size of the disk/partion (kBytes) : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.13
echo -ne " ***  Available space on the disk : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.14
echo -ne " ***  Used space on the disk : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.15
echo -ne " ***  Percentage of space used on disk : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.16
echo -ne " ***  Percentage of inodes used on disk : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.17
echo -ne " ***  1 minute Load : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.18
echo -ne " ***  5 minute Load : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.19
echo -ne " ***  15 minute Load : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.20
echo -ne " ***  percentage of user CPU time : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.21
echo -ne " ***  raw user cpu time : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.22
echo -ne " ***  percentages of system CPU time : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.23
echo -ne " ***  raw system cpu time : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.24
echo -ne " ***  percentages of idle CPU time : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.25
echo -ne " ***  raw idle cpu time : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.26
echo -ne " ***  raw nice cpu time : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.27
echo -ne " ***  diskIOIndex : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.28
echo -ne " ***  diskIODevice : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.29
echo -ne " ***  diskIONRead : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.30
echo -ne " ***  diskIONWritten : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.31
echo -ne " ***  diskIOReads : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.32
echo -ne " ***  diskIOLoadAvg1min : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.33
echo -ne " ***  diskIOLoadAvg5min : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.34
echo -ne " ***  diskIOLoadAvg15min : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.35
echo -ne " ***  diskIOReads : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.36
echo -ne " ***  diskIONReadX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.37
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.38
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.39
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.40
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.41
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.42
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.43
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.44
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.45
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.46
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.47
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.48
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.49
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.50
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.51
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.52
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.53
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.54
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.55
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.56
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.57
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.58
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.59
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.60
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.61
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.62
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.63
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.64
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.65
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.66
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.67
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.68
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.69
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.70
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.71
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.72
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.73
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.74
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.75
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.76
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.77
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.78
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.79
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.80
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.81
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.82
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.83
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.84
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.85
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.86
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.87
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.88
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.89
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.90
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.91
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.92
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.93
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.94
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.95
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.96
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.97
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.98
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.99
echo -ne " ***  diskIONWrittenX : ";
snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.100
