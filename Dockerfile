FROM alpine:latest
RUN apk add --no-cache wget unzip ca-certificates
RUN wget -q https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -O /tmp/xray.zip && unzip -q /tmp/xray.zip -d /usr/local/bin/ && chmod +x /usr/local/bin/xray && rm /tmp/xray.zip
COPY config.json /etc/xray/config.json
CMD ["sh","-c","sed -i \"s/8080/${PORT:-8080}/\" /etc/xray/config.json; exec xray run -c /etc/xray/config.json"]
