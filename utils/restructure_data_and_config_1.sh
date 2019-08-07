INST_1_DIR=/mnt/media2/geoservers_app01/GeoServer/Instance\ 1/data_dir

DEST_DATA_DIR=/mnt/media2/geoservers_app01/restructured/spatial-data/instance_1/
DEST_CONF_DIR=/mnt/media2/geoservers_app01/restructured/geoserver-config/instance_1/

for i in coverages data GEO uploaded Uploader_test
do
  #sudo cp -r $INST_1_DIR/$i $DEST_DATA_DIR  
  sudo cp -r "$INST_1_DIR/$i" $DEST_DATA_DIR
done

for i in demo global.xml gwc gwc-gs.xml layergroups logging.xml logs palettes plugIns security styles user_projections validation wcs.xml wfs.xml wms.xml  workspaces www 
do
   sudo cp -r "$INST_1_DIR/$i" $DEST_CONF_DIR
done


