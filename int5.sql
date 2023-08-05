.mode columns
.headers on
.nullvalue NULL

select visitada as Visitada, visitante as Visitante, abs(golosVisitada-golosVisitante) as "Diferenca de golos"
from Jogo
where idJogo in (
    select idJogo
    from (
        select idJogo, max(abs(golosVisitada - golosVisitante)) as DifGolos
        from Jogo
        group by idJogo
    )
    where DifGolos = (
        select max(abs(golosVisitada-golosVisitante)) 
        from Jogo
    )
);