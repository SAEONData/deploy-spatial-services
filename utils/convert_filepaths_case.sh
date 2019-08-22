INPUT_DIR=$1

old_folders=""
#for f in `find $INPUT_DIR/ -type f`
find $INPUT_DIR -type f -print0 | while IFS= read -r -d '' f;
do
    dir=$( dirname $f)
    if [ "$dir" != "." ]; then
        #echo $dir
        lower_case_dir=$(echo $dir | awk '{print tolower($0)}')
	lower_case_file=$(echo $f | awk '{print tolower($0)}')
	#echo $lower_case_dir
	#echo $lower_case_file

	if [ ! -d "$lower_case_dir" ]; then
	    echo "Creating dir \n $lower_case_dir"
	    mkdir -p $lower_case_dir
	    old_folders="$old_folders $dir"
        fi
	echo "Coping $f to $lower_case_file"
	echo $f
	cp "$f" "$lower_case_file"
	echo "\n"

    fi    
done


#echo "removing $INPUT_DIR"
#rm -rf $INPUT_DIR


#$echo "GEOSS/SARVA/UGEP_dry.tif" | awk '{print tolower($0)}'i
