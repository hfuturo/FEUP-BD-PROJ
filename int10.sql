.mode columns
.headers on
.nullvalue NULL

select a.nome as Nome, count(*) as "Numero de jogos arbitrados"
from Arbitro a, JogoArbitro ja
where a.idArbitro = ja.idArbitro and a.nome = "jose silva"
group by Nome;