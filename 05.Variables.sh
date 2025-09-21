#!/bin/bash
starttime=$(date +%s)
sleep 5 &
endtime=$(date +%s)
Total_time = $(($endtime-$starttime))

echo "The Time taken to get Executed is : $Total_time seconds"
