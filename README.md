# Zemond_infra
Zemond Infra repository

1. Для подключения по доменному имени добавим в файл /etc/hosts строку:

10.166.0.3 someinternalhost

Теперь можно вводить ssh someinternalhost и подключаться по имени сервера.
В моем понимании нет нужды в .ssh/config так как имя и порт у нас един для двух серверов.

2. Сквозное подключение через ключи ssh

ssh -t -i ~/.ssh/pankratov -A pankratov@35.228.129.127 ssh 10.166.0.3
