#!/bin/bash

# --- RUN UBUNTU CONTAINER WITH ALL DEPENDENCIES INSTALLED ---
docker run --rm -it \
  --platform=linux/amd64 \
  -v "$PWD":/app \
  -w /app \
  ubuntu:22.04 \
  bash -c "
    echo '==> Mise à jour du système'
    apt-get update >/dev/null 2>&1

    echo '==> Installation de gcc, make, nasm'
    apt-get install -y build-essential nasm make >/dev/null 2>&1

    echo '==> Environnement prêt !'
    echo 'Tu peux maintenant faire : make, ./Sully, ./Colleen, ./Grace'
    bash
  "
