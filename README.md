# BBQ

## Описание

Приложение, с помощью которого легко создать любое событие (позвать на шашлыки, на открытие библиотеки, рок концерт) и позвать на него всех друзей!   
Пользователь создает событие с датой проведения, описанием, местоположением на карте, после чего на него могут подписаться другие пользователи!  
В созданном событии можно выкладывать фотографии и оставлять комментарии!

В приложении реализован функционал -  
* Авторизация, аутентификация - ```Devise, Pundit```  
* Авторизация через соц.сети - ```OmniAuth Facebook, OmniAuth Vkontakte```  
* Загрузка файлов - ```Carrierwave```  
* Отправка почты - ```ActionMailer, SendGrid API```  
* Фоновые задачи - ```ActiveJob, Resque, Redis```   
* Верстка - ```Bootstrap4```  

## Preview

https://partybbq.ru/

## Установка

Для корректной работы приложения на Вашем компьютере должны быть установлены Ruby 2.7.1 и Rails 6.0.3. [(Install Ruby On Rails on
Ubuntu 20.04 Focal Fossa)](https://gorails.com/setup/ubuntu/20.04).

```
$ git clone https://github.com/kkrasilov/bbq.git
$ cd ./bbq
$ bundle install --without production
$ yarn install --check-files
$ cp config/databese.yml.example config/databese.yml
$ rails db:migrate
```
Для корректной работы отправки почты в фоновом режиме Вам нужно будет установить [Redis](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04-ru)

## Дополнительные функции

Вы можете использовать в приложении [Яндекс Карты](https://yandex.ru/dev/maps/), [OmniAuth Facebook (раздел Create Facebook app)](https://dev.to/nkemjiks/implementing-facebook-authentication-with-devise-for-your-rails-6-app-1p3b), [OmniAuth Vkontakte](https://vk.com/dev)
Для этого нужно получить соответствующие ключи и прописать их в credentials, как показано ниже.
```
$ rm -rf config/credentials.yml.enc
$ EDITOR=vim rails credentials:edit
```
```
yandex:
  map:
    api_key: Ваш ключ
omniauth:     
  omniauth_facebook_id: Ваш ключ      
  omniauth_facebook_secret: Ваш ключ
  omniauth_vkontakte_id: Ваш ключ                             
  omniauth_vkontakte_secret: Ваш ключ
```
> :warning: **ВАЖНО!**: Не храните файл ```master.key``` в публичных репозиториях!

## Запуск
1 окно терминала: ```$ bin/webpack-dev-server```   
2 окно терминала: ```$ bundle exec rails s```  
3 окно терминала: ```$ QUEUE=bbq* bundle exec rake environment resque:work```  (Если Вы установили и запустили сервер ```Redis```) 

Приложение находится по адресу ```http://localhost:3000/```
