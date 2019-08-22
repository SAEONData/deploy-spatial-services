INST_9_DIR=/mnt/media2/geoservers_app01/GeoServer/Instance\ 9/data_dir

DEST_DATA_DIR=/mnt/media2/geoservers_app01/restructured/spatial-data/instance_9/
DEST_CONF_DIR=/mnt/media2/geoservers_app01/restructured/geoserver-config/instance_9/

for i in coverages data README.rst
do
  #sudo cp -r $INST_1_DIR/$i $DEST_DATA_DIR  
  #echo "$INST_6_DIR/$i"
  sudo cp -r "$INST_9_DIR/$i" $DEST_DATA_DIR
done

for i in global.xml gwc-gs.xml layergroups logging.xml palettes styles validation wfs.xml workspaces csw.xml demo gwc gwc-layers legendsamples logs plugIns security user_projections  wcs.xml wms.xml www
do   
   sudo cp -r "$INST_9_DIR/$i" $DEST_CONF_DIR
done


