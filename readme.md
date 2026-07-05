---
title: gh.condottiero
emoji: 🏹
colorFrom: yellow
colorTo: red
sdk: docker
app_port: 7860
pinned: false
---

# gh.condottiero

Istanza di [GraphHopper](https://github.com/graphhopper/graphhopper) per il routing di [insidegubbio](https://github.com/insidegubbio), basata sugli script e le config di [gpx.studio](https://github.com/gpxstudio/gpx.studio), adattati per il centro italia e per l'hosting su Hugging Face Spaces.

## Differenze rispetto all'istanza originale di gpx.studio
Questa non è un'istanza a scala planetaria come quella di gpx.studio (2 server da 128GB RAM). È pensata per coprire solo Gubbio e l'Umbria, con requisiti di risorse molto più contenuti:

| | gpx.studio | gh.condottiero |
|---|---|---|
| Copertura | Mondo intero | Umbria / Centro Italia |
| Dati OSM | `planet-latest.osm.pbf` | estratto regionale (Geofabrik) |
| RAM import | ~100GB | 4-6GB |
| RAM servizio | 128GB×2 server | entro i limiti del tier gratuito HF Space |
| Elevazione | Mapterhorn | SRTM |
| Infrastruttura | Load balancer + health check | container singolo Docker su HF Space |

## Fonte dati

Estratto OSM: [Geofabrik – Italia, Centro](https://download.geofabrik.de/europe/italy.html)

## Profili di routing

Stessi profili dell'istanza originale (bike, racingbike, gravelbike, mtb, foot, motorbike), con lo stesso meccanismo di `custom_model` per escludere le strade private.
