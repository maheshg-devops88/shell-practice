TO_ADDRESS="mahesh9.storage@gmail.com"
SUBJECT="DISK_UTILIZATION_ALERT"






{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$usage"
} | msmtp "$TO_ADDRESS"