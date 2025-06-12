<?php
require 'config.php';

echo "<h2>Tables dans la base moncrm :</h2><ul>";

$tables = $pdo->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
foreach ($tables as $table) {
    echo "<li>$table</li>";
}

echo "</ul>";
?>