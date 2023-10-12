### [Content](../contents.md)

-----------------------------

# Полезные Библиотеки и репозитории

## Проверка корректности кодировки скрипта
- https://unix.stackexchange.com/questions/27054/bin-bash-no-such-file-or-directory
Проверяем что выводит первая строка  
`head -1 yourscript | od -c`  
должно быть так: `0000000   #   !   /   b   i   n   /   b   a   s   h  \n`  
чиним файл при необходимости  
`sed -i '1s/^.*#//;s/\r$//' brokenScript`

## Полные гайды по bash
- https://habr.com/ru/companies/ruvds/articles/325522/
- https://habr.com/ru/articles/726316/
- https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/

## Вывод данных в консоль и файлы
- https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file
- https://unix.stackexchange.com/questions/695906/prepare-shell-script-for-output-to-file-and-console
- https://stackoverflow.com/questions/15045946/write-to-custom-log-file-from-a-bash-script
- https://stackoverflow.com/questions/418896/how-to-redirect-output-to-a-file-and-stdout

````
          || visible in terminal ||   visible in file   || existing
  Syntax  ||  StdOut  |  StdErr  ||  StdOut  |  StdErr  ||   file   
==========++==========+==========++==========+==========++===========
    >     ||    no    |   yes    ||   yes    |    no    || overwrite
    >>    ||    no    |   yes    ||   yes    |    no    ||  append
          ||          |          ||          |          ||
   2>     ||   yes    |    no    ||    no    |   yes    || overwrite
   2>>    ||   yes    |    no    ||    no    |   yes    ||  append
          ||          |          ||          |          ||
   &>     ||    no    |    no    ||   yes    |   yes    || overwrite
   &>>    ||    no    |    no    ||   yes    |   yes    ||  append
          ||          |          ||          |          ||
 | tee    ||   yes    |   yes    ||   yes    |    no    || overwrite
 | tee -a ||   yes    |   yes    ||   yes    |    no    ||  append
          ||          |          ||          |          ||
 n.e. (*) ||   yes    |   yes    ||    no    |   yes    || overwrite
 n.e. (*) ||   yes    |   yes    ||    no    |   yes    ||  append
          ||          |          ||          |          ||
|& tee    ||   yes    |   yes    ||   yes    |   yes    || overwrite
|& tee -a ||   yes    |   yes    ||   yes    |   yes    ||  append
````

[Пример использования tee](../scripts/bash/tee_wrapper.sh)

## Добавляем дату к файлу логирования
- https://www.cyberciti.biz/faq/unix-linux-appleosx-bsd-shell-appending-date-to-filename/
- https://stackoverflow.com/questions/1795678/append-date-to-filename-in-linux
- https://unix.stackexchange.com/questions/278939/how-do-you-put-date-and-time-in-a-file-name

[Пример добавления даты](../scripts/bash/tee_wrapper.sh)