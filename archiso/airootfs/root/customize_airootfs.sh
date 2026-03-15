#!/usr/bin/env bash

set -e

# Forzar rebuild de la BD
pacman-db-upgrade

# Sincronizar metadatos
pacman -Qqn | pacman -D --asdeps -

# Limpiar cache
pacman -Sc --noconfirm
