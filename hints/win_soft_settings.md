### [Content](../contents.md)

-----------------------------

# Отслеживание текущего состояния винды, полезные утилиты мониторинга

## Просмотр событий винды
Поиск -> "Просмотр событий"
> Тут можно найти бквально всё что происходит в системе

## Просмотр активности устройств
Диспетчер устройств

## Просмотр активности USB
Полезные утилиты:
- https://www.nirsoft.net/utils/usb_log_view.html
- https://www.nirsoft.net/utils/usb_devices_view.html

# Настройки для различного софта на windows

## Notepad++

Плагины

- JSON Viewer
- JSTools
- XML Tools

Переместить в соседнее окно `ctrl+~`  
Копировать в соседнее окно `ctrl+shift+~`

#### Логи в Notepad

[Подсветка логов](https://gist.github.com/mmdemirbas/3713724)  
[LogFile.udl.xml](../resources/settings/LogFile.udl.xml)  

## MarkText

https://github.com/marktext/marktext/releases
Софт для просмотра и редактирования файлов формата markdown

## Git

#### Проверка текущей конфигурации git

https://stackoverflow.com/questions/12254076/how-do-i-show-my-global-git-configuration

```
git config --list
git config --list --show-origin    //Вариант с источником настройки
```

#### [set tortisemerge tool](https://devstuffs.wordpress.com/2013/03/08/setting-tortoisegitmerge-in-msysgit-as-the-git-mergetool/)

```
git config --global merge.tool tortoisemerge
//or
git config --global mergetool.tortoisemerge.cmd '"C:/Program Files/TortoiseGit/bin/TortoiseGitMerge.exe" -base:"$BASE" -theirs:"$REMOTE" -mine:"$LOCAL" -merged:"$MERGED"'
```

#### Ставим Notepad++ как редактор гита

https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-set-Notepad-as-the-default-Git-editor-for-commits-instead-of-Vim

```
git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
```

## Idea

Editor->General->Editor Tabs

- show tabs in one row `false`
- show tabs in separate view `true`
- use small font labels `true`
- tab limit `20`
- [Починка дефолтной кодировки в IDEA](https://youtrack.jetbrains.com/issue/IDEA-276155/Unable-to-change-gradle-build-output-encoding)  
  Есть несколько путей задать кодировку по умолчанию в IDEA, самый надежный оказался   
    ```` Help->Edit custom VM Options-> -Dfile.encoding=UTF-8 ````  
  Так же этот параметр можно задать через конфигурацию запуска `Add VM Options-> -Dfile.encoding=UTF8`, но это сработало
  несколько криво(в консоли нормально не отображалась буква И).  
  А так же можно добавить опцию `-Dfile.encoding=UTF8` к gradlew.DEFAULT_JVM_OPTS, но нужно будет настраивать gradle запускаться через
  этот скрипт, для консольной сборки вариант тоже подходит

### Editorconfigs

- https://github.com/virgo47/javasimon/blob/master/.editorconfig

## ConEmu

[Связка Far-ConEmu](http://chuchuva.com/pavel/2012/07/far-manager-and-console-output/)

## Far manager

редактор Notepad++ по нажатию Alt+F4     

- F9->Options->System settings->Auto save setup->`x`
- F9->Options->Editor settings->`"c:\Program Files\Notepad++\notepad++.exe" "!\!.!"`
- F9->Options->Default Code page->`65001:utf-8`

[Горячие клавиши](https://cheatography.com/alexzaitzev/cheat-sheets/far-3/)

- Сохранить директорию в бд1  `ctrl+shift+1`  
- Выбрать директорию из бд1 `ctrl+1`  
- история команд `alt+F8`  
- история директорий `alt+f12`  
- история файлов `alt+f11`  
- 

## Chrome

## WSL on windows

Check the default distribution version

```
wsl -help
wsl --list --online
```

install default destrib with `wsl --install`
to install mc you need to enable the universe repository:

check repos   
`cat /etc/apt/sources.list`  
next update repos  
`sudo apt-get update`  
to install midnight commander  
`sudo apt install mc`  

install gnu comlpiller
`sudo apt install build-essential`
install lib boost
`sudo apt install libboost-all-dev`
install cmake
`sudo apt install cmake`

mkdir /somedir
cd /somedir
git clone https://github.com/lballabio/QuantLib.git
cd ./QuantLib/
mkdir build
cd build
cmake .. -D CMAKE_BUILD_TYPE=Release

## SMB settings

не рекомендуется использовать версию протокола smb ниже smb2, кроме того рекомендуют не использовать анонимного 
пользователя, а заводить пользователей под все виды деятельности

- https://winitpro.ru/index.php/2018/01/24/ne-otkryvayutsya-smb-papki-posle-ustanovki-windows-10-1709/
- https://zawindows.ru/%D0%BA%D0%B0%D0%BA-%D1%83%D0%BA%D0%B0%D0%B7%D0%B0%D1%82%D1%8C-%D0%B4%D1%80%D1%83%D0%B3%D0%BE%D0%B5-%D0%B8%D0%BC%D1%8F-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F-%D0%B8/
- https://it-tehnik.ru/windows10/set/vvod-setevyh-uchetnyh-dannyh-kak-ubrat.html

Выполняется из ``Win+r`` или из cmd  

- ``gpedit.msc``

- ``rundll32.exe keymgr.dll, KRShowKeyMgr``  - открывает список сохраненных имен пользователей и паролей
  
  #### net use
  
  [хорошая статья по теме net use](https://cmd4win.ru/administrirovanie-seti/upravlenie-setyu/68-net-use)  
  Для подключения из под конкретного пользака следует использовать утилиту net use, можно создать нужный диск с нужным пользователем.
  
  > Если работать из под консоли админа, то из эксплорера не будет видно подключенных папок

- ``net use`` - список существующих подключений

- ``net use \\<computer_name>\<folder_name> /USER:<user> <password> /PERSISTENT:NO`` - запуск из под конкретного пользака

- ``net use * /DEL`` - Удалить все подключения
