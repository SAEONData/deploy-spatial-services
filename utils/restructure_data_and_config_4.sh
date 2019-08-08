INST_4_DIR=/mnt/media2/geoservers_app01/GeoServer/Instance\ 4/data_dir

DEST_DATA_DIR=/mnt/media2/geoservers_app01/restructured/spatial-data/instance_4/
DEST_CONF_DIR=/mnt/media2/geoservers_app01/restructured/geoserver-config/instance_4/

for i in coverages data GEO SWDB
do
  #sudo cp -r $INST_1_DIR/$i $DEST_DATA_DIR  
  sudo cp -r "$INST_4_DIR/$i" $DEST_DATA_DIR
done

for i in demo global.xml gwc gwc-gs.xml layergroups logging.xml  logs palettes plugIns security styles user_projections validation wcs.xml wfs.xml wms.xml workspaces www
do
   sudo cp -r "$INST_4_DIR/$i" $DEST_CONF_DIR
done


