sudo apt update
sudo apt upgrade

#!/bin/bash

# --- RETO A: SCRIPT DE AUDITORÍA DE INTRUSOS ---

# Definición de variables para rutas de archivos
LOG_FILE="/var/log/auth.log"
REPORT_FILE="alertas.txt"

# Generar el encabezado del reporte con la fecha y hora actual
# El comando 'date' devuelve el momento exacto de la ejecución [8]

echo "REPORTE DE INTRUSIONES - Generado el: $(date)" >> $REPORT_FILE
echo "--------------------------------------------------" >> $REPORT_FILE

# Filtrar intentos fallidos y extraer información relevante
# 1. 'grep' busca las líneas con fallos de contraseña [4, 9]
# 2. 'awk' se usa aquí para imprimir las columnas de fecha, IP y usuario
FAILED_ATTEMPTS=$(sudo grep "Failed password" $LOG_FILE)

# Guardar los registros filtrados en el archivo de alertas
echo "$FAILED_ATTEMPTS" >> $REPORT_FILE

# Contar matemáticamente el número total de errores
# El comando 'wc -l' cuenta el número de líneas (intentos fallidos) [7]
TOTAL_ERRORS=$(echo "$FAILED_ATTEMPTS" | grep -v "^$" | wc -l)

# Añadir el resumen final al reporte
echo "" >> $REPORT_FILE
echo "RESUMEN FINAL:" >> $REPORT_FILE
echo "Se han detectado un total de $TOTAL_ERRORS intentos fallidos." >> $REPORT_FILE

# Informar al administrador por pantalla
echo "Reporte generado con éxito en $REPORT_FILE"