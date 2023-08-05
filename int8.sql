.mode columns
.headers on
.nullvalue NULL

select round(((casa.jogos * 1.0) / total.jogos * 100), 2) as Vitorias, 
    round(((empate.jogos * 1.0) / total.jogos * 100),2) as Empates, 
    round(((fora.jogos * 1.0) / total.jogos * 100), 2) as Derrotas
from (
    select count(*) as jogos 
    from Jogo 
    where (golosVisitada > golosVisitante)
) as casa, (
    select count(*) as jogos
    from Jogo
    where (golosVisitada = golosVisitante)
) as empate, (
    select count(*) as jogos
    from Jogo
    where (golosVisitada < golosVisitante)
) as fora, (
    select count(*) as jogos
    from Jogo
) as total;