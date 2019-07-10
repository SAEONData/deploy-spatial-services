GEOSERVER_DATA_DIR=$1
HOST_IP="192.168.110.101"
original="<entry key=\"host\">localhost<\/entry>"
converted="<entry key=\"host\">$HOST_IP<\/entry>"

echo $original
echo $converted

grep -R "PostGIS" $GEOSERVER_DATA_DIR/workspaces/ | while read -r item
do
    file=$(echo $item | cut -d ':' -f1)
    echo $file
    sed -i "s/$original/$converted/g" "$file"
done





#<entry key="host">localhost</entry>

#geoserver-data/data_dir/workspaces/CONTEXT/INFRASTRUCTURE/datastore.xml:    <entry key="passwd">postgres</entry>

#geoserver-data/data_dir/workspaces/CONTEXT/HYDROGRAPHY/datastore.xml:    <entry key="passwd">postgres</entry>

#geoserver-data/data_dir/workspaces/CONTEXT/ADMINISTRATIVE/datastore.xml:    <entry key="passwd">postgres</entry>

#geoserver-data/data_dir/workspaces/BLA/BLA/datastore.xml:    <entry key="user">postgres</entry>


#sed -i "s/$original/$converted/g" "$filename"
