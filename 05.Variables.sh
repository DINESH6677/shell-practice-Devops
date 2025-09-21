#!/bin/bash
starttime=$(date +%s)
sleep 10
endtime=$(date +%s)
Total_time = $(($endtime - $starttime))

echo "The Total Ti,e taken to get Executed id : $Total_time"
