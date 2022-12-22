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
"git restore --staged <file>...
````

## Stash


## Merge


## Rebase



## Создание ветки


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

# Работа с логом