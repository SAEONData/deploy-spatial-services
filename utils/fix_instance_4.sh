GEOSERVER_DATA_DIR=$1


for f in `find $GEOSERVER_DATA_DIR/workspaces/DEA_CARBON_II/LADA* -name "datastore.xml"`
do 
    sed -i "s/http:\/\/GEO/DEA_CARBON_II/g" $f
    cat $f | grep namespace
done

sed -i "s/http:\/\/GEO/DEA_CARBON_II/g" $GEOSERVER_DATA_DIR/workspaces/DEA_CARBON_II/GULLY_EROSION/datastore.xml

sed -i "s/http:\/\/GEO/DEA_Carbon/g" $GEOSERVER_DATA_DIR/workspaces/DEA_Carbon/Biomes_Shapefile/datastore.xml

