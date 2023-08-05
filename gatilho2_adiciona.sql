CREATE TRIGGER umaFinal
BEFORE INSERT ON Jogo
FOR EACH ROW
WHEN NEW.tipo = "final"
BEGIN
    SELECT RAISE(ABORT, "There can only be one final.")
    WHERE EXISTS (SELECT tipo from Jogo where tipo = "final");
END; 