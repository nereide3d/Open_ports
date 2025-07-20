#!/bin/bash

host=$1
port_start=$2
port_finish=$3

for ((port=port_start; port<=port_finish; port++)); do
## Check if the port is open 
  ## If the port is closed, the command do not output anything
  nc -z -w1 "$host" "$port" 2>/dev/null && echo "Puerto $port abierto"
 
done