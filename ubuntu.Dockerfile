FROM ubuntu:22.04
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install -q supervisor vim \
                       nginx \
                       unzip \
                       git \
                       curl 
RUN apt-get install -y php8.1-fpm
                    #    php8.0-cli 
                    #    php7.0-gd \
                    #    php7.0-imap \
                    #    php7.0-intl \
                    #    php7.0-json \
                    #    php7.0-mcrypt \
                    #    php7.0-mysql \
                    #    php7.0-pgsql \
                    #    php7.0-mbstring \
                    #    php7.0-ldap \
                    #    php7.0-zip \
                    #    php7.0-xml \
                    #    php7.0-curl && \
                    #    apt-get clean

RUN useradd -ms /bin/bash apprunner

USER apprunner
ENTRYPOINT [ "bash" ]