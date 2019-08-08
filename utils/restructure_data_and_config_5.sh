INST_5_DIR=/mnt/media2/geoservers_app01/GeoServer/Instance\ 5/data_dir

DEST_DATA_DIR=/mnt/media2/geoservers_app01/restructured/spatial-data/instance_5/
DEST_CONF_DIR=/mnt/media2/geoservers_app01/restructured/geoserver-config/instance_5/

for i in BEA_III coverages data MODEL2 postgres
do
  #sudo cp -r $INST_1_DIR/$i $DEST_DATA_DIR  
  sudo cp -r "$INST_5_DIR/$i" $DEST_DATA_DIR
done

for i in demo global.xml gwc gwc-gs.xml layergroups logging.xml logs palettes plugIns security styles user_projections validation wcs.xml wfs.xml wms.xml workspaces www
do
   sudo cp -r "$INST_5_DIR/$i" $DEST_CONF_DIR
done

