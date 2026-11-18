@echo off
cd /d "%~dp0"
echo == Trayendo cambios de GitHub (commit de Databricks) ==
git pull --no-edit
echo.
echo == Subiendo parcial3, .gitignore y este script ==
git add .gitignore parcial3 subir_cambios.bat
git commit -m "Parcial 3: notebook PySpark y script de setup"
git push
echo.
echo == Ultimos commits ==
git log --oneline -5
echo.
pause
