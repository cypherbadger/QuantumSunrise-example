#!/bin/bash

# Este script hace una solicitud POST a una API y guarda los resultados en un archivo CSV.
# Usa curl para hacer la solicitud y jq para transformar la respuesta JSON en CSV.

# Realizar la solicitud
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer [tu-api-key]" \
  -d '{"query":"{ raffleEntereds(first: 1000) { id participant_ raffleId_ } }"}' \
  "https://gateway-arbitrum.network.thegraph.com/api/[tu-api-key]/subgraphs/id/55pRDYgB2cBDacz6WyUV643XXerK21s3vAfdLWsYdUzo"
