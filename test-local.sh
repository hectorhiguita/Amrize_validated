#!/bin/bash

# Script para probar el build local del contenedor
# Este script te permite probar localmente antes de hacer push

echo "🐳 Construyendo imagen Docker localmente..."

# Build de la imagen
docker build -t amrize-local:latest .

if [ $? -eq 0 ]; then
    echo "✅ Imagen construida exitosamente!"
    
    echo "🚀 Ejecutando contenedor en puerto 8080..."
    echo "📱 Podrás acceder en: http://localhost:8080"
    echo "⏹️  Para detener: Ctrl+C"
    echo ""
    
    # Ejecutar el contenedor
    docker run --rm -p 8080:80 --name amrize-test amrize-local:latest
else
    echo "❌ Error al construir la imagen"
    exit 1
fi
