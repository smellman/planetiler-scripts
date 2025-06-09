#!/usr/bin/env bash
set -e
#java -Xmx24g \
#  -jar planetiler.jar \
java -Xmx137g \
  `# return unused heap memory to the OS` \
  -XX:MaxHeapFreeRatio=40 \
  -jar planetiler.jar \
  `# Download the latest planet.osm.pbf from s3://osm-pds bucket` \
  --area=planet --bounds=world --download \
  `# Accelerate the download by fetching the 10 1GB chunks at a time in parallel` \
  --download-threads=10 --download-chunk-size-mb=1000 \
  --mbtiles=data/output.mbtiles \
  `# Store temporary node locations in memory` \
  --nodemap-type=array --nodemap-storage=ram 2>&1 | tee logs.txt
