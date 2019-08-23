for i in  5 6 7 9
do
  echo "app01"
  bash run-load-tests_app01.sh ../test-input-layer-lists/instance$i.list
  mkdir ../test_results/2019-08-23_home/app01/instance$i
  cp ./tmp/* ../test_results/2019-08-23_home/app01/instance$i 
  echo "new"
  bash run-load-tests.sh ../test-input-layer-lists/instance$i.list
  mkdir ../test_results/2019-08-23_home/spatialsv/instance$i
  cp ./tmp/* ../test_results/2019-08-23_home/spatialsv/instance$i
  echo $i
done
