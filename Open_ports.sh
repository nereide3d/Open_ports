#!/bin/bash

host=$1
port_start=$2
port_finish=$3

total_ports=$((port_finish - port_start + 1))
current=0

for ((port=port_start; port<=port_finish; port++)); do
  # Verificar si el puerto está abierto
  nc -z -w1 "$host" "$port" 2>/dev/null && echo "Puerto $port abierto"

  # Actualizar progreso
  current=$((current + 1))
  percent=$((current * 100 / total_ports))
  printf "\rProgress: [%-50s] %d%%" $(printf '#%.0s' $(seq 1 $((percent / 2)))) $percent
done

echo -e "\nScan Complete."
# Uso: ./Open_ports.sh <host> <port_start> <port_finish>
# Ejemplo: ./Open_ports.sh 127.0.0.1 1 65535
# Asegúrate de tener instalado netcat (nc) para ejecutar este script.
# Asegúrate de tener permisos de ejecución: sudo chmod +x Open_ports.sh