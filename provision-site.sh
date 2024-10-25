#!/bin/bash
set -e

# Variabili
SITE_DIR="/var/www/html/scuola"
DB_HOST="10.10.20.11" # IP della VM del DB
DB_NAME="scuola"
DB_USER="user"
DB_PASS="password"

# Crea la directory per il sito
mkdir -p $SITE_DIR
chown -R www-data:www-data $SITE_DIR # Cambia il proprietario in www-data

# Crea un file di configurazione per il sito
cat <<EOL | sudo tee /etc/apache2/sites-available/scuola.conf
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot $SITE_DIR
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL

# Abilita il nuovo sito e il modulo rewrite
a2ensite scuola.conf
a2enmod rewrite

# Riavvia Apache
systemctl restart apache2