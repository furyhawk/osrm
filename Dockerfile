FROM ghcr.io/project-osrm/osrm-backend:v5.27.1

WORKDIR /data

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

RUN curl http://download.geofabrik.de/asia/malaysia-singapore-brunei-latest.osm.pbf --output sgmy-latest.osm.pbf

RUN osrm-extract -p /opt/car.lua sgmy-latest.osm.pbf

RUN osrm-contract sgmy-latest.osrm

CMD ["osrm-routed", "--algorithm", "ch", "--max-table-size", "10000", "--port", "80", "sgmy-latest.osrm"]