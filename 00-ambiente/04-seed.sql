insert into laboratorio.teste (id, nome)
select
    n,
    'Pessoa' || n
from generate_series(100, 200) as n;