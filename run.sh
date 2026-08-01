#!/bin/bash
# CarbOn’u yerel docker olarak çalıştırma scripti
docker build -t carbon-app .
docker run -d -p 8000:8000 --name carbon-container --env-file .env carbon-app
