SELECT 'TRIGGER atualizaLocal';
SELECT * FROM Jogo;
INSERT INTO Jogo(idJogo, local, data, hora, golosVisitada, golosVisitante, tipo, anoEpoca, visitada, visitante, idEstadio) 
    VALUES (9999, NULL, "4/4/2003", "18:00", 1, 1, "meia-final", "2003/2004", "porto", "lazio", 12);
SELECT * FROM Jogo;