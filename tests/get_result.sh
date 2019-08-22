RESULT_SUMMARY_FILE=$1

head -1 $RESULT_SUMMARY_FILE
cat $RESULT_SUMMARY_FILE | grep "summary = " | cut -d ":" -f3 | cut -d = -f2
