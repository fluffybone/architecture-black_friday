#!/bin/bash

###
#Инициализируем шарды
###

docker compose exec -T shard1 mongosh --port 27018 <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1:27018" },
        { _id : 1, host : "shard1_secondary1:27021" },
        { _id : 2, host : "shard1_secondary2:27022" },
      ]
    }
);
EOF

docker compose exec -T shard2 mongosh --port 27019 <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "shard2:27019" },
        { _id : 1, host : "shard2_secondary1:27023" },
        { _id : 2, host : "shard2_secondary2:27024" },
      ]
    }
  );
EOF

echo "Скрипт выполнен. Результаты выше."
read -p "Нажмите Enter, чтобы выйти..." DUMMY