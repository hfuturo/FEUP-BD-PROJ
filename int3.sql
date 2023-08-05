.mode columns
.headers on
.nullvalue NULL

select round(avg(minuto), 2) as "Tempo medio para fazer um golo"
from Golo;