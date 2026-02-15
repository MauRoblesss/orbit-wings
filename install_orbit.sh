#!/bin/bash

set -e

echo "Deteniendo Wings..."
systemctl stop wings || true

echo "Descargando Wings personalizado..."
curl -L -o /usr/local/bin/wings https://raw.githubusercontent.com/MauRoblesss/orbit-wings/main/wings
chmod +x /usr/local/bin/wings

echo "Iniciando Wings..."
systemctl start wings

echo "Instalando Nginx..."
if command -v apt >/dev/null 2>&1; then
    apt update -y
    apt install -y nginx
elif command -v dnf >/dev/null 2>&1; then
    dnf install -y nginx
elif command -v yum >/dev/null 2>&1; then
    yum install -y nginx
fi

echo "Creando carpeta /srv/server_certs/ ..."
mkdir -p /srv/server_certs/

echo "Listo 🚀"
