## [Content](../contents.md)

# Доступ к ресурсам через ssh

## Общая информация

[Информация по теме](https://docs.github.com/ru/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

## Генерируем ssh ключи

Важные примеры команд

```
$ ssh-keygen -t ed25519 -C "your_email@example.com"
$ ssh-keygen -t ed25519 -C "your_email@example.com" -f /c/Users/UserName/.ssh/id_ed25519_personal
$ ssh-keygen --help
```

fingerprint можно забэкапить, к примеру в /c/Users/UserName/.ssh/key.bup

## Немного инфы про ssh-agent

> Quick tip for not having to keep typing your SSH key passphrase (which should be a good, difficult passphrase) when executing git commands that access the GitHub remote server.

https://dougbreaux.github.io/2019/03/27/Git-Bash-with-SSH-agent.html  
https://habr.com/ru/company/skillfactory/blog/503466/  

## Управление ключами ssh

Для управления ключами можно использовать файл конфигураций /c/Users/UserName/.ssh/config
https://linuxize.com/post/using-the-ssh-config-file/  
https://www.ssh.com/academy/ssh/config  
https://stackoverflow.com/questions/4565700/how-to-specify-the-private-ssh-key-to-use-when-executing-shell-command-on-git

Пример используемого скрипта

```
# link with solution https://stackoverflow.com/questions/4565700/how-to-specify-the-private-ssh-key-to-use-when-executing-shell-command-on-git
Host github.com
    HostName github.com
    IdentityFile ~/.ssh/id_ed25519_personal
    IdentitiesOnly yes # see NOTES below
    User personaluser

# Host github-work
#    HostName githubbabub.com
#    IdentityFile /path/to/your/work/github/private/key
#    User workuser
```
