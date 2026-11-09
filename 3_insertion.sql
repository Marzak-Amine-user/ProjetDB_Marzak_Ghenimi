-- Jeu de données
-- Mini-projet BDD - Plateforme de covoiturage
-- Mohammed Amine Marzak / Ridha Ghenimi


-- =========================================================
-- UTILISATEURS
-- =========================================================

INSERT INTO utilisateurs
(id_utilisateurs, nom, prenom, email, telephone, date_inscription)
VALUES
(1, 'Martin', 'Lucas', 'lucas.martin@gmail.com', '0611223344', '2026-01-10'),
(2, 'Bernard', 'Emma', 'emma.bernard@gmail.com', '0622334455', '2026-01-15'),
(3, 'Thomas', 'Hugo', 'hugo.thomas@gmail.com', '0633445566', '2026-02-02'),
(4, 'Robert', 'Lea', 'lea.robert@gmail.com', '0644556677', '2026-02-18'),
(5, 'Richard', 'Nathan', 'nathan.richard@gmail.com', '0655667788', '2026-03-01'),
(6, 'Petit', 'Chloe', 'chloe.petit@gmail.com', '0666778899', '2026-03-12'),
(7, 'Durand', 'Louis', 'louis.durand@gmail.com', '0677889900', '2026-04-05'),
(8, 'Leroy', 'Manon', 'manon.leroy@gmail.com', '0688990011', '2026-04-21'),
(9, 'Moreau', 'Jules', 'jules.moreau@gmail.com', '0699001122', '2026-05-02'),
(10, 'Simon', 'Sarah', 'sarah.simon@gmail.com', '0610112233', '2026-05-16'),
(11, 'Laurent', 'Adam', 'adam.laurent@gmail.com', '0621223344', '2026-06-01'),
(12, 'Michel', 'Ines', 'ines.michel@gmail.com', '0632334455', '2026-06-15'),
(13, 'Garcia', 'Tom', 'tom.garcia@gmail.com', '0643445566', '2026-07-03'),
(14, 'David', 'Lina', 'lina.david@gmail.com', '0654556677', '2026-07-19'),
(15, 'Bertrand', 'Noah', 'noah.bertrand@gmail.com', '0665667788', '2026-08-04');


-- =========================================================
-- VEHICULES
-- =========================================================

INSERT INTO vehicule
(id_vehicule, immatriculation, marque, modele, couleur, nb_places, id_utilisateurs)
VALUES
(1, 'AB-123-CD', 'Peugeot', '208', 'Noir', 4, 1),
(2, 'EF-456-GH', 'Renault', 'Clio', 'Blanc', 4, 2),
(3, 'IJ-789-KL', 'Citroen', 'C3', 'Gris', 4, 3),
(4, 'MN-234-OP', 'Toyota', 'Yaris', 'Bleu', 4, 5),
(5, 'QR-567-ST', 'Volkswagen', 'Golf', 'Noir', 4, 6),
(6, 'UV-890-WX', 'Ford', 'Focus', 'Rouge', 4, 8),
(7, 'YZ-345-AB', 'Dacia', 'Duster', 'Blanc', 5, 10),
(8, 'CD-678-EF', 'Renault', 'Captur', 'Gris', 4, 12);


-- =========================================================
-- TRAJETS
-- =========================================================

INSERT INTO trajets
(id_trajets, date_depart, heure_depart, adresse_depart,
 ville_depart, adresse_arrivee, ville_arrivee, prix_place,
 nombre_places_proposees, statut_trajet,
 id_vehicule, id_utilisateurs)
VALUES
(1, '2026-09-10', '08:00:00', '10 rue de Rivoli', 'Paris',
 '5 place Bellecour', 'Lyon', 35.00, 3, 'termine', 1, 1),

(2, '2026-09-18', '09:30:00', '12 avenue de France', 'Paris',
 '2 rue Sainte-Catherine', 'Bordeaux', 42.00, 3, 'termine', 2, 2),

(3, '2026-09-25', '07:45:00', '8 rue Nationale', 'Lille',
 '20 rue de la Republique', 'Paris', 25.00, 3, 'termine', 3, 3),

(4, '2026-10-03', '10:00:00', '15 rue Victor Hugo', 'Lyon',
 '3 boulevard Longchamp', 'Marseille', 30.00, 3, 'termine', 4, 5),

(5, '2026-10-10', '13:30:00', '4 place Stanislas', 'Nancy',
 '7 rue du Faubourg', 'Strasbourg', 18.00, 3, 'termine', 5, 6),

(6, '2026-11-15', '08:15:00', '25 avenue d Italie', 'Paris',
 '6 place du Capitole', 'Toulouse', 48.00, 3, 'prevu', 6, 8),

(7, '2026-10-22', '14:00:00', '11 rue Faidherbe', 'Lille',
 '9 rue Nationale', 'Rouen', 20.00, 4, 'termine', 7, 10),

(8, '2026-11-20', '09:00:00', '18 cours Lafayette', 'Lyon',
 '1 place Massena', 'Nice', 37.00, 3, 'prevu', 8, 12),

