@echo off
@REM Устанавливаем путь для JDK
set "PATH=C:\WrkPrFiles\JDK\java-se-8u41-ri\bin;%PATH%"
@REM Необязательно но тоже можно
set "JAVA_HOME=C:\WrkPrFiles\JDK\java-se-8u41-ri"

@REM Устанавливаем путь для MAVEN
set "PATH=c:\Users\uname\.m2\wrapper\dists\apache-maven-3.5.4-bin\jl1qqhdeineh9qg83dtj7i91c\apache-maven-3.5.4\bin;%PATH%"

@REM Устанавливаем кодировку файлов, используемых и поставляемых Java инструментарием в UTF-8
set "JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8"