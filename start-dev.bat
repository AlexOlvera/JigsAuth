@echo off
echo.
echo ╔══════════════════════════════════════╗
echo ║     JigsAuth — DEV MODE             ║
echo ╠══════════════════════════════════════╣
echo ║  Solver v5 visualization enabled    ║
echo ║  Add ?dev to any URL for config     ║
echo ╚══════════════════════════════════════╝
echo.
echo   Server: http://localhost:3001
echo   Client: http://localhost:5173
echo   Vault:  http://localhost:5173/vault?dev
echo.
echo   DEV features:
echo     - Solver thread visualization
echo     - Prim MST electricity animation
echo     - Splatoon region coloring
echo     - Integrity play test (DFS+BFS)
echo.
echo   Presiona Ctrl+C para detener.
echo.

call npm run dev
