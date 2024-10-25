#!/bin/bash

# Installa nano (editor di testo)
apt-get install -y nano

# Installa Apache e PHP
apt-get install -y apache2 php libapache2-mod-php

# Installa PHP e il driver MySQL
apt-get install -y php php-mysql

# Avvia il servizio Apache
systemctl start apache2

# Abilita Apache per l'avvio automatico al boot
systemctl enable apache2