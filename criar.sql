DROP TABLE IF EXISTS Treinador;
DROP TABLE IF EXISTS Golo;
DROP TABLE IF EXISTS Falta;
DROP TABLE IF EXISTS Substituicao;
DROP TABLE IF EXISTS Cartao;
DROP TABLE IF EXISTS RecompensaVisitada;
DROP TABLE IF EXISTS RecompensaVisitante;
DROP TABLE IF EXISTS JogoArbitro;
DROP TABLE IF EXISTS JogadorEquipa;
DROP TABLE IF EXISTS Arbitro;
DROP TABLE IF EXISTS Jogo;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS Epoca;
DROP TABLE IF EXISTS Estadio;
DROP TABLE IF EXISTS Jogador;

CREATE TABLE Equipa (
    nome TEXT PRIMARY KEY,
    cidade TEXT NOT NULL,
    pais TEXT NOT NULL,
    corEquipamento TEXT NOT NULL
);

CREATE TABLE Treinador (
    idTreinador INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    dataNascimento TEXT NOT NULL,
    nacionalidade TEXT NOT NULL,
    nomeEquipa TEXT NOT NULL,
    FOREIGN KEY(nomeEquipa) REFERENCES Equipa(nome) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Jogador (
    idJogador INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    dataNascimento TEXT NOT NULL,
    nacionalidade TEXT NOT NULL,
    numero INTEGER CHECK(numero > 0 AND numero < 100),
    alcunha TEXT NOT NULL,
    posicao TEXT NOT NULL
);

CREATE TABLE Estadio (
    idEstadio INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    pais TEXT NOT NULL,
    cidade TEXT NOT NULL,
    lotacao INTEGER CHECK (lotacao > 0)
);

CREATE TABLE Epoca (
    ano TEXT PRIMARY KEY
);

CREATE TABLE Jogo (
    idJogo INTEGER PRIMARY KEY,
    local TEXT,
    data TEXT NOT NULL, 
    hora TEXT NOT NULL,
    golosVisitada INTEGER NOT NULL CHECK (golosVisitante >= 0),
    golosVisitante INTEGER NOT NULL CHECK (golosVisitada >= 0),
    tipo TEXT NOT NULL,
    anoEpoca INTEGER NOT NULL,
    visitada TEXT NOT NULL,
    visitante TEXT NOT NULL,
    idEstadio INTEGER NOT NULL,
    CHECK(visitada <> visitante),
    FOREIGN KEY(anoEpoca) REFERENCES Epoca(ano) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(visitada) REFERENCES Equipa(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(visitante) REFERENCES Equipa(nome) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idEstadio) REFERENCES Estadio(idEstadio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Golo (
    idGolo INTEGER PRIMARY KEY,
    minuto INTEGER NOT NULL CHECK (minuto > 0),
    idJogador INTEGER NOT NULL,
    nome TEXT NOT NULL,
    FOREIGN KEY(idJogador) REFERENCES Jogador(idJogador) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nome) REFERENCES Equipa(nome) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Falta (
    idFalta INTEGER PRIMARY KEY,
    minuto INTEGER NOT NULL CHECK (minuto > 0),
    idJogador INTEGER NOT NULL,
    FOREIGN KEY(idJogador) REFERENCES Jogador(idJogador) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Substituicao (
    idSubstituicao INTEGER PRIMARY KEY,
    minuto INTEGER NOT NULL CHECK (minuto > 0),
    entra INTEGER NOT NULL,
    sai INTEGER NOT NULL,
    CHECK (entra <> sai),
    FOREIGN KEY(entra) REFERENCES Jogador(idJogador) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(sai) REFERENCES Jogador(idJogador) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cartao (
    idCartao INTEGER PRIMARY KEY,
    minuto INTEGER NOT NULL CHECK (minuto > 0),
    cor TEXT NOT NULL,
    idJogador INTEGER NOT NULL,
    FOREIGN KEY(idJogador) REFERENCES Jogador(idJogador)  ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Arbitro (
    idArbitro INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    dataNascimento TEXT NOT NULL,
    nacionalidade TEXT NOT NULL,
    federacao TEXT NOT NULL
);


CREATE TABLE RecompensaVisitada (
    idJogo INTEGER PRIMARY KEY,
    recompensaVisitada INTEGER NOT NULL CHECK (recompensaVisitada >= 0),
    visitada TEXT NOT NULL,
    FOREIGN KEY(visitada) REFERENCES Equipa(nome) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RecompensaVisitante (
    idJogo INTEGER PRIMARY KEY,
    recompensaVisitante INTEGER NOT NULL CHECK (recompensaVisitante >= 0),
    visitante TEXT NOT NULL,
    FOREIGN KEY(visitante) REFERENCES Equipa(nome) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE JogoArbitro (
    idJogo INTEGER NOT NULL,
    idArbitro INTEGER NOT NULL,
    FOREIGN KEY(idJogo) REFERENCES Jogo(idJogo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idArbitro) REFERENCES Arbitro(idArbitro) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE JogadorEquipa (
    idJogador INTEGER NOT NULL,
    nome TEXT NOT NULL,
    FOREIGN KEY(idJogador) REFERENCES Jogador(idJogador) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nome) REFERENCES Equipa(nome) ON DELETE CASCADE ON UPDATE CASCADE
);