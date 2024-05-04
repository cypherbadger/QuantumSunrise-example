# QuantumSunrise-example
QuantumFair is an on-chain raffle primitive. This repository contains code examples that demonstrate how to view participants in real-time from your shell. These scripts are designed to help developers and enthusiasts understand how to interact with on-chain raffles using command line tools such as curl and jq.


# Documentación para la Interacción con The Graph API y QuantumFair

Este repositorio proporciona instrucciones detalladas para interactuar con The Graph API utilizando `curl` y para transformar respuestas JSON en archivos CSV utilizando `jq`. Este método es ideal para desarrolladores y entusiastas de blockchain que buscan automatizar la extracción y manipulación de datos on-chain desde la línea de comandos.

## Requisitos Previos

Antes de comenzar, asegúrate de tener instalados los siguientes componentes en tu sistema:

- **curl**: Una herramienta de línea de comandos para realizar solicitudes HTTP.
- **jq**: Una herramienta de línea de comandos ligera y flexible para manipular JSON.

Para sistemas basados en Debian/Ubuntu, puedes instalar estos componentes usando:

```bash
sudo apt update
sudo apt install curl jq

## Configuración de la API

Para interactuar con The Graph API, necesitarás una clave API válida. Esta clave te permite autenticarte y realizar solicitudes a los subgrafos disponibles en The Graph. Reemplaza `[tu-api-key]` con tu clave personal en los comandos proporcionados.

## Ejemplos de Uso

### 1. Solicitar Datos con Curl

Este comando `curl` realiza una solicitud POST para obtener datos de eventos de entrada a rifas (`raffleEntereds`) desde un subgrafo específico en The Graph, utilizando información de los contratos de QuantumFair, un proyecto que emplea The Graph como su principal capa de información:

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer [tu-api-key]" \
  -d '{"query":"{ raffleEntereds(first: 1000) { id participant_ raffleId_ } }"}' \
  "https://gateway-arbitrum.network.thegraph.com/api/[tu-api-key]/subgraphs/id/55pRDYgB2cBDacz6WyUV643XXerK21s3vAfdLWsYdUzo"


### 2. Convertir JSON a CSV

Después de recibir la respuesta JSON, este comando utiliza `jq` para transformarla en formato CSV, facilitando el análisis y la visualización de los datos. El script asume una estructura de JSON con un array de objetos:

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer [tu-api-key]" \
  -d '{"query":"{ raffleEntereds(first: 1000) { id participant_ raffleId_ } }"}' \
  "https://gateway-arbitrum.network.thegraph.com/api/[tu-api-key]/subgraphs/id/55pRDYgB2cBDacz6WyUV643XXerK21s3vAfdLWsYdUzo" | jq -r '( .data.raffleEntereds[0] | keys_unsorted) as $keys | $keys, (.data.raffleEntereds[] | [.[$keys[]]])' | sed -e 's/\t/,/g' > output.csv


## Sobre QuantumFair

[QuantumFair](https://www.quantumfair.com/) es un primitivo protocolo para rifas on-chain que utiliza la aleatoriedad proporcionada por API3 QRNG. Este proyecto utiliza The Graph como la principal capa de información para acceder y manejar datos on-chain de forma eficiente.

