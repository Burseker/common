@echo off

@call mvn clean install -f module1/pom.xml -P STUB-MODE
if %ERRORLEVEL% equ 0 (echo --======== No error found ==========--) ELSE goto exitdoor

@call mvn clean install -f module2/pom.xml -P STUB-MODE
if %ERRORLEVEL% equ 0 (echo --======== No error found ==========--) ELSE goto exitdoor

@call mvn clean install -f module3/pom.xml -P STUB-MODE
if %ERRORLEVEL% equ 0 (echo --======== No error found ==========--) ELSE goto exitdoor

:exitdoor
exit /b 1