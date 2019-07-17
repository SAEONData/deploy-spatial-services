GEOSERVER_DATA_DIR=$1

grep -R "BEEH" $GEOSERVER_DATA_DIR/workspaces/SAED/ | cut -d ":" -f1 | sort | uniq | while read -r item
do

  sed -i "s/<entry key=\"namespace\">BEEH<\/entry>/<entry key=\"namespace\">SAED<\/entry>/g" $item
  #echo "$item"
done

grep -R "<entry key=\"namespace\">SAEON</entry>" $GEOSERVER_DATA_DIR/workspaces/SAED/ | cut -d ":" -f1 | sort | uniq | while read -r item
do

  sed -i "s/<entry key=\"namespace\">SAEON<\/entry>/<entry key=\"namespace\">SAED<\/entry>/g" $item
  echo "$item"
done

grep -R "<entry key=\"namespace\">SAED</entry>" $GEOSERVER_DATA_DIR/workspaces/PROFILER/ | cut -d ":" -f1 | sort | uniq | while read -r item
do
  sed -i "s/<entry key=\"namespace\">SAED<\/entry>/<entry key=\"namespace\">http:\/\/\/app01.saeon.ac.za<\/entry>/g" $item
  echo "$item"
done

