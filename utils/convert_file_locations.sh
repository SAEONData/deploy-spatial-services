GEOSERVER_DATA_DIR=$1
REPLACEMENT="\/mnt\/data_dir\/"

echo "Converting default file locations to $REPLACEMENT in workspace ..."
grep -R ">file:" $GEOSERVER_DATA_DIR/workspaces/ | while read -r item
do
    filename=$(echo $item | cut -d "<" -f1 | cut -d : -f1)
    #echo $filename
    converted=$(echo $item | sed "s/file:/file:\/\/$REPLACEMENT/g")
    #echo $converted

    sed -i "s/file:/file:\/\/$REPLACEMENT/g" "$filename"
done

