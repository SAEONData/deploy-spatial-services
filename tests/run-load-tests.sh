LAYER_TEST_LIST=$1
JMETER_BIN=~/workspace/jmeter/apache-jmeter-5.1.1/bin/jmeter
JMETER_CONFIG=../jmeter-test-configs/geoserver-basic-new-8000_short.jmx
NEW_HOST_URL=192.168.111.62
OLD_HOST_URL=app01.saeon.ac.za

TEST_THREAD_DELAY=10
#TEST_THREAD_DURATION=60
TEST_THREAD_DURATION=10

mkdir ./tmp/
rm ./tmp/*
cp $JMETER_CONFIG ./tmp/
#HEADER=$(head -1 $LAYER_TEST_LIST)

JMETER_CONF_FNAME=$(echo $JMETER_CONFIG | cut -d / -f3)

COUNT=0
for f in `cat $LAYER_TEST_LIST`
do
   cp $JMETER_CONFIG ./tmp/	
   CURR_PORT=$(echo $f | sed "s/http:\/\/spatialsv.saeon.int://g" | cut -d / -f1)
   #echo $CURR_PORT
   CURR_LAYER=$(echo $f | sed "s/http:\/\/spatialsv.saeon.int:$CURR_PORT//g" | sed 's/\//\\\//g' | sed 's/\&/\\\&amp\;/g')
   #echo $CURR_LAYER   
   
   sed -i "s/TEST_HOST/$NEW_HOST_URL/g" ./tmp/$(echo $JMETER_CONFIG | cut -d / -f3)
   sed -i "s/TEST_PORT/$CURR_PORT/g" ./tmp/$(echo $JMETER_CONFIG | cut -d / -f3)
   sed -i "s/TEST_LAYER/$CURR_LAYER/g" ./tmp/$(echo $JMETER_CONFIG | cut -d / -f3)
   #echo ""s/TEST_LAYER/$CURR_LAYER/g" ./tmp/$(echo $JMETER_CONFIG | cut -d / -f3)"
   sed -i "s/TEST_THREAD_DELAY/$TEST_THREAD_DELAY/g" ./tmp/$JMETER_CONF_FNAME
   sed -i "s/TEST_THREAD_DURATION/$TEST_THREAD_DURATION/g" ./tmp/$JMETER_CONF_FNAME
   
   #echo "Running load test for $CURR_LAYER on $NEW_HOST_URL"
   echo "$JMETER_BIN -n -t ./tmp/$JMETER_CONF_FNAME -l ./tmp/results.$COUNT.csv"
   echo $f &>> ./tmp/performance.$COUNT.log
   $JMETER_BIN -n -t ./tmp/$JMETER_CONF_FNAME -l ./tmp/results.$COUNT.csv &>> ./tmp/performance.$COUNT.log
   COUNT=$(($COUNT + 1))
done


#./jmeter -n -t ~/workspace/geoserver-performace-tests/saeon-geoserver-testing/geoserver-basic-new-8000_short.jmx -l ~/workspace/geoserver-performace-tests/results.csv

#TEST_HOST
#TEST_PORT
#TEST_LAYER

#mkdir ./tmp/
#cp $JMETER_CONFIG ./tmp/



