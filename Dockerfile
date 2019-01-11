FROM stayallive/php:7.3

RUN composer self-update --no-progress && \
    composer global require hirak/prestissimo

ADD composer-install.sh /bin/
RUN chmod +x /bin/composer-install.sh

ENTRYPOINT /bin/composer-install.sh
