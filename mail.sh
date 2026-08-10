TO_ADDRESS=$1
SUBJECT=$2
MESSAGE_BODY=$3

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/plain"
echo ""
echo "$MESSAGE_BODY"
} | msmtp "$TO_ADDRESS"