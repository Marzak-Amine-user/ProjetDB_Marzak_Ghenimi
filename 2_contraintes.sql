-- Contraintes de validation
-- Mini-projet BDD - Plateforme de covoiturage
-- Mohammed Amine Marzak / Ridha Ghenimi


-- ============================================
-- UTILISATEURS
-- ============================================

-- Le nom ne doit pas être vide
ALTER TABLE utilisateurs
ADD CONSTRAINT chk_utilisateur_nom
CHECK (LENGTH(TRIM(nom)) > 0);

-- Le prénom ne doit pas être vide
ALTER TABLE utilisateurs
ADD CONSTRAINT chk_utilisateur_prenom
CHECK (LENGTH(TRIM(prenom)) > 0);

-- Vérification simple du format de l'adresse email
ALTER TABLE utilisateurs
ADD CONSTRAINT chk_utilisateur_email
CHECK (email LIKE '%@%.%');


-- ============================================
-- VEHICULE
-- ============================================

-- Un véhicule doit posséder au moins une place passager
ALTER TABLE vehicule
ADD CONSTRAINT chk_vehicule_nb_places
CHECK (nb_places BETWEEN 1 AND 9);

-- L'immatriculation ne doit pas être vide
ALTER TABLE vehicule
ADD CONSTRAINT chk_vehicule_immatriculation
CHECK (LENGTH(TRIM(immatriculation)) > 0);


-- ============================================
-- TRAJETS
-- ============================================

-- Le prix d'une place ne peut pas être négatif
ALTER TABLE trajets
ADD CONSTRAINT chk_trajet_prix
CHECK (prix_place >= 0);

-- Un trajet doit proposer au moins une place
ALTER TABLE trajets
ADD CONSTRAINT chk_trajet_nb_places
CHECK (nombre_places_proposees BETWEEN 1 AND 9);

-- Le statut du trajet doit être valide
ALTER TABLE trajets
ADD CONSTRAINT chk_trajet_statut
CHECK (
    statut_trajet IN ('prevu', 'termine', 'annule')
);

-- Les villes de départ et d'arrivée doivent être renseignées
ALTER TABLE trajets
ADD CONSTRAINT chk_trajet_villes
CHECK (
    LENGTH(TRIM(ville_depart)) > 0
    AND LENGTH(TRIM(ville_arrivee)) > 0
);


-- ============================================
-- ETAPE
-- ============================================

-- Le numéro d'ordre d'une étape doit être positif
ALTER TABLE etape
ADD CONSTRAINT chk_etape_numero
CHECK (numero_ordre > 0);

-- La ville de l'étape doit être renseignée
ALTER TABLE etape
ADD CONSTRAINT chk_etape_ville
CHECK (LENGTH(TRIM(ville_etape)) > 0);


-- ============================================
-- RESERVER
-- ============================================

-- Une réservation doit concerner au moins une place
ALTER TABLE reserver
ADD CONSTRAINT chk_reservation_nb_places
CHECK (nombre_places_reservees > 0);

-- Le statut d'une réservation doit être valide
ALTER TABLE reserver
ADD CONSTRAINT chk_reservation_statut
CHECK (
    statut_reservation IN ('en_attente', 'confirmee', 'annulee')
);


-- ============================================
-- EVALUER
-- ============================================

-- Une note doit être comprise entre 1 et 5
ALTER TABLE evaluer
ADD CONSTRAINT chk_evaluation_note
CHECK (note BETWEEN 1 AND 5);


