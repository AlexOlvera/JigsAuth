@echo off
echo.
echo ╔══════════════════════════════════════╗
echo ║     JigsAuth — Deploy               ║
echo ╚══════════════════════════════════════╝
echo.
echo   [1] Docker (docker-compose up)
echo   [2] Build local (sin Docker)
echo   [3] Preparar para Vercel + Railway
echo.

set /p choice="Elige una opcion (1/2/3): "

if "%choice%"=="1" goto docker
if "%choice%"=="2" goto local
if "%choice%"=="3" goto cloud
goto end

:docker
echo.
echo [Docker] Construyendo y levantando contenedores...
docker-compose up --build -d
echo.
echo ╔══════════════════════════════════════╗
echo ║  App corriendo en Docker!           ║
echo ║  Client: http://localhost:8080      ║
echo ║  Server: http://localhost:3001      ║
echo ║                                      ║
echo ║  Para detener: docker-compose down  ║
echo ╚══════════════════════════════════════╝
goto end

:local
echo.
echo [Build] Compilando servidor...
cd server
call npx tsc
echo [OK] Servidor compilado en server/dist/
cd ..

echo.
echo [Build] Compilando cliente...
cd client
call npm run build
echo [OK] Cliente compilado en client/dist/
cd ..

echo.
echo ╔══════════════════════════════════════╗
echo ║  Build completado!                  ║
echo ║                                      ║
echo ║  Server: cd server ^&^& node dist/index.js  ║
echo ║  Client: cd client ^&^& npm run preview     ║
echo ╚══════════════════════════════════════╝
goto end

:cloud
echo.
echo [Cloud] Preparando para deployment...
echo.
echo === SERVIDOR (Railway / Render) ===
echo   1. Crea un proyecto en railway.app o render.com
echo   2. Conecta tu repositorio de GitHub
echo   3. Root directory: server
echo   4. Build command: npm install ^&^& npx tsc
echo   5. Start command: node dist/index.js
echo   6. Variables de entorno:
echo      PORT=3001
echo      FIREBASE_PROJECT_ID=jigsauth-demo
echo.
echo === CLIENTE (Vercel) ===
echo   1. Crea un proyecto en vercel.com
echo   2. Conecta tu repositorio de GitHub
echo   3. Root directory: client
echo   4. Framework preset: Vite
echo   5. Build command: npm run build
echo   6. Output directory: dist
echo   7. Environment variable:
echo      VITE_SERVER_URL=https://tu-server.railway.app
echo.
echo === ALTERNATIVA: Todo en uno con Railway ===
echo   Usa el docker-compose.yml directamente en Railway.
echo.

:end
pause
