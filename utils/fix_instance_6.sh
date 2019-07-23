GEOSERVER_DATA_DIR=$1

#remove wfs.xml

#grep -R "DefaultEngineeringCRS" $GEOSERVER_DATA_DIR/workspaces/ | cut -d ":" -f1 | sort | uniq | while read -r item
#do 
#    sed -i "s/Cartesian/DefaultCartesianCS/g" "$item"
#    echo "$item"
#done


grep -R "StyleInfoImpl-7e703c0f:154337e246f:-7fe7" workspaces`

comment out following in all results from above

  <!-- <styles class="linked-hash-set">
    <style>
      <id>StyleInfoImpl-7e703c0f:154337e246f:-7fe7</id>
    </style>
  </styles> -->

