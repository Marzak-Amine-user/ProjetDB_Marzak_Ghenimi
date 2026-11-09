-- Interrogation de la base de données
-- Mini-projet BDD - Plateforme de covoiturage
-- Mohammed Amine Marzak / Ridha Ghenimi

-- Scénario :
-- Un analyste de la plateforme souhaite étudier l'activité du service :
-- trajets proposés, villes desservies, réservations, conducteurs
-- et évaluations des utilisateurs.


-- =========================================================
-- 1. PROJECTIONS ET SELECTIONS
-- =========================================================


-- Q1 : Afficher les trajets prévus, classés par date de départ.

SELECT id_trajets,
       ville_depart,
       ville_arrivee,
       date_depart,
       prix_place
FROM trajets
WHERE statut_trajet = 'prevu'
ORDER BY date_depart;


-- Q2 : Afficher les différentes villes de départ utilisées.

SELECT DISTINCT ville_depart
FROM trajets
ORDER BY ville_depart;


-- Q3 : Rechercher les utilisateurs utilisant une adresse Gmail.

SELECT id_utilisateurs,
       nom,
       prenom,
       email
FROM utilisateurs
WHERE email LIKE '%@gmail.com'
ORDER BY nom;


-- Q4 : Afficher les trajets partant de Paris, Lyon ou Lille.

SELECT id_trajets,
       ville_depart,
       ville_arrivee,
       prix_place
FROM trajets
WHERE ville_depart IN ('Paris', 'Lyon', 'Lille')
ORDER BY ville_depart;


-- Q5 : Afficher les trajets dont le prix est compris entre 20 et 40 euros.

SELECT id_trajets,
       ville_depart,
       ville_arrivee,
       prix_place
FROM trajets
WHERE prix_place BETWEEN 20 AND 40
ORDER BY prix_place;


-- =========================================================
-- 2. FONCTIONS D'AGREGATION
-- =========================================================


-- Q6 : Compter le nombre de trajets proposés depuis chaque ville.

SELECT ville_depart,
       COUNT(*) AS nombre_trajets
FROM trajets
GROUP BY ville_depart
ORDER BY nombre_trajets DESC;


-- Q7 : Calculer le prix moyen des trajets pour chaque ville de départ.

SELECT ville_depart,
       AVG(prix_place) AS prix_moyen
FROM trajets
GROUP BY ville_depart
ORDER BY prix_moyen DESC;


-- Q8 : Afficher les trajets ayant au moins deux réservations.

SELECT id_trajets,
       COUNT(*) AS nombre_reservations
FROM reserver
GROUP BY id_trajets
HAVING COUNT(*) >= 2
ORDER BY nombre_reservations DESC;


-- Q9 : Calculer la note moyenne des utilisateurs ayant reçu
-- au moins deux évaluations.

SELECT id_utilisateurs_evalue,
       ROUND(AVG(note), 2) AS note_moyenne,
       COUNT(*) AS nombre_evaluations
FROM evaluer
GROUP BY id_utilisateurs_evalue
HAVING COUNT(*) >= 2
ORDER BY note_moyenne DESC;


-- Q10 : Afficher les villes de départ dont le prix moyen
-- des trajets est supérieur à 25 euros.

SELECT ville_depart,
       ROUND(AVG(prix_place), 2) AS prix_moyen
FROM trajets
GROUP BY ville_depart
HAVING AVG(prix_place) > 25
ORDER BY prix_moyen DESC;


-- =========================================================
-- 3. JOINTURES
-- =========================================================


-- Q11 : Afficher chaque véhicule avec le nom de son propriétaire.

SELECT v.id_vehicule,
       v.marque,
       v.modele,
       v.immatriculation,
       u.nom,
       u.prenom
FROM vehicule v
INNER JOIN utilisateurs u
    ON v.id_utilisateurs = u.id_utilisateurs
ORDER BY u.nom;


-- Q12 : Afficher chaque trajet avec le nom de son conducteur.

SELECT t.id_trajets,
       t.ville_depart,
       t.ville_arrivee,
       t.date_depart,
       u.nom,
       u.prenom
FROM trajets t
INNER JOIN utilisateurs u
    ON t.id_utilisateurs = u.id_utilisateurs
ORDER BY t.date_depart;


-- Q13 : Afficher les réservations confirmées pour les trajets
-- partant de Paris avec le nom du passager.

SELECT u.nom,
       u.prenom,
       t.ville_depart,
       t.ville_arrivee,
       r.nombre_places_reservees
FROM reserver r
INNER JOIN utilisateurs u
    ON r.id_utilisateurs = u.id_utilisateurs
INNER JOIN trajets t
    ON r.id_trajets = t.id_trajets
WHERE r.statut_reservation = 'confirmee'
  AND t.ville_depart = 'Paris'
ORDER BY u.nom;


-- Q14 : Afficher tous les utilisateurs, même ceux qui n'ont
-- jamais effectué de réservation.

SELECT u.id_utilisateurs,
       u.nom,
       u.prenom,
       r.id_trajets
FROM utilisateurs u
LEFT JOIN reserver r
    ON u.id_utilisateurs = r.id_utilisateurs
ORDER BY u.id_utilisateurs;


-- Q15 : Afficher les trajets avec leur conducteur
-- et le véhicule utilisé.

SELECT t.id_trajets,
       t.ville_depart,
       t.ville_arrivee,
       u.nom AS nom_conducteur,
       u.prenom AS prenom_conducteur,
       v.marque,
       v.modele
FROM trajets t
INNER JOIN utilisateurs u
    ON t.id_utilisateurs = u.id_utilisateurs
INNER JOIN vehicule v
    ON t.id_vehicule = v.id_vehicule
ORDER BY t.id_trajets;


-- =========================================================
-- 4. REQUETES IMBRIQUEES
-- =========================================================


-- Q16 : Afficher les utilisateurs ayant effectué
-- au moins une réservation.

SELECT id_utilisateurs,
       nom,
       prenom
FROM utilisateurs
WHERE id_utilisateurs IN (
    SELECT id_utilisateurs
    FROM reserver
)
ORDER BY nom;


-- Q17 : Afficher les utilisateurs n'ayant jamais effectué
-- de réservation.

SELECT id_utilisateurs,
       nom,
       prenom
FROM utilisateurs
WHERE id_utilisateurs NOT IN (
    SELECT id_utilisateurs
    FROM reserver
)
ORDER BY nom;


-- Q18 : Afficher les utilisateurs ayant reçu
-- au moins une évaluation de 5/5.

SELECT u.id_utilisateurs,
       u.nom,
       u.prenom
FROM utilisateurs u
WHERE EXISTS (
    SELECT 1
    FROM evaluer e
    WHERE e.id_utilisateurs_evalue = u.id_utilisateurs
      AND e.note = 5
)
ORDER BY u.nom;


-- Q19 : Afficher les trajets qui ne possèdent
-- aucune étape intermédiaire.

SELECT t.id_trajets,
       t.ville_depart,
       t.ville_arrivee
FROM trajets t
WHERE NOT EXISTS (
    SELECT 1
    FROM etape e
    WHERE e.id_trajets = t.id_trajets
)
ORDER BY t.id_trajets;


-- Q20 : Afficher les trajets dont le prix est supérieur
-- à tous les trajets partant de Lille.

SELECT id_trajets,
       ville_depart,
       ville_arrivee,
       prix_place
FROM trajets
WHERE prix_place > ALL (
    SELECT prix_place
    FROM trajets
    WHERE ville_depart = 'Lille'
)
ORDER BY prix_place DESC;
