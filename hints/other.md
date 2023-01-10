## Установить переменные окружения для нужной JVM
Можно использовать следующие скрипты, они запускают нужную JVM и MVN в текущей консоли на время сессии
- [java8](../scripts/set_env/java8_env.cmd)  
- [java11](../scripts/set_env/java11_env.cmd)
> В них не указываются  
> JDK_HOME  : %JAVA_HOME%  
> JRE_HOME  : %JAVA_HOME%\jre  
> 
> так же в некоторых случаях может понадобится указать CLASSPATH
> CLASSPATH : %JAVA_HOME%\lib;%JAVA_HOME%\jre\lib  
> > Примеры путей JAVA_HOME  
> > SET JAVA_HOME="C:\WrkPrFiles\JDK\java-se-8u41-ri"  
> > SET JAVA_HOME="C:\Users\Username\.IdeaIC2019.3\config\jdks\jbsdk8xxxx_windows_x64"  
> > SET JAVA_HOME="C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2019.3.5\jbr"  
> > SET JAVA_HOME="C:\Program Files\Eclipse Adoptium\jdk-11.0.14.101-hotspot"   

## Вывести текущие переменные окружения
````
SET
SET | more //enables you to see the variables one page at a time, rather than the whole lot, or
SET > output.txt //list all to file output.txt
````

## очистить консоль
````
cls
````

## Страница man на винде
````
dir /?
cd /?
````

## Вывести содержимое каталога в консоль на винде
````
dir /s /b /o:gn
tree 
````

## Сменить кодовую страницу в консоле
````
chcp 65001
````

## управление сертификатами
````
certmgr.msc
````

## прибить все процессы java
````
taskkill /f /im jqs.exe
taskkill /f /im javaw.exe
taskkill /F /im java.exe
````

## управление планировщиком на винде
In the search box on your taskbar, enter Task Scheduler and open the app.  
In the left pane, expand Task Scheduler Library > Microsoft > Windows, and then scroll down and select the Windows Defender folder.  
In the top center pane, double-click Windows Defender Scheduled Scan.  

--------------------------------------

# Полезные странички со SOF и прочих ресурсов
- [Разница Mokito when/doReturn](https://stackoverflow.com/a/29394497)
- 
