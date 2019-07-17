GEOSERVER_DATA_DIR=$1

grep -R "CGS" $GEOSERVER_DATA_DIR/workspaces/FORESTRY/ | cut -d ":" -f1 | while read -r item
do

  sed -i "s/CGS/FORESTS/g" $item
  echo "$item"
done

sed -i "s/CFG/cfg/g" $GEOSERVER_DATA_DIR/workspaces/CGS/saghos_nickel/coveragestore.xml

