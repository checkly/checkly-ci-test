# Some initial variables
STATUS=
PASSING=
CHECK_RESULT=

# Call the Checkly trigger
CHECKLY_URL="https://api-test.checklyhq.com/check-groups/4/trigger/DidmXZCFd36j"
echo "Running your Checkly checks"
CHECK_RESULT=$(curl -s $CHECKLY_URL)
STATUS=$(echo $CHECK_RESULT | grep -c '"hasFailures":true')

# Report the status
if [ $STATUS -gt 0 ]; then
  echo "Checkly checks failed"
  PASSING=1
else 
  echo "Checkly checks passed"
  PASSING=0
fi

exit $PASSING