.mode columns
.headers on
.nullvalue NULL

select visitada as Visitada, golosVisitada as "Golos visitada", golosVisitante as "Golos visitante", visitante as Visitante
from Jogo
where tipo = "meia-final";