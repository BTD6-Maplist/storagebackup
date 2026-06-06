FROM amazon/aws-cli:latest

RUN yum install -y cronie tar && yum clean all

COPY dirbackup.sh /dirbackup.sh
COPY crontab.dirbackup.txt /etc/cron.d/dir-backup

RUN chmod 0644 /etc/cron.d/dir-backup && crontab /etc/cron.d/dir-backup

ENTRYPOINT []
CMD ["crond", "-n"]
