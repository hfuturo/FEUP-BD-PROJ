.mode columns
.headers on
.nullvalue NULL

select j.nome as Nome, g.golos as Golos
from(
    select idJogador, count(*) as golos
    from Golo
    group by idJogador
)g, Jogador j
where g.idJogador = j.idJogador and g.golos = (
    select count(*) as golos
    from Golo
    group by idJogador
    order by golos desc
    limit 1
)
order by j.nome asc;