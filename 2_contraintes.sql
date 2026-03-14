USE projetdb;

ALTER TABLE JOUEUR
ADD CONSTRAINT chk_joueur_niveau
CHECK (niveau >= 0);

ALTER TABLE JOUEUR
ADD CONSTRAINT chk_joueur_pseudo_non_vide
CHECK (TRIM(pseudo) <> '');

ALTER TABLE JOUEUR
ADD CONSTRAINT chk_joueur_email_format
CHECK (email LIKE '%@%.%');

ALTER TABLE PARTIE
ADD CONSTRAINT chk_partie_dates
CHECK (date_fin IS NULL OR date_fin >= date_debut);

ALTER TABLE PARTIE
ADD CONSTRAINT chk_partie_statut
CHECK (statut_partie IN ('planifiee', 'en_cours', 'terminee', 'annulee'));

ALTER TABLE PARTIE
ADD CONSTRAINT chk_partie_mode
CHECK (mode_jeu IN ('solo', 'equipe'));

ALTER TABLE PARTICIPER
ADD CONSTRAINT chk_participer_score
CHECK (score >= 0);

ALTER TABLE PARTICIPER
ADD CONSTRAINT chk_participer_rang
CHECK (rang >= 1);

ALTER TABLE PARTICIPER
ADD CONSTRAINT chk_participer_abandon
CHECK (abandon IN (0, 1));

ALTER TABLE AMITIE
ADD CONSTRAINT chk_amitie_statut
CHECK (statut_amitie IN ('en_attente', 'acceptee', 'refusee', 'bloquee'));