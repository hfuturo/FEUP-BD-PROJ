.mode columns
.headers on
.nullvalue NULL

select visitada as Equipa, golos as Golos
from (
    select visitada, (golosVisitada + golosVisitante) as golos
    from (
        select visitada, sum(golosVisitante) as golosVisitante
        from Jogo
        group by visitada
    ) va, (
        select visitante, sum(golosVisitada) as golosVisitada
        from Jogo
        group by visitante
    ) ve
    where va.visitada = ve.visitante
)
where golos = (
    select min(golosVisitada + golosVisitante) as golos
    from (
        select visitada, sum(golosVisitante) as golosVisitante
        from Jogo
        group by visitada
    ) va, (
        select visitante, sum(golosVisitada) as golosVisitada
        from Jogo
        group by visitante
    ) ve
    where va.visitada = ve.visitante
);