#!/bin/bash

# Caminho para o diretório de origem e destino
SRC="build/web/assets/assets"
DEST="build/web/assets"

# Mover tudo, exceto a pasta 'fonts'
find "$SRC" -mindepth 1 -maxdepth 1 ! -name "fonts" -exec cp -R {} "$DEST" \;
