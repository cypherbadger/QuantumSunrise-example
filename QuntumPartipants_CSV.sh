#!/bin/bash

# Este script hace una solicitud POST a una API y guarda los resultados en un archivo CSV.
# Usa curl para hacer la solicitud y jq para transformar la respuesta JSON en CSV.

# Realizar la solicitud y convertir la respuesta
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your-KEY>" \
  -d '{"query":"{ raffleEntereds(first: 1000) { id participant_ raffleId_ } }"}' \
  "https://gateway-arbitrum.network.thegraph.com/api/<your-KEY>/subgraphs/id/55pRDYgB2cBDacz6WyUV643XXerK21s3vAfdLWsYdUzo" | jq -r '( .data.raffleEntereds[0] | keys_unsorted) as $keys | $keys, (.data.raffleEntereds[] | [.[$keys[]]])' | sed -e 's/\t/,/g' > output.csv

echo "Datos descargados y convertidos a CSV."
