INST_0_DIR=/mnt/media2/geoservers_app01/GeoServer/Instance\ 0/data_dir

DEST_DATA_DIR=/mnt/media2/geoservers_app01/restructured/spatial-data/instance_0/
DEST_CONF_DIR=/mnt/media2/geoservers_app01/restructured/geoserver-config/instance_0/

for i in BEA_II data GAPRV IAP META SAEON cam.tif GEO NGI SARVA validation ccam.txt DWA-RQS GEO_test HTML5
do
  #sudo cp -r $INST_0_DIR/$i $DEST_DATA_DIR  
  sudo cp -r "$INST_0_DIR/$i" $DEST_DATA_DIR
done

for i in global.xml user_projections wms.xml demo gwc layergroups workspaces geoserverdatadir.rar gwc-gs.xml logging.xml palettes security wcs.xml www coverages ESRI logs plugIns styles wfs.xml
do
   sudo cp -r "$INST_0_DIR/$i" $DEST_CONF_DIR
done


