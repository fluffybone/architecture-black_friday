# pymongo-api

## Как запустить

Перейти в папку sharding-repl-cache

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Подключиться и инициализировать сервис конфигурации

```shell
./scripts/config-service.sh
```

Инициализировать шарды
```shell
./scripts/init-shard.sh
```

Инцициализировать роутер и наполнить его тестовыми данными
```shell
./scripts/init-route.sh
```

Сделайте проверку на шардах:
на 1

```shell
./scripts/check-shard1.sh
```
на 2

```shell
./scripts/check-shard2.sh
```

проверьте статус реплика-сета:

Шард1:

`docker exec -it shard1 mongosh --port 27018 --eval "rs.status()"`

Шард2:

`docker exec -it shard2 mongosh --port 27019 --eval "rs.status()"`


Откройте в браузере http://localhost:8080

Отрыть сеть ->перйти на url http://localhost:8080/helloDoc/users (обратить внимание на время выполнения запроса)
обновить страницу снова посмотреть на время выполнение нашего запроса  http://localhost:8080/helloDoc/users
теперь данные достаются из кеша и ответ быстрее (было: 1.02 s, стало: 6ms)