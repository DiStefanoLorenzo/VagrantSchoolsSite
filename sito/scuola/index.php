<?php
$host = '10.10.20.11';
$dbname = 'scuola';
$username = 'user';
$password = 'password';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connessione avvenuta con successo!<br>";

    $stmt = $pdo->query("SELECT id, nome, cognome, indirizzo, data_nascita FROM studenti");
    
    if ($stmt->rowCount() > 0) {
        echo "<h2>Lista di utenti:</h2>";
        echo "<table border='1'>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Indirizzo</th>
                    <th>Data di Nascita</th>
                </tr>";
        
        
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>
                    <td>{$row['id']}</td>
                    <td>{$row['nome']}</td>
                    <td>{$row['cognome']}</td>
                    <td>{$row['indirizzo']}</td>
                    <td>{$row['data_nascita']}</td>
                  </tr>";
        }
        
        echo "</table>";
    } else {
        echo "Nessun utente trovato.";
    }
} catch (PDOException $e) {
    echo 'Connessione fallita: ' . $e->getMessage();
}
?>
