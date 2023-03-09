FROM registry.access.redhat.com/ubi8/ubi

RUN yum update -y && \
    yum module install -y php:7.4 && \
    curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.rpm.sh' | bash && \
    yum install -y symfony-cli php-fpm php-common php-bcmath php-gmp php-json php-mbstring php-pdo php-xml php-mysqlnd php-pecl-zip php-gd zip

WORKDIR /app

COPY . .

RUN cd framework && symfony composer update && symfony composer dump-autoload -o

RUN chmod -R a=rwX /app 

CMD symfony server:start

USER 1001

ENV HOME=/app

EXPOSE 8000