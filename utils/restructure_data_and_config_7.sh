INST_7_DIR=/mnt/media2/geoservers_app01/GeoServer/Instance\ 7/data_dir

DEST_DATA_DIR=/mnt/media2/geoservers_app01/restructured/spatial-data/instance_7/
DEST_CONF_DIR=/mnt/media2/geoservers_app01/restructured/geoserver-config/instance_7/

for i in coverages data
do
  #sudo cp -r $INST_1_DIR/$i $DEST_DATA_DIR  
  #echo "$INST_6_DIR/$i"
  sudo cp -r "$INST_7_DIR/$i" $DEST_DATA_DIR
done

for i in demo global.xml gwc gwc-gs.xml layergroups logging.xml logs palettes plugIns security styles uploaded user_projections validation wcs.xml wfs.xml wms.xml workspaces www
do   
   sudo cp -r "$INST_7_DIR/$i" $DEST_CONF_DIR
done


