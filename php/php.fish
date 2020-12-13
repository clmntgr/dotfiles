set -x PATH $HOME/.composer/vendor/bin $PATH
set -x COMPOSER_MEMORY_LIMIT -1

function art
    php artisan
end