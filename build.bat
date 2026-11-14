@echo off
setlocal
where java >nul 2>nul || (echo Java 21 is required.& exit /b 1)
java -version
where gradle >nul 2>nul || (echo Gradle 8.x is required. Install Gradle and add it to PATH.& exit /b 1)
gradle --version
gradle clean build
if errorlevel 1 exit /b 1
echo.
echo Build output: build\libs\autobuilderplus-client-0.3.0.jar
endlocal
