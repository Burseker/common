# Различные подсказки, примеры использования git, ссылки и мои варианты конфигураций




## Редкие но иногда полезные операции

### Удаление файла из истории и из всех коммитов(не работает на initial commit)
[пример на github](https://gist.github.com/bendasvadim/fc398385810473f9724bad9d42281fb3/revisions)  
[stackoverflow](https://ru.stackoverflow.com/questions/426401/%d0%9a%d0%b0%d0%ba-%d1%83%d0%b4%d0%b0%d0%bb%d0%b8%d1%82%d1%8c-%d1%84%d0%b0%d0%b9%d0%bb-%d0%b8%d0%b7-%d0%b8%d1%81%d1%82%d0%be%d1%80%d0%b8%d0%b8-git)

1. Нужно найти все коммиты, которые изменяли файл:
````
git log --pretty=oneline --branches -- BIGFILE.ZIP
````
2. Удалить ссылки на файл из всей истории коммитов, начиная с последнего (пусть, хеш последнего коммита - 6df7640):
````
git filter-branch --index-filter 'git rm --cached BIGFILE.ZIP --ignore-unmatch' --prune-empty --tag-name-filter cat -- --all
````
3. Удалить ссылки на каталог из истории коммитов:
````
git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch BIG/DIR' --prune-empty --tag-name-filter cat -- --all
````
4. Отправляем изменения на сервер:
````
git push --force
````

## Создание нового репозитория

ссылки по теме  

[офф дока гитфаба](https://docs.github.com/en/get-started/importing-your-projects-to-github/importing-source-code-to-github/adding-locally-hosted-code-to-github)  
[тоже про создание репы](https://www.digitalocean.com/community/tutorials/how-to-push-an-existing-project-to-github)  
[как переименовать мастер ветку 1](https://www.git-tower.com/learn/git/faq/git-rename-master-to-main)  
[как переименовать мастер ветку 2](https://stackoverflow.com/questions/67543278/git-how-to-change-default-branch-for-everything-i-do)

инициализация репозитория
````
$ git init -b main
$ git add . && git commit -m "initial commit"
````

На старых версиях гита нет ключа -b, тогда можно создать репу, а потом переименовать ветку
````
$ git init
$ git add . && git commit -m "initial commit"
$ git branch -m master main
````

Добавляем удаленный репозиторий и проверяем всё ли хорошо
````
$ git remote add origin <REMOTE_URL>
# Sets the new remote
$ git remote -v
# Verifies the new remote URL
````

Отправляем начальный коммит в репозиторий
````
$ git push origin main
# Pushes the changes in your local repository up to the remote repository you specified as the origin
````
Для настройки апстрима на origin можно выполнить следующую команду, это позволит выполнять git push и git pull  
без указания репозитория origin
````
git push -u -f origin main
````

И того всё вместе
````
git init
git add -A
git commit -m 'Added my project'
git remote add origin git@github.com:sammy/my-new-project.git
git push -u -f origin main
````
