FROM redhat/ubi8:latest
MAINTAINER YILING CAI
ENV PORT 8080
RUN yum install -y httpd
RUN yum clean all
RUN chown -R apache:apache /etc/httpd/logs/ && chown -R apache:apache /run/httpd/
RUN sed -ri -r "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf


EXPOSE ${PORT}
USER apache
COPY src/index.html /var/www/html/
CMD ["httpd", "-D", "FOREGROUND"]