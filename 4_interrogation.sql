USE projetdb;

-- PROJECTIONS

-- Afficher les pseudos et niveaux des joueurs classés du plus élevé au plus faible
SELECT pseudo, niveau
FROM JOUEUR
ORDER BY niveau DESC;

-- Afficher les joueurs dont le niveau est compris entre 15 et 25
SELECT id_joueur, pseudo, niveau
FROM JOUEUR
WHERE niveau BETWEEN 15 AND 25;

-- Afficher les jeux qui sont de type FPS ou Battle Royale
SELECT nom_jeu, genre
FROM JEU
WHERE genre IN ('FPS', 'Battle Royale');

-- Afficher les joueurs dont le pseudo commence par S
SELECT id_joueur, pseudo
FROM JOUEUR
WHERE pseudo LIKE 'S%';

-- Afficher les différents statuts de partie présents dans la base
SELECT DISTINCT statut_partie
FROM PARTIE;

-- AGREGATIONS

-- Calculer le score moyen obtenu dans chaque partie
SELECT id_partie, AVG(score) AS score_moyen
FROM PARTICIPER
GROUP BY id_partie;

-- Calculer le score maximum obtenu dans chaque partie
SELECT id_partie, MAX(score) AS score_maximum
FROM PARTICIPER
GROUP BY id_partie;

-- Compter le nombre de joueurs par équipe
SELECT id_equipe, COUNT(*) AS nombre_joueurs
FROM JOUEUR
WHERE id_equipe IS NOT NULL
GROUP BY id_equipe;

-- Afficher les équipes qui ont au moins 3 joueurs
SELECT id_equipe, COUNT(*) AS nombre_joueurs
FROM JOUEUR
WHERE id_equipe IS NOT NULL
GROUP BY id_equipe
HAVING COUNT(*) >= 3;

-- Afficher les jeux qui ont plus d’une partie enregistrée
SELECT id_jeu, COUNT(*) AS nombre_parties
FROM PARTIE
GROUP BY id_jeu
HAVING COUNT(*) > 1;

-- JOINTURES

-- Afficher chaque joueur avec le nom de son équipe
SELECT j.pseudo, e.nom_equipe
FROM JOUEUR j
LEFT JOIN EQUIPE e ON j.id_equipe = e.id_equipe;

-- Afficher chaque partie avec le nom du jeu correspondant
SELECT p.id_partie, p.statut_partie, g.nom_jeu
FROM PARTIE p
JOIN JEU g ON p.id_jeu = g.id_jeu;

-- Afficher les participations avec le pseudo du joueur et son score
SELECT j.pseudo, pa.id_partie, pa.score, pa.rang
FROM PARTICIPER pa
JOIN JOUEUR j ON pa.id_joueur = j.id_joueur;

-- Afficher les capitaines des équipes
SELECT e.nom_equipe, j.pseudo AS capitaine
FROM EQUIPE e
JOIN JOUEUR j ON e.id_joueur = j.id_joueur;

-- Afficher les parties avec le joueur initiateur et le jeu utilisé
SELECT p.id_partie, j.pseudo, g.nom_jeu, p.mode_jeu
FROM PARTIE p
JOIN JOUEUR j ON p.id_joueur = j.id_joueur
JOIN JEU g ON p.id_jeu = g.id_jeu;

-- REQUETES IMBRIQUEES

-- Afficher les joueurs qui ont participé à au moins une partie
SELECT pseudo
FROM JOUEUR
WHERE id_joueur IN (
    SELECT id_joueur
    FROM PARTICIPER
);

-- Afficher les joueurs qui n’ont participé à aucune partie
SELECT pseudo
FROM JOUEUR
WHERE id_joueur NOT IN (
    SELECT id_joueur
    FROM PARTICIPER
);

-- Afficher les joueurs dont le niveau est supérieur au niveau moyen
SELECT pseudo, niveau
FROM JOUEUR
WHERE niveau > (
    SELECT AVG(niveau)
    FROM JOUEUR
);

-- Afficher les parties dont le score maximum dépasse 1000
SELECT id_partie
FROM PARTIE
WHERE id_partie IN (
    SELECT id_partie
    FROM PARTICIPER
    GROUP BY id_partie
    HAVING MAX(score) > 1000
);

-- Afficher les joueurs qui appartiennent à une équipe ayant un capitaine
SELECT pseudo
FROM JOUEUR j
WHERE EXISTS (
    SELECT 1
    FROM EQUIPE e
    WHERE e.id_equipe = j.id_equipe
      AND e.id_joueur IS NOT NULL
);

