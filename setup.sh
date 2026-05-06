#!/bin/bash
set -e

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     JigsAuth — Setup Completo       ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo "[ERROR] Node.js no está instalado."
    echo "Descárgalo de: https://nodejs.org/"
    exit 1
fi

echo "[OK] Node.js $(node -v) detectado"

# Instalar dependencias
echo ""
echo "[1/4] Instalando dependencias raíz..."
npm install

echo ""
echo "[2/4] Instalando dependencias del servidor..."
cd server && npm install && cd ..

echo ""
echo "[3/4] Instalando dependencias del cliente..."
cd client && npm install && cd ..

# Crear .env si no existe
if [ ! -f server/.env ]; then
    echo ""
    echo "[4/4] Creando archivo .env del servidor..."
    cat > server/.env << EOF
PORT=3001
FIREBASE_PROJECT_ID=jigsauth-demo
EOF
fi

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     Instalación completada!         ║"
echo "╠══════════════════════════════════════╣"
echo "║  Ejecuta: npm run dev               ║"
echo "║                                      ║"
echo "║  Client: http://localhost:5173       ║"
echo "║  Server: http://localhost:3001       ║"
echo "╚══════════════════════════════════════╝"
echo ""
