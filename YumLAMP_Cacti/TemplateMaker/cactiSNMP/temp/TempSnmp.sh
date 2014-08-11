#!/bin/sh
 	echo " snmpwalk memIndex.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.1
 	echo " snmpwalk memErrorName.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.2
 	echo " snmpwalk memTotalSwap.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.3
 	echo " snmpwalk memAvailSwap.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.4
 	echo " snmpwalk memTotalReal.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.5
 	echo " snmpwalk memAvailReal.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.6
 	echo " snmpwalk memTotalFree.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.11
 	echo " snmpwalk memMinimumSwap.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.12
 	echo " snmpwalk memShared.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.13
 	echo " snmpwalk memBuffer.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.14
 	echo " snmpwalk memCached.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.15
 	echo " snmpwalk memSwapError.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.101
 	echo " snmpwalk memSwapErrorMsg.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.4.100
 	echo " snmpwalk dskIndex.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.1
 	echo " snmpwalk dskPath.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.2
 	echo " snmpwalk dskDevice.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.3
 	echo " snmpwalk dskMinimum.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.4
 	echo " snmpwalk dskMinPercent.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.5
 	echo " snmpwalk dskTotal.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.6
 	echo " snmpwalk dskAvail.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.7
 	echo " snmpwalk dskUsed.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.8
 	echo " snmpwalk dskPercent.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.9
 	echo " snmpwalk dskPercentNode.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.10
 	echo " snmpwalk dskTotalLow.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.11
 	echo " snmpwalk dskTotalHigh.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.12
 	echo " snmpwalk dskAvailLow.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.13
 	echo " snmpwalk dskAvailHigh.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.14
 	echo " snmpwalk dskUsedLow.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.15
 	echo " snmpwalk dskUsedHigh.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.16
 	echo " snmpwalk dskErrorFlag.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.100
 	echo " snmpwalk dskErrorMsg.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.9.1.101
 	echo " snmpwalk laLoad.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.10.1.3.1
 	echo " snmpwalk laLoad.2.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.10.1.3.2
 	echo " snmpwalk laLoad.3.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.10.1.3.3
 	echo " snmpwalk ssIndex.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.1
 	echo " snmpwalk ssErrorName.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.2
 	echo " snmpwalk ssSwapIn.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.3
 	echo " snmpwalk ssSwapOut.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.4
 	echo " snmpwalk ssIOSent.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.5
 	echo " snmpwalk ssIOReceive.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.6
 	echo " snmpwalk ssSysInterrupts.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.7
 	echo " snmpwalk ssSysContext.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.8
 	echo " snmpwalk ssCpuUser.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.9
 	echo " snmpwalk ssCpuSystem.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.10
 	echo " snmpwalk ssCpuIdle.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.11
 	echo " snmpwalk ssCpuRawUser.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.50
 	echo " snmpwalk ssCpuRawNice.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.51
 	echo " snmpwalk ssCpuRawSystem.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.52
 	echo " snmpwalk ssCpuRawIdle.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.53
 	echo " snmpwalk ssCpuRawWait.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.54
 	echo " snmpwalk ssCpuRawKernel.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.55
 	echo " snmpwalk ssCpuRawInterrupt.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.56
 	echo " snmpwalk ssIORawSent.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.56
 	echo " snmpwalk ssIORawReceived.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.57
 	echo " snmpwalk ssRawInterrupts.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.58
 	echo " snmpwalk ssRawInterrupts.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.59
 	echo " snmpwalk ssCpuRawSoftIRQ.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.60
 	echo " snmpwalk ssRawSwapIn.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.61
 	echo " snmpwalk ssRawSwapOut.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.11.62
 	echo " snmpwalk diskIOIndex.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.13.15.1.1.1
 	echo " snmpwalk diskIODevice.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.13.15.1.1.2
 	echo " snmpwalk diskIONRead.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.13.15.1.1.3
 	echo " snmpwalk diskIONWritten.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.13.15.1.1.4
 	echo " snmpwalk diskIOReads.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.13.15.1.1.5
 	echo " snmpwalk diskIOWrites.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.13.15.1.1.6
 	echo " snmpwalk diskIONReadX.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.13.15.1.1.12
 	echo " snmpwalk diskIONWrittenX.";
 	snmpwalk -v2c -c public localhost  .1.3.6.1.4.1.2021.13.15.1.1.13
