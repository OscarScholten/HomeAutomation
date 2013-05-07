#/bin/bash

. $1

IFS='|'
let "linecount=0"

cat $ha_conf | while read line; do
  let "linecount++"
  parts=($line)
  if [ ${#parts[@]} -eq 3 ]; then
    today=`date +%Y-%m-%d`
    timestamp=`date +%H:%M`
    outputfile="$ha_outputfolder/$today-${parts[0]}"
    $ha_home/bin/testhost.sh ${parts[2]} $timestamp >> $outputfile
  else
    echo "Error on line $linecount, does not contain 3 parts, skipping."
  fi
done
