INST_6_DIR=/mnt/media2/geoservers_app01/GeoServer/Instance\ 6/data_dir

DEST_DATA_DIR=/mnt/media2/geoservers_app01/restructured/spatial-data/instance_6/
DEST_CONF_DIR=/mnt/media2/geoservers_app01/restructured/geoserver-config/instance_6/

for i in "BEA III" data coverages TEMP
do
  #sudo cp -r $INST_1_DIR/$i $DEST_DATA_DIR  
  #echo "$INST_6_DIR/$i"
  sudo cp -r "$INST_6_DIR/$i" $DEST_DATA_DIR
done

for i in global.xml gwc-gs.xml layergroups logs plugIns styles upload validation wfs.xml workspaces demo gwc gwc-gs.xml.tmp logging.xml palettes security user_projections wcs.xml wms.xml www
do   
   sudo cp -r "$INST_6_DIR/$i" $DEST_CONF_DIR
done


