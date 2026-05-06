@echo off
echo.
echo ╔══════════════════════════════════════╗
echo ║     JigsAuth — Iniciando...         ║
echo ╚══════════════════════════════════════╝
echo.
echo   Server: http://localhost:3001
echo   Client: http://localhost:5173
echo   Vault:  http://localhost:5173/vault
echo   Browser: http://localhost:5173/browser
echo.
echo   DEV: usa start-dev.bat o agrega ?dev a la URL
echo.
echo   Presiona Ctrl+C para detener.
echo.

call npm run dev
