#!/bin/bash

set -e

trap 'echo "Error in  line $LINENO , command: $BASH_COMMAND"' ERR

echo "This is Mahesh"
echo "This is Keeru"
echooo "This is not good"
echo "I love icecream"