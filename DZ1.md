## Задача 1
sudo docker images
sudo docker rmi -f b9d1c8159cd0

sudo docker login -u dk054
sudo docker build -t dk054/custom-nginx:1.0.0 .
sudo docker push dk054/custom-nginx:1.0.0

https://hub.docker.com/repository/docker/dk054/custom-nginx/tags/1.0.0/sha256-73402190b0857ea96916f12d3caefd47f68b578ef32e7924a3696c88d11e84f7

## Задача 2



sudo docker run -d --name "Kalashnikov.D.A-custom-nginx-t2" -p 127.0.0.1:8080:80 custom-nginx:1.0.0
sudo docker rename Kalashnikov.D.A-custom-nginx-t2 custom-nginx-t2


## Задача 3
sudo docker attach custom-nginx-t2
- После Ctrl-C основной процесс PID 1 внутри контейнера получил сигнал SIGINT и завершился.
- В Docker контейнер считается живым пока запущен его основной процесс. Если этот процесс завершился, контейнер переходит в статус Exited.
- Поэтому при выполнении docker ps -a вы увидите контейнер со статусом Exited — это означает, что контейнер остановлен из‑за завершения его основного процесса (в данном случае — в результате Ctrl-C).
4. sudo docker start custom-nginx-t2
5.  docker exec -it custom-nginx-t2 /bin/bash
6. apt-get update
   apt-get install -y vim
7. vi /etc/nginx/conf.d/default.conf
8. nginx -s reload
а затем внутри контейнера ```curl http://127.0.0.1:80 ; curl http://127.0.0.1:81```.
10. Проверьте вывод команд: ```ss -tlpn | grep 127.0.0.1:8080``` 
```docker port custom-nginx-t2```
```curl http://127.0.0.1:8080```. 
Кратко объясните суть возникшей проблемы.
в конфиге nginx внутри контейнера listen 80 → listen 81, но проброс портов контейнера на хост (docker run -p HOST:CONTAINER) вероятно настроен так, чтобы ожидать nginx на порту 80 или на 8080 хоста. 
Если nginx слушает 81 внутри контейнера, а docker пробрасывает, например, host:8080 → container:80, то на хосте 8080 будет «мёртвый» порт (нет сервера), а внутри контейнера curl на 81 вернёт ответ. 
То есть несоответствие слушаемого порта внутри контейнера и смэппинга портов на хосте — причина недоступности сервиса на ожидаемом хост-порте.
11. * 
sudo docker stop custom-nginx-t2
sudo docker run -p 8080:81 custom-nginx











