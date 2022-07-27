cd ./9000 && redis-server redis.conf

cd ../9001 && redis-server redis.conf

cd ../9002 && redis-server redis.conf

cd ../9003 && redis-server redis.conf

cd ../9004 && redis-server redis.conf

cd ../9005 && redis-server redis.conf

cd ../9006 && redis-server redis.conf


cd ../ && redis-cli --cluster create  127.0.0.1:9000 127.0.0.1:9001 127.0.0.1:9002 127.0.0.1:9003 127.0.0.1:9004 127.0.0.1:9005 127.0.0.1:9006 --cluster-replicas 1
