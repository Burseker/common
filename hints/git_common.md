## [Content](../contents.md)

# Работа с ветками

## Наиболее частые операции
[основы работы с ветвлением](https://git-scm.com/book/ru/v2/%D0%92%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Git-%D0%9E%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-%D0%B2%D0%B5%D1%82%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B8-%D1%81%D0%BB%D0%B8%D1%8F%D0%BD%D0%B8%D1%8F)
- Тянем изменения из репозитория
````
git fetch
git fetch origin
````
- Тянем изменения из репозитория по локальной ветке и срезу мерджим их в локальную ветку
````
git pull
//это эквивалентно
git fetch origin
git merge --ff-only targetBranch
````
- Сброс ветки к состоянию до изменений
````
git reset --hard HEAD
git reset --hard branchName
````
- Создаем ветку
````
git branch <branchName>
````
- Переключаемся на ветку
````
git checkout <branchName>
````
- Создаем ветку и сразу переключаемся на неё
````
git checkout -b <branchName>
````
- Коммитим изменения
````
git commit -a -m 'text of new commit'
````
- добавить файлы в индекс
````
git add <file>...
````
- добавить файлы в индекс
````
git add <file>...
git add . //add all
````
- Восстановить недобавленные в индекс файлы
````
git restore <file>...
````
- Убрать файлы из индекса
````
git restore --staged <file>...
````
- [Удалить неиндексированные файлы](https://koukia.ca/how-to-remove-local-untracked-files-from-the-current-git-branch-571c6ce9b6b1)
````
git clean -n //показывает, что будет удалено,  но не удаляет
git clean -f //удаляет, то что показал git clean -n 
git clean -nd //показать не только файлы но и каталоги
````

## Tags
[official](https://git-scm.com/book/en/v2/Git-Basics-Tagging)  
[stackovf](https://stackoverflow.com/questions/5195859/how-do-you-push-a-tag-to-a-remote-repository-using-git)

- Создаем тэг
````
git tag tag_name
````
- Проверяем наличие тэга
````
git tag
````
- Отправляем таг в репу
````
git push origin <tag_name>
````
- Отправляем все тэги разом
````
git push --tags <remote>
# Or
git push <remote> --tags
````


## Stash
[Информация по теме](https://www.atlassian.com/ru/git/tutorials/saving-changes/git-stash)  
[Офф дока рус.](https://git-scm.com/book/ru/v2/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D1%8B-Git-%D0%9F%D1%80%D0%B8%D0%BF%D1%80%D1%8F%D1%82%D1%8B%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%BE%D1%87%D0%B8%D1%81%D1%82%D0%BA%D0%B0)  
[Смотрим что лежит в stash](https://jeka.by/ask/231/git-stash-information/)
- команда откладывания кода
````
git stash
````
- листинг отложенных изменений
````
  git stash list
  git stash list -p             //с выводом diff
  git stash show -p stash@{0}   //с выводом diff по конкретному stash  
````
- Применить изменения(stash остается в сохраненных)
````
  git stash apply
  git stash apply stash@{0}
````
- Применить изменения и удалить stash из сохраненных
````
  git stash pop
  git stash pop stash@{0}
````
- Очистка stash
````
  git stash drop
  git stash drop stash@{0}
````

## Merge
- Мердж текущей ветки с указанной в команде
````
  git merge origin/develop
````
- Мердж текущей ветки с указанной в команде, мердж будет сделан, только если не требуется слияния файлов.
````
  git merge --ff-only origin/develop
````


## Squash
[годная статья по слепке](https://medium.com/nuances-of-programming/%D0%BA%D0%B0%D0%BA-%D1%81%D0%B6%D0%B8%D0%BC%D0%B0%D1%82%D1%8C-%D0%BA%D0%BE%D0%BC%D0%BC%D0%B8%D1%82%D1%8B-%D0%B2-git-%D1%81-%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D1%8C%D1%8E-git-squash-8a84b9f62734)  
[офф дока](https://git-scm.com/book/ru/v2/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D1%8B-Git-%D0%9F%D0%B5%D1%80%D0%B5%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C-%D0%B8%D1%81%D1%82%D0%BE%D1%80%D0%B8%D0%B8)  
[почти офф дока](https://www.git-tower.com/learn/git/faq/git-squash)  
[то же самое, с небольшим дополнением](https://htmlacademy.ru/blog/git/how-to-squash-commits-and-why-it-is-needed)  
- Слепляем три последних коммита от HEAD. Откроется окно со списком слепляемых коммитов, меняем pick->squash для тех
коммитов, которые мы хотим слепить. Верхний(он же последний) коммит оставляем с командой pick, таким образом коммиты,
отмеченные как squash будут слеплены в один.  
После потребуется ввести сообщение для нового коммита, по умолчанию git предложит вариант где он использует все
сообщения из слепленных коммитов.  
Для того чтобы взять только сообщение из оставшегося с командой pick коммита, забираем коммиты командой pick->fixup  
У каждой команды есть краткая форма squash(s), fixup(f). Данная инфа есть в подсказке файла со слепляемыми коммитами
````
  git rebase -i HEAD~3
````
- Применение сжатия при слиянии ветвей
  Следующая комманда берет все коммиты из целевой ветви, сжимает их и сохраняет все изменения в текущей ветви.
Затем вы можете зафиксировать все изменения в одном коммите.
````
  git checkout develop
  git merge --squash target_branch_name
````

## Rebase
[documentation](https://git-scm.com/docs/git-rebase)  
when on topic:
````
      A---B---C topic
     /
D---E---F---G master
````
From this point, the result of either of the following commands:
````
git rebase master
git rebase master topic
````
would be:
````
              A'--B'--C' topic
             /
D---E---F---G master
````
## Создание ветки
[Официальная дока](https://git-scm.com/docs/git-branch)
- Просто создаем неотслеживаемую ветку
````
git branch new_branch
````
- Создаем неотслеживаемую ветку и сразу переходим на неё
````
git checkout -b new_branch
````
- Ветка может быть отслеживаемой. Ключ --track, настраивает ветку на мердж с отслеживаемой веткой из репозитория
и еще ряд упрощений. Статус трекинга показывает команда `git branch`, так же инфа есть в `git status`
````
git branch --track new_branch origin/new_branch 
````
- можно создать ветку из удаленной ветки, задав новое имя или используя имя удаленной ветки, но сперва нужно загрузить
информацию о репозитории. [Подробнее](https://shisho.dev/blog/posts/git-checkout-remote-branch/)
````
git fetch && git checkout [branch_name]
````
- Более точный вариант
````
git fetch origin branch_name
git checkout branch_name
````
- Еще вариант создания одноименной с удаленной отслеживаемой ветки
````
git checkout --track origin/new_branch 
````



## Стирание локальной или удаленной ветки

[стековерфлоу по теме](https://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-locally-and-remotely)

Дальнейшее описание сводится к двум командам
````
git push -d <remote_name> <branchname>
git branch -d <branchname>
````

### Delete Local Branch

 - The -d option is an alias for --delete, which only deletes the branch if it has already been fully merged in its upstream branch.
````
git branch -d <branchname>
````

- The -D option is an alias for --delete --force, which deletes the branch "irrespective of its merged status."
````
git branch -D <branchname>
````

### Delete Remote Branch


- As of Git v1.7.0, you can delete a remote branch using
````
git push <remote_name> --delete <branch_name>
````

- which might be easier to remember than
````
git push <remote_name> :<branch_name>
````


## Создание PATCH
https://stackoverflow.com/questions/5159185/create-a-git-patch-from-the-uncommitted-changes-in-the-current-working-directory
- which might be easier to remember than
````
# for current diff
git diff > mypatch.patch
# uncomminetted
git diff --cached > mypatch.patch
# comminetted
git diff HEAD~commit_count > name.patch
# or
git format-patch HEAD~<N>
````

- You can later apply the patch:
````
git apply mypatch.patch
````


# Работа с логом

# ignored files
- [SOF docs](https://stackoverflow.com/questions/466764/git-command-to-show-which-specific-files-are-ignored-by-gitignore)
- list ignored files  
`git status --ignored`  
`git clean -ndX`  
- remove ignored files  
`git clean -fdX` 
