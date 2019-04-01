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

5. Домашняя работа №6

testapp_IP = 35.205.147.226
testapp_port = 9292

6. Команда для использования скрипта startup_script

gcloud compute instances create reddit-app1 --boot-disk-size=10GB \
--image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud \
--machine-type=g1-small --tags puma-server --restart-on-failure \
--metadata-from-file startup-script=Zemond_infra/startup_script.sh \
--zone europe-north1-a

7. Команда для создания правила брандмауера через консоль gcloud

gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --target-tags puma-server --enable-logging

Домашняя работа №7

1. Выполнена работа с переменными, через файл variable.json
2. Исследованы другие опции builder для GCP
3*. Попрактиковался в подходе Immutable infrastructure, сделал immutable.json
4*. Сделан скрипт create-reddit-vm.sh для запуска машины с ранее созданым образом
