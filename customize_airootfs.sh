#!/usr/bin/env bash

set -e

# Limpiar base de datos completamente corrupta
rm -rf /var/lib/pacman/local/*

# Forzar rebuild de la BD
pacman-db-upgrade

# Sincronizar metadatos
pacman -Qqn | pacman -D --asdeps -

# Limpiar cache
pacman -Sc --noconfirm