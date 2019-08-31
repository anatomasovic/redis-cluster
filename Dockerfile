FROM redis:latest
ADD sentinel.conf /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis/sentinel.conf
ENV SENTINEL_QUORUM 2
RUN mkdir app
WORKDIR /app
ENV SENTINEL_DOWN_AFTER 5000
ENV SENTINEL_FAILOVER 10000
ENV SENTINEL_PORT 26000
ADD entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 26379 6379

FROM python:2.7-slim
WORKDIR /app
COPY . /app
RUN pip install --trusted-host pypi.python.org -r requirements.txt
CMD ["python", "-u", "app.py"]

COPY ./grafana/provisioning/dashboards/*yaml /etc/grafana/provisioning/dashboards/
