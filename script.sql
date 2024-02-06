-- Création de la table Etudiant
CREATE TABLE Etudiant (
    UniqueID INT PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    mot_de_passe VARCHAR(255),
    photo VARCHAR(255)
);

-- Création de la table Session
CREATE TABLE Session (
    UniqueID INT PRIMARY KEY,
    nom VARCHAR(255) UNIQUE
);

-- Création de la table Cours
CREATE TABLE Cours (
    UniqueID INT PRIMARY KEY,
    nom VARCHAR(255),
    date_debut DATE,
    date_fin DATE,
    session_id INT,
    CONSTRAINT fk_cours_session FOREIGN KEY (session_id) REFERENCES Session(UniqueID)
);

-- Création de la table Formateur
CREATE TABLE Formateur (
    UniqueID INT PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    mot_de_passe VARCHAR(255)
);

-- Création de la table Evaluation
CREATE TABLE Evaluation (
    UniqueID INT PRIMARY KEY,
    type VARCHAR(255),
    formateur_id INT,
    cours_id INT,
    CONSTRAINT fk_evaluation_formateur FOREIGN KEY (formateur_id) REFERENCES Formateur(UniqueID),
    CONSTRAINT fk_evaluation_cours FOREIGN KEY (cours_id) REFERENCES Cours(UniqueID)
);

-- Création de la table Note
CREATE TABLE Note (
    UniqueID INT PRIMARY KEY,
    valeur INT,
    etudiant_id INT,
    evaluation_id INT,
    CONSTRAINT fk_note_etudiant FOREIGN KEY (etudiant_id) REFERENCES Etudiant(UniqueID),
    CONSTRAINT fk_note_evaluation FOREIGN KEY (evaluation_id) REFERENCES Evaluation(UniqueID)
    
);
