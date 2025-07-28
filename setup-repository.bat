@echo off
echo ============================================
echo   PLInvBatch Repository Setup Script
echo ============================================
echo.

REM Check if git is available
git --version > nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

echo Git is available. Proceeding with repository setup...
echo.

REM Initialize git repository if not already initialized
if not exist ".git" (
    echo Initializing Git repository...
    git init
    echo.
) else (
    echo Git repository already initialized.
    echo.
)

REM Add .gitignore if not already added
if not exist ".gitignore" (
    echo ERROR: .gitignore file not found!
    echo Please ensure .gitignore file exists before running this script.
    pause
    exit /b 1
)

echo Adding files to Git...
git add .

echo.
echo Checking git status...
git status

echo.
echo Ready to commit. The following commit message will be used:
echo.
echo "Initial commit: VB6 to C# migration complete"
echo.
echo "- Migrated PLInvBatch from Visual Basic 6.0 to C# .NET 8.0"
echo "- Preserved all original functionality and processing modes"  
echo "- Enhanced error handling and logging"
echo "- Added comprehensive documentation"
echo "- Maintained COM interop with PLInvBus.dll"
echo.

set /p confirm="Proceed with commit? (y/n): "
if /i "%confirm%" neq "y" (
    echo Commit cancelled.
    pause
    exit /b 0
)

echo.
echo Creating initial commit...
git commit -m "Initial commit: VB6 to C# migration complete

- Migrated PLInvBatch from Visual Basic 6.0 to C# .NET 8.0
- Preserved all original functionality and processing modes
- Enhanced error handling and logging
- Added comprehensive documentation
- Maintained COM interop with PLInvBus.dll"

echo.
echo Commit created successfully!
echo.

echo ============================================
echo   Next Steps:
echo ============================================
echo.
echo 1. Create a repository on your Git hosting service:
echo    - GitHub: https://github.com/new
echo    - Azure DevOps: https://dev.azure.com
echo    - GitLab: https://gitlab.com/projects/new
echo.
echo 2. Repository name: "Upgraded-PLInvBatch"
echo.
echo 3. Add remote origin and push:
echo    git remote add origin [YOUR_REPOSITORY_URL]
echo    git branch -M main
echo    git push -u origin main
echo.
echo 4. Create version tag:
echo    git tag -a v1.0.0 -m "Initial VB6 to C# migration complete"
echo    git push origin --tags
echo.
echo See REPOSITORY_SETUP.md for detailed instructions.
echo.
pause