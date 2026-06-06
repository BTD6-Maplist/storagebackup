FROM alpine:latest

RUN apk add --no-cache aws-cli tar supercronic

COPY dirbackup.sh /dirbackup.sh
RUN chmod +x /dirbackup.sh
COPY crontab.dirbackup.txt /crontab.txt

CMD ["supercronic", "/crontab.txt"]
