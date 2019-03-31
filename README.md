# Zemond_infra
Zemond Infra repository

1. Для подключения по доменному имени добавим в файл ssh./hosts строку:

Host someinternalhost
        HostName 10.166.0.3
        User pankratov
        IdentitiesOnly yes
        IdentityFile ~/.ssh/pankratov

2. Сквозное подключение через ключи ssh

ssh -t -i ~/.ssh/pankratov -A pankratov@35.228.129.127 ssh 10.166.0.3

3. Configuration

bastion_IP = 35.228.129.127 
someinternalhost_IP = 10.166.0.3

4* Добавляем сертификат и задействуем sslip.io. 

https://35.228.129.127.sslip.io
