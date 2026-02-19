#!/usr/bin/env bash

set -e

pacman-db-upgrade
pacman -Qqn | pacman -D --asdeps -
