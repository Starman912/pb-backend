FROM debian:stable-slim
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates bash curl unzip && rm -rf /var/lib/apt/lists/*
COPY pocketbase /app/pocketbase
COPY render-start.sh /app/render-start.sh
COPY pb_data.tar.gz /app/pb_data.tar.gz
RUN chmod +x /app/pocketbase /app/render-start.sh && mkdir -p /app/pb_data /app/pb_logs
EXPOSE 8090
CMD ["bash","-lc","./render-start.sh"]
