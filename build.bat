@echo off
echo Building PLInvBatch C# Application...

REM Check if .NET SDK is available
dotnet --version > nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: .NET SDK is not installed or not in PATH
    echo Please install .NET 8.0 SDK or later
    pause
    exit /b 1
)

echo Restoring NuGet packages...
dotnet restore
if %errorlevel% neq 0 (
    echo ERROR: Failed to restore packages
    pause
    exit /b 1
)

echo Building application...
dotnet build --configuration Release
if %errorlevel% neq 0 (
    echo ERROR: Build failed
    pause
    exit /b 1
)

echo Build completed successfully!
echo.
echo To publish for deployment, run:
echo dotnet publish --configuration Release --self-contained true --runtime win-x64
echo.
pause