#!/bin/bash

# Installa MySQL Server
apt-get install -y mysql-server

# Imposta la password per l'utente root (assicurati che il pacchetto 'debconf-utils' sia installato)
debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'

# Modifica la configurazione per permettere connessioni esterne
sed -i.bak 's/bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Riavvia il servizio MySQL per applicare le modifiche
systemctl restart mysql

# Stampa lo stato del servizio MySQL
systemctl status mysql