FROM stayallive/php:7.3

ADD composer-install.sh /bin/
RUN chmod +x /bin/composer-install.sh

ENTRYPOINT /bin/composer-install.sh
