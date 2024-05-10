#!/usr/bin/env bash
set -e
java -Xmx30g \
  -jar planetiler.jar \
  `# Download the latest planet.osm.pbf from s3://osm-pds bucket` \
  --area=planet --bounds=world --download \
  `# Accelerate the download by fetching the 10 1GB chunks at a time in parallel` \
  --download-threads=10 --download-chunk-size-mb=1000 \
  --mbtiles=output.mbtiles \
  --nodemap-type=array --nodemap-storage=mmap 2>&1 | tee logs.txt
