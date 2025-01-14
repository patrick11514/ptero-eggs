FROM alpine:latest

RUN apk --update --no-cache add ca-certificates nginx
RUN apk add php8 php8-xml php8-exif php8-fpm php8-session php8-soap php8-openssl php8-gmp php8-pdo_odbc php8-json php8-dom php8-pdo php8-zip php8-mysqli php8-sqlite3 php8-pdo_pgsql php8-bcmath php8-gd php8-odbc php8-pdo_mysql php8-pdo_sqlite php8-gettext php8-xmlreader  php8-bz2 php8-iconv php8-pdo_dblib php8-curl php8-ctype php8-phar php8-fileinfo php8-mbstring php8-tokenizer

# RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
# RUN /usr/bin/php8 composer-setup.php --install-dir=/usr/local/bin --filename=composer
# RUN rm -rf composer-setup.php
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

RUN mkdir /home/container/logs
COPY ./logs/* /home/container/logs/

CMD ["/bin/ash", "/entrypoint.sh"]
