### [Content](../contents.md)

-----------------------------

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

## Git
#### Проверка текущей конфигурации git
https://stackoverflow.com/questions/12254076/how-do-i-show-my-global-git-configuration
````
git config --list
git config --list --show-origin    //Вариант с источником настройки
````
#### [set tortisemerge tool](https://devstuffs.wordpress.com/2013/03/08/setting-tortoisegitmerge-in-msysgit-as-the-git-mergetool/)
````
git config --global merge.tool tortoisemerge
//or
git config --global mergetool.tortoisemerge.cmd '"C:/Program Files/TortoiseGit/bin/TortoiseGitMerge.exe" -base:"$BASE" -theirs:"$REMOTE" -mine:"$LOCAL" -merged:"$MERGED"'
````
#### Ставим Notepad++ как редактор гита
https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-set-Notepad-as-the-default-Git-editor-for-commits-instead-of-Vim
````
git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
````

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





