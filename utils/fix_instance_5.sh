GEOSERVER_DATA_DIR=$1


for i in `echo "00 02 03 04 05 06 09 10"`
do 
  echo $GEOSERVER_DATA_DIR/workspaces/WP0$i/
  grep -R "BEA" $GEOSERVER_DATA_DIR/workspaces/WP$i/ | cut -d ":" -f1 | sort | uniq | while read -r item
    do

        sed -i "s/<entry key=\"namespace\">BEA<\/entry>/<entry key=\"namespace\">WP$i<\/entry>/g" $item
        #echo "s/<entry key=\"namespace\">BEA<\/entry>/<entry key=\"namespace\">WP0$i<\/entry>/g"
        echo "$item"
    done
done


