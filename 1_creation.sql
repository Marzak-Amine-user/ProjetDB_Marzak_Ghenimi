DROP TABLE IF EXISTS evaluer CASCADE;
DROP TABLE IF EXISTS reserver CASCADE;
DROP TABLE IF EXISTS etape CASCADE;
DROP TABLE IF EXISTS trajets CASCADE;
DROP TABLE IF EXISTS vehicule CASCADE;
DROP TABLE IF EXISTS utilisateurs CASCADE;


CREATE TABLE utilisateurs (
    id_utilisateurs INT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telephone VARCHAR(50),
    date_inscription DATE NOT NULL
);


CREATE TABLE vehicule (
    id_vehicule INT PRIMARY KEY,
    immatriculation VARCHAR(50) NOT NULL UNIQUE,
    marque VARCHAR(50) NOT NULL,
    modele VARCHAR(50) NOT NULL,
    couleur VARCHAR(50),
    nb_places INT NOT NULL,

    id_utilisateurs INT NOT NULL,

    CONSTRAINT fk_vehicule_utilisateur
        FOREIGN KEY (id_utilisateurs)
        REFERENCES utilisateurs(id_utilisateurs)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE trajets (
    id_trajets INT PRIMARY KEY,
    date_depart DATE NOT NULL,
    heure_depart TIME NOT NULL,
    adresse_depart VARCHAR(50) NOT NULL,
    ville_depart VARCHAR(50) NOT NULL,
    adresse_arrivee VARCHAR(50) NOT NULL,
    ville_arrivee VARCHAR(50) NOT NULL,
    prix_place DECIMAL(15,2) NOT NULL,
    nombre_places_proposees INT NOT NULL,
    statut_trajet VARCHAR(50) NOT NULL,

    id_vehicule INT NOT NULL,
    id_utilisateurs INT NOT NULL,

    CONSTRAINT fk_trajet_vehicule
        FOREIGN KEY (id_vehicule)
        REFERENCES vehicule(id_vehicule)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_trajet_utilisateur
        FOREIGN KEY (id_utilisateurs)
        REFERENCES utilisateurs(id_utilisateurs)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE etape (
    id_trajets INT,
    numero_ordre INT,
    ville_etape VARCHAR(50) NOT NULL,
    adresse_etape VARCHAR(50),
    heure_passage TIME,

    PRIMARY KEY (id_trajets, numero_ordre),

    CONSTRAINT fk_etape_trajet
        FOREIGN KEY (id_trajets)
        REFERENCES trajets(id_trajets)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE reserver (
    id_utilisateurs INT,
    id_trajets INT,
    date_reservation DATE NOT NULL,
    nombre_places_reservees INT NOT NULL,
    statut_reservation VARCHAR(50) NOT NULL,

    PRIMARY KEY (id_utilisateurs, id_trajets),

    CONSTRAINT fk_reserver_utilisateur
        FOREIGN KEY (id_utilisateurs)
        REFERENCES utilisateurs(id_utilisateurs)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_reserver_trajet
        FOREIGN KEY (id_trajets)
        REFERENCES trajets(id_trajets)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE evaluer (
    id_utilisateurs_evalue INT,
    id_utilisateurs_auteur INT,
    id_trajets INT,
    note INT NOT NULL,
    commentaire VARCHAR(50),
    date_evaluation DATE NOT NULL,

    PRIMARY KEY (
        id_utilisateurs_evalue,
        id_utilisateurs_auteur,
        id_trajets
    ),

    CONSTRAINT fk_evaluer_evalue
        FOREIGN KEY (id_utilisateurs_evalue)
        REFERENCES utilisateurs(id_utilisateurs)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_evaluer_auteur
        FOREIGN KEY (id_utilisateurs_auteur)
        REFERENCES utilisateurs(id_utilisateurs)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_evaluer_trajet
        FOREIGN KEY (id_trajets)
        REFERENCES trajets(id_trajets)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
