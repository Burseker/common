## [Content](../contents.md)

-----------------------------------

### Очень частые команды
````
gradlew -help
gradlew -version
gradlew --stop
````

### Передача пропертей в gradle
[официальная дока](https://docs.gradle.org/current/userguide/build_environment.html)
[подробная статья](https://tomgregory.com/gradle-project-properties-best-practices/)
[немного примерчиков](https://stackoverflow.com/questions/59741629/how-to-pass-environment-variables-to-the-gradle-wrapper-build-using-only-command)

пример с env_var работает только на UNIX, но протаскивание параметров через args работает
> For passing env variables  
> `MY_ENV_VAR1=xxxxxx MY_ENV_VAR2=xxxxxx ./gradlew bootRun`  
> For arguments/overriding properties values  
> `./gradlew bootRun --args='--spring.profiles.active=local --db.url=something --anotherprop=fafdf'`  
> For both passing env variable and overriding properties values.  
> ```
> MY_ENV_VAR1=xxxxxx MY_ENV_VAR2=xxxxxx ./gradlew bootRun --args='--spring.profiles.active=local --db.url=something --anotherprop=fafdf'
> ```  
