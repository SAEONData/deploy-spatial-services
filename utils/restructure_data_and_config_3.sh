INST_3_DIR=/mnt/media2/geoservers_app01/GeoServer/Instance\ 3/data_dir

DEST_DATA_DIR=/mnt/media2/geoservers_app01/restructured/spatial-data/instance_3/
DEST_CONF_DIR=/mnt/media2/geoservers_app01/restructured/geoserver-config/instance_3/

for i in bin.zip data coverages
do
  #sudo cp -r $INST_1_DIR/$i $DEST_DATA_DIR  
  sudo cp -r "$INST_3_DIR/$i" $DEST_DATA_DIR
done

for i in global.xml gwc-gs.xml logging.xml palettes security uploaded validation wfs.xml workspaces demo gwc layergroups logs plugIns styles user_projections wcs.xml wms.xml www
do
   sudo cp -r "$INST_3_DIR/$i" $DEST_CONF_DIR
done


