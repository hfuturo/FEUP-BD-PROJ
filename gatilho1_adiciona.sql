CREATE TRIGGER atualizaLocal
AFTER INSERT ON Jogo
FOR EACH ROW
WHEN NEW.local is NULL
BEGIN
    UPDATE Jogo
    SET local = (SELECT cidade from Equipa where NEW.visitada = Equipa.nome)
    WHERE idJogo = NEW.idJogo;
END;