CREATE TABLE PokeType (
    PoketypeID INT           IDENTITY PRIMARY KEY,
    Name       NVARCHAR (15) NOT NULL UNIQUE
);

CREATE TABLE Habitat (
    HabitatID INT           IDENTITY PRIMARY KEY,
    Name      NVARCHAR (15) NOT NULL UNIQUE
);

CREATE TABLE Species (
    SpeciesID INT IDENTITY PRIMARY KEY,
    Name      NVARCHAR (15) NOT NULL UNIQUE);

CREATE TABLE Utilisateur (
    UtilisateurID  INT IDENTITY PRIMARY KEY,
    NomUtilisateur NVARCHAR (20)  NOT NULL UNIQUE,
    HashMotDePasse NVARCHAR (200) NOT NULL,
    Courriel       NVARCHAR (100) NOT NULL UNIQUE);


CREATE TABLE Favorites (
    FKPokemonID     INT NOT NULL FOREIGN KEY REFERENCES Pokemon(PokemonID),
    FKUtilisateurID INT NOT NULL FOREIGN KEY REFERENCES Utilisateur(UtilisateurID),
    PRIMARY KEY(FKPokemonID, FKUtilisateurID)
);

CREATE TABLE Pokemon(
    PokemonID int IDENTITY PRIMARY KEY,
    Name nvarchar(15) NOT NULL UNIQUE DEFAULT '',
    HP tinyint NOT NULL DEFAULT 0,
    Attack tinyint NOT NULL DEFAULT 0,
    Defense tinyint NOT NULL DEFAULT 0,
    SpecialAttack tinyint NOT NULL DEFAULT 0,
    SpecialDefense tinyint NOT NULL DEFAULT 0,
    Speed tinyint NOT NULL DEFAULT 0,
    Height decimal(5, 2) NOT NULL DEFAULT 0,
    Weight decimal(5, 2) NOT NULL DEFAULT 0,
    Color int NOT NULL DEFAULT 0,
    FKPoketypeID01 int NOT NULL FOREIGN KEY REFERENCES Poketype(PoketypeID),
    FKPoketypeID02 int  NULL FOREIGN KEY REFERENCES Poketype(PoketypeID),
    FKHabitatID int NOT NULL FOREIGN KEY REFERENCES Habitat(HabitatID),
    FKSpeciesID int NOT NULL FOREIGN KEY REFERENCES Species(SPeciesID),
    EvolvesInto int NULL UNIQUE FOREIGN KEY REFERENCES Pokemon(PokemonID));

