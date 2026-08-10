TO_ADDRESS=$1
SUBJECT=$2
MESSAGE_BODY=$3
SERVER_IP=$4

FINAL_MESSAGE=$(sed -e "s/SERVER_IP/$SERVER_IP/g" template.html)

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MESSAGE"
} | msmtp "$TO_ADDRESS"