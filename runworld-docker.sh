#!/usr/bin/env bash
set -e
#java -Xmx24g \
#  -jar planetiler.jar \
docker run -e JAVA_TOOL_OPTIONS="-Xmx24g" -u `id -u`:`id -g` -v "$(pwd)/data":/data ghcr.io/onthegomap/planetiler:0.8.4 \
  -Xmx24g \
  `# Download the latest planet.osm.pbf from s3://osm-pds bucket` \
  --area=planet --bounds=world --download \
  `# Accelerate the download by fetching the 10 1GB chunks at a time in parallel` \
  --download-threads=10 --download-chunk-size-mb=1000 \
  --mbtiles=data/output.mbtiles \
  --nodemap-type=array --nodemap-storage=mmap 2>&1 | tee logs.txt
