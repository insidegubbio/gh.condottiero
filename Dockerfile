FROM eclipse-temurin:21-jre AS build
WORKDIR /data
RUN apt-get update && apt-get install -y wget

RUN wget https://download.geofabrik.de/europe/italy/centro-latest.osm.pbf -O data.osm.pbf

RUN wget https://repo1.maven.org/maven2/com/graphhopper/graphhopper-web/10.0/graphhopper-web-10.0.jar -O graphhopper-web.jar

COPY config.yml ./
RUN java -Xmx6g -jar graphhopper-web.jar import config.yml

FROM eclipse-temurin:21-jre
WORKDIR /data
COPY --from=build /data/graph-cache ./graph-cache
COPY --from=build /data/graphhopper-web.jar ./
COPY config.yml .
EXPOSE 7860
CMD ["java", "-Xmx2g", "-jar", "graphhopper-web.jar", "server", "config.yml"]
