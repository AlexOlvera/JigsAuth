@echo off
echo.
echo ╔══════════════════════════════════════╗
echo ║     JigsAuth — Setup Completo       ║
echo ╚══════════════════════════════════════╝
echo.

:: Verificar Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js no esta instalado.
    echo Descargalo de: https://nodejs.org/
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do echo [OK] Node.js %%i detectado

:: Instalar dependencias raiz
echo.
echo [1/4] Instalando dependencias raiz...
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Fallo la instalacion raiz.
    pause
    exit /b 1
)

:: Instalar dependencias del servidor
echo.
echo [2/4] Instalando dependencias del servidor...
cd server
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Fallo la instalacion del servidor.
    pause
    exit /b 1
)
cd ..

:: Instalar dependencias del cliente
echo.
echo [3/4] Instalando dependencias del cliente...
cd client
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] Fallo la instalacion del cliente.
    pause
    exit /b 1
)
cd ..

:: Crear archivo .env del servidor si no existe
if not exist server\.env (
    echo.
    echo [4/4] Creando archivo .env del servidor...
    echo PORT=3001> server\.env
    echo FIREBASE_PROJECT_ID=jigsauth-demo>> server\.env
)

echo.
echo ╔══════════════════════════════════════╗
echo ║     Instalacion completada!         ║
echo ╠══════════════════════════════════════╣
echo ║  Ejecuta: npm run dev               ║
echo ║                                      ║
echo ║  Client: http://localhost:5173       ║
echo ║  Server: http://localhost:3001       ║
echo ╚══════════════════════════════════════╝
echo.
pause
