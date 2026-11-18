# Prepara PySpark (Python 3.12) y ejecuta el notebook U5_1 de NYC Taxi.
# Uso (PowerShell, desde la raiz del repo big-data):
#   powershell -ExecutionPolicy Bypass -File .\parcial3\U3_3_probabilidad_estadistica\scr\setup_pyspark.ps1

$ErrorActionPreference = "Stop"
$repo   = (Resolve-Path "$PSScriptRoot\..\..\..").Path
$venv   = Join-Path $repo ".venv-spark"
$nb     = Join-Path $repo "parcial3\U3_3_probabilidad_estadistica\notebooks\U5_1_preparation_pyspark_NYC_taxi.ipynb"
$log    = Join-Path $repo "parcial3\U3_3_probabilidad_estadistica\outputs\setup_pyspark.log"

Start-Transcript -Path $log -Force | Out-Null
try {
    Write-Host "== 1. Java ==" -ForegroundColor Cyan
    cmd /c "java -version 2>&1"

    Write-Host "== 2. Entorno Python 3.12 (.venv-spark) ==" -ForegroundColor Cyan
    if (-not (Test-Path "$venv\Scripts\python.exe")) { py -3.12 -m venv $venv }
    $py = "$venv\Scripts\python.exe"
    & $py --version

    Write-Host "== 3. Instalando paquetes ==" -ForegroundColor Cyan
    & $py -m pip install --upgrade pip --quiet
    & $py -m pip install pyspark pyarrow ipykernel nbconvert --quiet
    if ($LASTEXITCODE -ne 0) { throw "Fallo pip install" }
    & $py -c "import pyspark, pyarrow; print('PySpark', pyspark.__version__, '| PyArrow', pyarrow.__version__)"

    Write-Host "== 4. Kernel de Jupyter 'Python 3.12 (PySpark)' ==" -ForegroundColor Cyan
    & $py -m ipykernel install --user --name pyspark312 --display-name "Python 3.12 (PySpark)"

    Write-Host "== 5. Variables de entorno para Spark ==" -ForegroundColor Cyan
    # Evita el error 'Python worker failed to connect back' en Windows
    [Environment]::SetEnvironmentVariable("PYSPARK_PYTHON", $py, "User")
    [Environment]::SetEnvironmentVariable("PYSPARK_DRIVER_PYTHON", $py, "User")
    $env:PYSPARK_PYTHON = $py
    $env:PYSPARK_DRIVER_PYTHON = $py

    Write-Host "== 6. Ejecutando el notebook completo ==" -ForegroundColor Cyan
    & $py -m jupyter nbconvert --to notebook --execute --inplace `
        --ExecutePreprocessor.kernel_name=pyspark312 `
        --ExecutePreprocessor.timeout=900 $nb
    if ($LASTEXITCODE -ne 0) { throw "El notebook termino con error (revisa arriba)" }

    Write-Host "`nLISTO: el notebook corrio sin errores y quedo guardado con sus salidas." -ForegroundColor Green
}
catch {
    Write-Host "`nERROR: $_" -ForegroundColor Red
}
finally {
    Stop-Transcript | Out-Null
}
