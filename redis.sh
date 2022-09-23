redis-server ./9000/redis.conf
redis-server ./9001/redis.conf
redis-server ./9002/redis.conf
redis-server ./9003/redis.conf
redis-server ./9004/redis.conf
redis-server ./9005/redis.conf
redis-server ./9006/redis.conf

redis-cli --cluster create 127.0.0.1:9000 127.0.0.1:9001 127.0.0.1:9002 127.0.0.1:9003 127.0.0.1:9004 127.0.0.1:9005 127.0.0.1:9006 --cluster-replicas 1