# Generate Planet Vector Tile

## requirements

- docker
- wget and aria2c
- md5sum

## usage

```bash
git clone https://github.com/smellman/planetiler-scripts.git
cd planetiler-scripts
mkdir -p data/sources
cd data/sources
wget https://planet.openstreetmap.org/pbf/planet-240624.osm.pbf.md5
aria2c https://planet.openstreetmap.org/pbf/planet-240624.osm.pbf.torrent
# check md5sum
mv planet-240624.osm.pbf planet.osm.pbf
cd ../..
./runworld-docker.sh
```
