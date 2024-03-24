### [Content](../contents.md)

-----------------------------


# Scala basic

- https://www.baeldung.com/scala/classes-objects
- https://docs.scala-lang.org/tour/singleton-objects.html
- https://docs.scala-lang.org/tour/classes.html

## sbt

Собрать проект на скале можно сборщиком sbt, он мультиплатформенный, позволяет создавать проекты на разных языках:
- scala
- java
- javaScript

интерпретатор sbt запускается командой 
`sbt` дальше можно собирать весь проект или подпроекты, используя следующие команды:
```sbt
projects // отобразить список проектов

project projectName // переключиться на подпроект

dependencyTree // дерево зависимостей
inspect tree compile // дерево зависимостей
inspect tree clean // дерево зависимостей

clean // очистить текущий проект
сompile // собрать текущий проект
projectName/compile // собрать проект projectName
projectName/cucumber --name "Regexp for scenario name" // запустить плагин кукумбер для сценариев подходящих по регулярке
projectName/cucumber --tags @tagName // запустить плагин кукумбер для тэгов
projectName/cucumber --help //запустить справку плагина
```