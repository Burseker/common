## [Content](../contents.md)

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

## установка кодировок в JVM
Для нормального восприятия кодировок ставим переменную окружения jvm в Build Tool>Maven>Runner>VM Options
JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8

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

## replace clrf to cl with git-bash  
https://stackoverflow.com/questions/11929461/how-can-i-run-dos2unix-on-an-entire-directory  
````
git ls-files -z | xargs -0 dos2unix
````

## зачищаем мавен библиотеки от мусора
это линукс команда, но она нормально выполняется из git-bash
````
find ~/.m2 -name *.lastUpdated -delete
````

## доступ к удаленной папке
````
cd \\Keenetic_giga\DATA
````

## можно форматировать JSON строку в консоли с помощь python утилиты json.tool
`type` - prints file to stream  
`python -m json.tool` - prettyed this
````
type applicationParam1.json | python -m json.tool
````

## управление планировщиком на винде
In the search box on your taskbar, enter Task Scheduler and open the app.  
In the left pane, expand Task Scheduler Library > Microsoft > Windows, and then scroll down and select the Windows Defender folder.  
In the top center pane, double-click Windows Defender Scheduled Scan.  

## установка дополнительных сертификатов в JVM
полезные статьи по теме  
- https://discuss.gradle.org/t/download-wrapper-fails-with-sslhandshakeexception-stacktrace/32719
- https://www.baeldung.com/jvm-certificate-store-errors
- https://medium.com/expedia-group-tech/how-to-import-public-certificates-into-javas-truststore-from-a-browser-a35e49a806dc
- https://docs.oracle.com/cd/E19509-01/820-3503/6nf1il6er/index.html
- https://stackoverflow.com/questions/48401120/intellij-gradle-sync-fails-behind-corporate-proxy

Используем для этого утилиту keytool
[official docs](https://docs.oracle.com/cd/E19509-01/820-3503/6nf1il6er/index.html)  
Добавим нужные сертификаты в существующее хранилище сертификатов, поставляемое с JVM  
Пример пути до хранилища `C:\Program Files\Eclipse Adoptium\jdk-11.0.14.101-hotspot\lib\security\cacerts`  
Копируем хранилище, а затем модифицируем(добавляя нужные сертификаты) с помощью утилиты keytool
````
keytool -list -h   //помощь по команде
keytool -list -v -keystore cacerts -storepass changeit
keytool -list -keystore cacerts -storepass changeit > C:\projects\TEMP\sertslist.txt
````
можно создать своё хранилище ключей или воспользоваться существующим
````
keytool -keystore <enter name> -genkey -alias client            //create keystore
keytool -list -keystore clientkeystore -storepass changeit      //list sertificates
//add trust sertificates
keytool -import -file C:\projects\SERT\RootCa.cer -alias ZScalerRootCa -keystore clientkeystore
keytool -import -file C:\projects\SERT\RootCa.cer -alias ZScalerRootCa -keystore clientkeystore -storepass changeit
````
посмотреть сертификаты, которые есть в системе можно с помощью вин утилиты `certmgr.msc`  
для запуска JVM с нужным кейстором устанавливаем ключ jvm в Build Tool>Maven>Runner>VM Options
````
-Djavax.net.ssl.trustStore="C:\projects\SERT\cacerts"
-Djavax.net.ssl.trustStorePassword=changeit
````
(инфа по теме https://maven.apache.org/guides/mini/guide-repository-ssl.html)  
как вариант, это можно сделать в идее или в общих настройках мавен.

При возникновении проблем с сертификатами на этапе сборщика пакетов для мониторинга процесса, ставим в jvm опцию
````
-Djavax.net.debug=all
gradlew -Djavax.net.debug=all //запуск градла со снифом всех коннектов
````
При работе с **gradle** сертификаты можно подпихнуть в gradlew.bat
````
set DEFAULT_JVM_OPTS="-Xmx64m" "-Xms64m" "-Djavax.net.ssl.trustStore=C:\projects\SERT\cacerts" "-Djavax.net.ssl.trustStorePassword=changeit"
````
второй и лучший вариант добавления сертов через USER_HOME/.gradle/gradle.properties (файл должен быть в UTF-8, без BOM, разделители путей обязательно /)
````
systemProp.javax.net.ssl.trustStore=C:/projects/SERT/cacerts
systemProp.javax.net.ssl.trustStorePassword=changeit
````
--------------------------------------

# Полезные странички со SOF и прочих ресурсов
- [Разница Mokito when/doReturn](https://stackoverflow.com/a/29394497)
- [Функциональные интерфейсы java8](https://www.baeldung.com/java-8-functional-interfaces)
- [MD5 calculate](https://mkyong.com/java/java-md5-hashing-example/)

--------------------------------------

# Hibernate and JPA
- https://docs.spring.io/spring-data/jpa/docs/current/reference/html/
- https://stackoverflow.com/questions/36112451/multiple-repositories-for-the-same-entity-in-spring-data-rest
- https://www.baeldung.com/jpa-indexes
- https://java-online.ru/hibernate-entities.xhtml
- 