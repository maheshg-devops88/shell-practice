TO_ADDRESS=$1
SUBJECT=$2
MESSAGE=$3
SERVER_IP=$4

FINAL_MESSAGE_BODY=$(echo $MESSAGE | sed -e 's/[]\/$*.^[]/\\&/g')

FINAL_MESSAGE=$(sed -e "s/SERVER_IP/$SERVER_IP/g" -e "s/MESSAGE/$FINAL_MESSAGE_BODY/g" template.html)

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MESSAGE"
} | msmtp "$TO_ADDRESS"