.mode columns
.headers on
.nullvalue NULL

select nome as Equipa, recompensa as Recompensa
from(
    select t.nome as nome, t.recompensa as recompensa
    from (
        select visitada as nome, (recompensaVisitada + recompensaVisitante) as recompensa
        from (
            select visitada, sum(recompensaVisitada) as recompensaVisitada
            from recompensaVisitada
            group by visitada
        ) as ra, (
            select visitante, sum(recompensaVisitante) as recompensaVisitante
            from recompensaVisitante
            group by visitante
        )
        group by nome
    ) t, Equipa e
    where t.nome = e.nome and e.pais = "inglaterra"
) rec
where rec.recompensa = (
    select max(recompensa)
    from (
        select visitada as nome, (recompensaVisitada + recompensaVisitante) as recompensa
        from (
            select visitada, sum(recompensaVisitada) as recompensaVisitada
            from recompensaVisitada
            group by visitada
        ) as ra, (
            select visitante, sum(recompensaVisitante) as recompensaVisitante
            from recompensaVisitante
            group by visitante
        )
        group by nome
    ) t, Equipa e
    where t.nome = e.nome and e.pais = "inglaterra"
);