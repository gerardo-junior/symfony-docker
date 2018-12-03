#!/bin/sh

if [ -f /usr/local/etc/php/conf.d/xdebug.ini ]; then
    sudo sh -c 'sed -i "s/0.0.0.0/'$(ip route | awk 'NR==1 {print $3}')'/g" /usr/local/etc/php/conf.d/xdebug.ini'
fi

if [ -e "$(pwd)/composer.json" ]; then
    /usr/local/bin/php /usr/local/bin/composer install --no-interaction $(if [[ ! $DEBUG = "true" ]]; then echo '--no-dev'; fi)
fi

if [ ! -z "$1" ]; then
    if [ -z "$(which -- $1)" ]; then
        /usr/local/bin/php bin/console "$@"
    else
        exec "$@"
    fi
elif [ -d "$(pwd)/public" ]; then
    echo -e "\n" \
            "==============================================================\n" \
            "==============================================================\n" \
            "==================== OPEN IN YOUR BROWSER ====================\n" \
            "==============================================================\n" \
            "==============================================================\n" 
 
    # Apache gets grumpy about PID files pre-existing
    sudo sh -c 'rm -f /usr/local/apache2/logs/httpd.pid && \
                /usr/local/apache2/bin/httpd -DFOREGROUND'

else 

    echo "/public folder not found."
    exit 1

fi
