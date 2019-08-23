RESULTS_DIR=../test_results/2019-08-23_home/

echo "layer; spatialsv_res; app0_res"
for k in 0 2 3 5 6 7 9
do
#echo "Instance $k"
  for f in `ls $RESULTS_DIR/spatialsv/instance$k/perf*`
  do
     fname=$(basename $f)
     #spatial_sv_result=$( )
     spatial_sv_res=$(cat $f | grep "summary = " | cut -d ":" -f3 | cut -d = -f2)
     s_len=$(cat $f | grep "summary = " | wc | cut -d " " -f7)
     if [ $s_len == 2 ]
     then
        #echo $spatial_sv_res
	spatial_sv_res=$(echo $spatial_sv_res | cut -d " " -f3)
     else
	spatial_sv_res=$(echo $spatial_sv_res | cut -d " " -f1)
     fi
     app01_res=$(cat $RESULTS_DIR/app01/instance$k/$fname | grep "summary = " | cut -d ":" -f3 | cut -d = -f2)
     #head -1 $f
     a_len=$(cat $RESULTS_DIR/app01/instance$k/$fname |grep "summary = " | wc | cut -d " " -f7)
     if [ $a_len == 2 ]
     then
       app01_res=$(echo $app01_res | cut -d " " -f3)
     else
       app01_res=$(echo $app01_res | cut -d " " -f1)
     fi
     layer=$(head -1 $f)
     spatial_sv_num=$(echo $spatial_sv_res | cut -d / -f1) 
     app01_num=$(echo $app01_res | cut -d / -f1)
     #echo "$spatial_sv_num -  $app01_res "
     #diff=$(awk '{print $1 - $2}' <<<"${spatia_sv_res} ${app01_res}") 
     echo "$layer; $spatial_sv_num; $app01_num"
     #bash get_result.sh $f
  done
done

#head -1 $RESULT_SUMMARY_FILE
#cat $RESULT_SUMMARY_FILE | grep "summary = " | cut -d ":" -f3 | cut -d = -f2

