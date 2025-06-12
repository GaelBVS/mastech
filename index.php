<?php
require 'config.php';
if (!isset($_SESSION['user'])) {
    header('Location: login.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-3">
  <a class="navbar-brand" href="#">MonCRM</a>
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav ms-auto">
      <li class="nav-item"><a class="nav-link" href="#">Projets</a></li>
      <li class="nav-item"><a class="nav-link" href="#">Clients</a></li>
      <li class="nav-item"><a class="nav-link" href="#">Déconnexion</a></li>
    </ul>
  </div>
</nav>

<div class="container py-4">
  <h2 class="mb-4">Tableau de bord</h2>
  <div class="row g-4">
    <div class="col-md-6">
      <div class="card shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Projets en cours</h5>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">Site Web Vitrine - en cours</li>
            <li class="list-group-item">Refonte ERP - en attente</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="card shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Relances clients</h5>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">Jean Dupont - 3 devis en attente</li>
            <li class="list-group-item">Sophie Martin - facture impayée</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
