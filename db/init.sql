CREATE DATABASE IF NOT EXISTS moncrm;
USE moncrm;

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20),
    adresse TEXT,
    notes TEXT,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP
);

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

CREATE TABLE devis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    objet VARCHAR(255),
    montant DECIMAL(10,2),
    statut VARCHAR(50),
    date_emission DATE,
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

CREATE TABLE factures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT,
    montant DECIMAL(10,2),
    date_facture DATE,
    statut VARCHAR(50),
    FOREIGN KEY (id_client) REFERENCES clients(id)
);

CREATE TABLE taches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_projet INT,
    titre VARCHAR(255),
    description TEXT,
    date_echeance DATE,
    faite BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_projet) REFERENCES projets(id)
);

-- Données clients
INSERT INTO clients (nom, email, telephone, adresse, notes) VALUES
('Jean Dupont', 'jean@exemple.com', '0600000001', '12 rue de Paris', 'Client important'),
('Sophie Martin', 'sophie@exemple.com', '0600000002', '34 avenue Victor Hugo', 'Répond vite');

-- Données projets
INSERT INTO projets (id_client, nom, description, date_debut, statut) VALUES
(1, 'Site Web Vitrine', 'Création site vitrine', '2024-04-01', 'En cours'),
(2, 'Refonte ERP', 'Migration Dolibarr', '2024-05-15', 'En attente');

-- Devis
INSERT INTO devis (id_client, objet, montant, statut, date_emission) VALUES
(1, 'Développement module CRM', 4500.00, 'En attente', '2024-05-01');

-- Factures
INSERT INTO factures (id_client, montant, date_facture, statut) VALUES
(2, 1250.00, '2024-05-15', 'Impayée');

-- Tâches
INSERT INTO taches (id_projet, titre, description, date_echeance) VALUES
(1, 'Maquette accueil', 'Créer design de la homepage', '2024-06-30');
