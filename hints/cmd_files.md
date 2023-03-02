### [Content](../contents.md)

-----------------------------

# Информация о написании скриптов .cmd

### Работа в переменными окружения в скрипт файлах, команда `setlocal`
https://ab57.ru/cmdlist/setlocal.html  
https://learn.microsoft.com/ru-ru/windows-server/administration/windows-commands/setlocal  

### Модификаторы пути к файлу
https://www.cyberforum.ru/post3852672.html  

````
@echo off
echo            Без кавычек : %~1 
echo     Полное имени файла : %~f1
echo       Только имя диска : %~d1
echo    Только путь к файлу : %~p1
echo       Только имя файла : %~n1
echo Расширение имени файла : %~x1
echo     Путь в формате 8.3 : %~s1
echo               Атрибуты : %~a1
echo    Даты /времени файла : %~t1
echo          Размера файла : %~z1
echo               Венегрет : %~ztasxnpdf1
pause
````
Модификаторы можно объединять.
Те же правила используются внутри цикла, например:
````
@echo off
for /F "delims=" %%A in ('dir c:\windows\media\*.wav /b /s') do (
  echo Имя файла с расширением : %%~nxA
)
pause
````
`%1, %2.... %*` - это значения, передаваемые батнику как аргумент.  
Знак ~ означает что из значения будут удалены обрамляющие кавычки.

`%0` это имя самого батника.  

`~dp` это модификатор, который преобразует адрес файла в формат D - диск, P - путь, т.е. Диск:\путь\

### pushd/popd
`pushd` - это аналог CD /D - перехода в указанный каталог с дополнительным функционалом: 
если в коде позже написать команду `popd` - то произойдет переход в папку, в которой мы 
находились до момента использования команды pushd (как, Вы правильно заметили pushd запоминает 
путь к предыдущему каталогу).


# Примеры скриптов

[скрипт запуска нескольких команд maven](../scripts/bunch-mvn-script.cmd)  