(9, '2026-10-30', '16:00:00', '40 boulevard Voltaire', 'Paris',
 '12 rue Nationale', 'Orleans', 16.00, 3, 'termine', 1, 1),

(10, '2026-11-02', '11:00:00', '15 rue de Metz', 'Toulouse',
 '8 rue Paradis', 'Marseille', 32.00, 3, 'annule', 3, 3);


-- =========================================================
-- ETAPES
-- =========================================================

INSERT INTO etape
(id_trajets, numero_ordre, ville_etape, adresse_etape, heure_passage)
VALUES
(1, 1, 'Auxerre', 'Place de la Gare', '09:45:00'),
(1, 2, 'Dijon', '10 avenue Foch', '11:30:00'),

(2, 1, 'Orleans', 'Place d Arc', '11:00:00'),
(2, 2, 'Tours', 'Rue Nationale', '12:30:00'),

(3, 1, 'Arras', 'Place de la Gare', '08:30:00'),

(4, 1, 'Valence', 'Avenue Victor Hugo', '11:15:00'),
(4, 2, 'Avignon', 'Boulevard Saint-Roch', '12:30:00'),

(5, 1, 'Sarrebourg', 'Place de la Gare', '14:45:00'),

(6, 1, 'Orleans', 'Place de la Gare', '10:00:00'),
(6, 2, 'Limoges', 'Avenue Garibaldi', '13:00:00'),

(7, 1, 'Amiens', 'Rue de la Republique', '15:15:00'),

(8, 1, 'Grenoble', 'Place Victor Hugo', '10:30:00'),

(9, 1, 'Etampes', 'Place du Port', '17:00:00');


-- =========================================================
-- RESERVATIONS
-- =========================================================

INSERT INTO reserver
(id_utilisateurs, id_trajets, date_reservation,
 nombre_places_reservees, statut_reservation)
VALUES
(4, 1, '2026-09-01', 1, 'confirmee'),
(7, 1, '2026-09-03', 1, 'confirmee'),
(11, 1, '2026-09-05', 1, 'confirmee'),

(3, 2, '2026-09-08', 1, 'confirmee'),
(9, 2, '2026-09-10', 1, 'confirmee'),
(14, 2, '2026-09-11', 1, 'confirmee'),

(2, 3, '2026-09-15', 1, 'confirmee'),
(5, 3, '2026-09-17', 1, 'confirmee'),

(4, 4, '2026-09-25', 1, 'confirmee'),
(13, 4, '2026-09-26', 1, 'confirmee'),

(1, 5, '2026-10-01', 1, 'confirmee'),
(7, 5, '2026-10-02', 1, 'confirmee'),
(15, 5, '2026-10-04', 1, 'confirmee'),

(3, 6, '2026-11-01', 1, 'confirmee'),
(11, 6, '2026-11-03', 1, 'en_attente'),

(2, 7, '2026-10-14', 1, 'confirmee'),
(6, 7, '2026-10-15', 1, 'confirmee'),
(9, 7, '2026-10-16', 1, 'confirmee'),

(5, 8, '2026-11-04', 1, 'confirmee'),
(14, 8, '2026-11-05', 1, 'en_attente'),

(8, 9, '2026-10-20', 1, 'confirmee'),
(13, 9, '2026-10-21', 1, 'confirmee'),

(4, 10, '2026-10-25', 1, 'annulee');


-- =========================================================
-- EVALUATIONS
-- =========================================================

INSERT INTO evaluer
(id_utilisateurs_evalue, id_utilisateurs_auteur,
 id_trajets, note, commentaire, date_evaluation)
VALUES
(1, 4, 1, 5, 'Conducteur ponctuel', '2026-09-11'),
(4, 1, 1, 5, 'Passagere agreable', '2026-09-11'),
(1, 7, 1, 4, 'Tres bon trajet', '2026-09-11'),

(2, 3, 2, 5, 'Conduite tres agreable', '2026-09-19'),
(3, 2, 2, 4, 'Passager ponctuel', '2026-09-19'),
(2, 9, 2, 4, 'Bon conducteur', '2026-09-19'),

(3, 2, 3, 5, 'Trajet parfait', '2026-09-26'),
(2, 3, 3, 5, 'Tres sympathique', '2026-09-26'),

(5, 4, 4, 4, 'Bonne conduite', '2026-10-04'),
(4, 5, 4, 5, 'Passagere respectueuse', '2026-10-04'),
(5, 13, 4, 5, 'Excellent trajet', '2026-10-04'),

(6, 1, 5, 4, 'Conductrice ponctuelle', '2026-10-11'),
(1, 6, 5, 5, 'Passager sympathique', '2026-10-11'),

(10, 2, 7, 5, 'Tres bonne experience', '2026-10-23'),
(2, 10, 7, 4, 'Voyage agreable', '2026-10-23'),
(10, 6, 7, 4, 'Conductrice sympathique', '2026-10-23'),

(1, 8, 9, 5, 'Trajet rapide', '2026-10-31'),
(8, 1, 9, 5, 'Passagere tres agreable', '2026-10-31');
