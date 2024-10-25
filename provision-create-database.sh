#!/bin/bash
set -e

# Autenticazione
DB_USER="user"
DB_PASS="password"
# Database
DB_NAME="scuola"
TABLE_NAME="studenti"


# DATABASE: scuola
mysql -u root -p"password" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# UTENTE: user
mysql -u root -p"password" -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -u root -p"password" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%'; FLUSH PRIVILEGES;"

# TABELLA: scuola.studente
mysql -u $DB_USER -p"$DB_PASS" -e "use $DB_NAME; CREATE TABLE IF NOT EXISTS $TABLE_NAME (id INT AUTO_INCREMENT PRIMARY KEY,nome VARCHAR(50),cognome VARCHAR(50),indirizzo VARCHAR(100),data_nascita DATE) ENGINE=InnoDB;"

mysql -u $DB_USER -p"$DB_PASS" -e "use $DB_NAME; INSERT INTO studenti (nome, cognome, indirizzo, data_nascita) VALUES ('Mario', 'Rossi', 'Via Roma 1, Milano', '2000-01-15'), ('Luca', 'Bianchi', 'Via Milano 10, Torino', '1999-03-22'),('Giulia', 'Verdi', 'Piazza Venezia 5, Roma', '2001-07-30'),('Sofia', 'Neri', 'Corso Italia 15, Napoli', '2000-05-10'),('Alessandro', 'Gallo', 'Via Firenze 20, Firenze', '1998-11-05');"