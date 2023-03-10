## [Content](../../contents.md)

Описание проекта fs-indexer
-----------------------------

Самый базовый слой бэк системы hip_hub. Работает в фоне, шуршит по ФС индексирует все файлы в пределах указанных папок.  
Находит повторы. Складирует хэши в локальную базу. ~~*Возможно будет шардируемым микросервисом в распределенной системе  
но это совсем не точно.*~~

В будущем логично будет накрутить на него авторизацию к примеру через java token.

## Список полезных проектов
- [Библиотека индексации файлов lucene](https://lucene.apache.org/core/index.html)
- [Библиотека индексации файлов Tika](https://tika.apache.org/)
- ссылки по хэшированию и индексации файлов
  - https://www.makeuseof.com/tag/free-hash-checkers-file-integrity/
  - https://www.glasswire.com/blog/2020/05/20/3-simple-ways-to-check-a-files-hash-with-windows/

-----------------------------

## Заметки

### Получение события об изменении файловой системы 
Есть [хорошая статья](https://www.baeldung.com/java-nio2-watchservice) про отслеживание изменений в ФС.
[Проект с примерами](https://github.com/eugenp/tutorials/tree/master/core-java-modules/core-java-nio-2), описанными в
статье и еще различные примеры по nio2. 

Есть [официальная дока](https://docs.oracle.com/javase/tutorial/essential/io/notification.html) по данной либе.
В последнем пункте говориться о том, что либа НЕ ПРЕДНАЗНАЧЕНА для индексации дискового пространства, т.к. не все 
файловые системы имеют механизм оповещения об изменении файлов и если механизма нет, то либа реализует свои функции
путем опроса страниц ФС. С другой стороны утверждается, что либа по возможности использует этот механизм, если он всё
же есть.

### Обход дерева файлов
- https://docs.oracle.com/javase/tutorial/essential/io/walk.html
- https://habr.com/ru/post/437694/
- http://it.kgsu.ru/JA_OS/ja_os110.html
- https://habr.com/ru/post/457042/

  [Проект с примерами](https://github.com/eugenp/tutorials/tree/master/core-java-modules/core-java-nio-2), описанными в
  статье и еще различные примеры по nio2.
### NoSQL базы
Интересный проект по NoSQL DB это [MongoDB](https://ru.wikipedia.org/wiki/MongoDB). Возможно использовать его как полную
замену хранилищу данных в ОС. Хотя в первой итерации нужно посмотреть, как себя будет вести индексатор и сможет ли он
справиться с большим количеством файлов и папок, если да то можно будет не городить костылей и оставить это для
серверного варианта с возможность работы с гораздо большими объемами данных.

### Полезные статьи про индексацию файлов
- https://www.baeldung.com/java-path-vs-file
- Не очень полезная, потому что про python, но по теме, [статья](https://habr.com/ru/post/140649/). В комментариях много
всяких рассуждений про слежку за ФС.

### Всякое
- [асинхронный запуск объекта в Spring](https://stackoverflow.com/questions/46888314/proper-way-to-start-new-thread-from-service-layer-using-spring)
- [checksum](https://www.baeldung.com/java-md5-checksum-file)
- [checksum 2](https://stackoverflow.com/questions/304268/getting-a-files-md5-checksum-in-java)
- [подключение h2 repository](https://www.baeldung.com/spring-boot-h2-database)
- [конфигурация h2 для хранения в файле](https://stackoverflow.com/questions/43470295/how-to-store-h2-database-file-into-project-directory)
-----------------------------

Название
-----------------------------
- **fs-watchdog**
- file-indexer
- fs-scanner
- fs-watchdog-scanner
- fs-indexer