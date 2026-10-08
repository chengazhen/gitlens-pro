@echo off
chcp 65001 >nul
setlocal
pushd "%~dp0.." || exit /b 1

:: Create the output directory if needed.
if not exist bin mkdir bin || goto build_failed

:: Windows
set GOOS=windows
set GOARCH=amd64
go build -o bin\activate.exe || goto build_failed

:: Linux
set GOOS=linux
set GOARCH=amd64
go build -o bin\activate || goto build_failed

:: macOS (Intel)
set GOOS=darwin
set GOARCH=amd64
go build -o bin\activate_mac_amd64 || goto build_failed

:: macOS (Apple Silicon)
set GOOS=darwin
set GOARCH=arm64
go build -o bin\activate_mac_arm64 || goto build_failed

echo Build completed. Output directory: "%CD%\bin"

popd
pause
exit /b 0

:build_failed
echo Build failed. See the error above.
popd
pause
exit /b 1
