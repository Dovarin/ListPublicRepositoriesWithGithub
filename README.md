# ListPublicRepositoriesWithGithub

**После pull проекта: **
**1) pod deintegrate**
**2) pod install**
**Обязательно!!**

Основная ветка - Develop

**Подходы, используемые в приложении:** 
1) SnapKit
2) MVVM(без Rx, т.к. приложение достаточно простое)
3) URLSession(Добавлена библиотека Alamofire, но не была использована)
4) IOS 12+

Приложение состоит из 2-ух экранов, 1-ый - это **RepositoriesViewController**, который содержит в себе tableView, куда помещаются данные. 2-ой - это **DetailViewController**, содержит переданные данные + дополнительно подгруженные для коммита.

Метод *setupConstraints* там, где содержит большое кол-во строчек кода - вынесен в отдельный extension.

Была добавлена базовая аутентификация, но, к сожалению, все попытки получить statusCode = **200** заканчивались провалом, ошибка **401**

<img width="598" alt="image" src="https://user-images.githubusercontent.com/85112686/146852724-e7c8a034-91c9-413e-a0c5-f54ef45afe2e.png">

class GithubApiManager, в качестве данных входа Github рекомендует использовать userName и token, (данные подставляются свои)

<img width="721" alt="image" src="https://user-images.githubusercontent.com/85112686/146852884-3e9b0deb-0271-49ae-8d55-e0e1e4ba00ed.png">

<img width="837" alt="image" src="https://user-images.githubusercontent.com/85112686/146853094-2d95501a-3578-4561-91dd-468dff54a2a3.png">
https://docs.github.com/en/rest/overview/other-authentication-methods#via-oauth-and-personal-access-tokens

На работу суммарно ушло 7-8 часов, приложение несложное, большая часть времени ушла на разбор API и аутентификацию.
