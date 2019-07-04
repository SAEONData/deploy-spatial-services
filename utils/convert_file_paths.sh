GEOSERVER_DATA_DIR=$1

echo "Converting paths in styles ..."
grep -R "<filename>" $GEOSERVER_DATA_DIR/styles/ | while read -r item
do
    filename=$(echo $item | cut -d "<" -f1 | cut -d : -f1)
    original=$(echo $item | cut -d "<" -f2 | cut -d ">" -f2)
    converted=$(echo $original | sed 's/\\/\\\//g')
    original=$(echo $original | sed 's/\\/\\\\/g')

    #echo "sed -i "s/$original/$converted/g" "$filename""
    sed -i "s/$original/$converted/g" "$filename"
done

echo "Converting paths in workspace ..."
grep -R ">file:" $GEOSERVER_DATA_DIR/workspaces/ | while read -r item
do
    filename=$(echo $item | cut -d "<" -f1 | cut -d : -f1)
    original=$(echo $item | cut -d "<" -f2 | cut -d ">" -f2)
    converted=$(echo $original | sed 's/\\/\\\//g')
    original=$(echo $original | sed 's/\\/\\\\/g')

    sed -i "s/$original/$converted/g" "$filename"
    #echo "sed -i "s/$original/$converted/g" "$filename""
    #echo $filename
    #echo $original
    #echo "$item"
done



