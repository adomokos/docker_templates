FROM redis:3.2-alpine

# Install redis
RUN apk --update add bash vim && \
    rm -rf /var/cache/apk/* && \
    chown -R redis:redis /data && \
    echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

# Add the files
ADD root /

VOLUME ["/data"]

# Expose the ports for redis
EXPOSE 6379
