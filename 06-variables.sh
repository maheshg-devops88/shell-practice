#!/bin/bash



Start_Time=$(date +%S)

sleep 10

End_Time=$(date +%$)

Total_Time=$(($End_Time-$Start_Time))

echo "Total Time taken for script execution::$Total_Time"