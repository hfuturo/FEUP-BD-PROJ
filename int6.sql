.mode columns
.headers on
.nullvalue NULL

select j.nome as Nome, t.Substituicoes
from (
    select sai as player, count(*) as Substituicoes
    from (
        select sai
        from Substituicao
        UNION ALL
        select entra
        from Substituicao
    )
    group by player
) t, Jogador j
where t.player = j.idJogador and t.Substituicoes = (
    select count(*) as Substituicoes
    from (
        select sai
        from Substituicao
        UNION ALL
        select entra
        from Substituicao
    )
    group by sai
    order by Substituicoes desc
    limit 1
)
order by Nome asc;