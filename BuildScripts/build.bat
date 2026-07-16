@echo off
setlocal enabledelayedexpansion

for /f "tokens=2 delims==" %%a in ('findstr "^id=" module.prop') do set MODID=%%a
for /f "tokens=2 delims==" %%a in ('findstr "^version=" module.prop') do set MODVER=%%a

set DATE=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
set OUTFILE=%MODID%-%MODVER%-%DATE%.zip

if exist "%OUTFILE%" del "%OUTFILE%"

if "%1" neq "" (
  %1 a -mx=9 -tzip "%OUTFILE%" META-INF module.prop customize.sh sepolicy.rule files -bso0 -bsp0
) else if "%ZIPPER%" neq "" (
  %ZIPPER% a -mx=9 -tzip "%OUTFILE%" META-INF module.prop customize.sh sepolicy.rule files -bso0 -bsp0
) else (
  echo Usage: build.bat [path\to\7z.exe]
  echo Or set ZIPPER environment variable
  exit /b 1
)

echo Built: %OUTFILE%
