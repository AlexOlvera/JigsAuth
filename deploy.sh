#!/bin/bash
set -e

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     JigsAuth — Deploy               ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "  [1] Docker (docker-compose up)"
echo "  [2] Build local (sin Docker)"
echo "  [3] Preparar para Vercel + Railway"
echo ""
read -p "Elige una opción (1/2/3): " choice

case $choice in
  1)
    echo ""
    echo "[Docker] Construyendo y levantando contenedores..."
    docker-compose up --build -d
    echo ""
    echo "App corriendo en Docker!"
    echo "  Client: http://localhost:8080"
    echo "  Server: http://localhost:3001"
    echo "  Para detener: docker-compose down"
    ;;
  2)
    echo ""
    echo "[Build] Compilando servidor..."
    cd server && npx tsc && cd ..
    echo "[OK] Servidor compilado en server/dist/"
    echo ""
    echo "[Build] Compilando cliente..."
    cd client && npm run build && cd ..
    echo "[OK] Cliente compilado en client/dist/"
    ;;
  3)
    echo ""
    echo "=== SERVIDOR (Railway / Render) ==="
    echo "  Root directory: server"
    echo "  Build: npm install && npx tsc"
    echo "  Start: node dist/index.js"
    echo "  Env: PORT=3001"
    echo ""
    echo "=== CLIENTE (Vercel) ==="
    echo "  Root directory: client"
    echo "  Framework: Vite"
    echo "  Build: npm run build"
    echo "  Output: dist"
    echo "  Env: VITE_SERVER_URL=https://tu-server.railway.app"
    ;;
esac
