#!/bin/bash

# Uso: ./Open_ports.sh <host> <port_start> <port_finish>
# Ejemplo: ./Open_ports.sh 127.0.0.1 1 65535
# Asegúrate de tener instalado netcat (nc) para ejecutar este script.
# Asegúrate de tener permisos de ejecución: chmod +x Open_ports.sh

host=$1
port_start=$2
port_finish=$3

total_ports=$((port_finish - port_start + 1))
current=0

# Lista para puertos abiertos
open_ports=()

for ((port=port_start; port<=port_finish; port++)); do
  # Escaneo del puerto
  if nc -z -w1 "$host" "$port" 2>/dev/null; then
    open_ports+=("$port")
  fi

  # Actualizar barra de progreso
  current=$((current + 1))
  percent=$((current * 100 / total_ports))
  filled=$((percent / 2))
  bar=$(printf '%0.s#' $(seq 1 $filled))
  printf "\rProgreso: [%-50s] %d%%" "$bar" "$percent"
done

echo -e "\n\nPuertos abiertos encontrados:"
for port in "${open_ports[@]}"; do
  echo "Puerto $port abierto"
done
