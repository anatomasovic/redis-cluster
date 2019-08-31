Highly available Redis cluster, deployed as Docker containers.

Master and replica are monitored by 3 Sentinels.

Python application writes random data into Redis.

Grafana displays system load, using Prometheus and cAdvisor to collect data.
