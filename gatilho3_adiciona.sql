CREATE TRIGGER atualizaCorEquipamento
AFTER INSERT ON Equipa
FOR EACH ROW
BEGIN
    UPDATE Equipa
    SET corEquipamento = "branco"
    WHERE nome = "chelsea";
END;