-- Création de la base
CREATE DATABASE IF NOT EXISTS moncrm;
USE moncrm;

-- Table clients
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20),
    adresse TEXT,
    notes TEXT,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table projets
CREATE TABLE projets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    nom VARCHAR(100),
    description TEXT,
    date_debut DATE,
    date_fin DATE,
    statut VARCHAR(50),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

-- Table devis
CREATE TABLE devis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    objet VARCHAR(255),
    montant DECIMAL(10,2),
    statut VARCHAR(50),
    date_emission DATE,
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

-- Table factures
CREATE TABLE factures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    montant DECIMAL(10,2),
    date_facture DATE,
    statut VARCHAR(50),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

-- Table tâches
CREATE TABLE taches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_projet INT,
    titre VARCHAR(255),
    description TEXT,
    date_echeance DATE,
    faite BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_projet) REFERENCES projets(id)
);
