import redis
import random
import time
from redis.sentinel import Sentinel

sentinel = Sentinel([('sentinel-1', 26379), ('sentinel-2', 26379), ('sentinel-3', 26379)], socket_timeout=100)
master = sentinel.master_for('mymaster', socket_timeout=100)

for i in range(0, 1000):
    timestamp = time.strftime("%Y-%m-%d %H:%M:%S", time.gmtime())
    num = random.randint(1,101)
    master.set(timestamp, num)
    time.sleep(2)
