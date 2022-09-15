--- QUESTÃO 4 ------------------------------------------------------------------
select ano_avaliacao, nota, count(nota) as frequencia
from public.avaliacoes
where ano_avaliacao in (2019, 2020)
group by nota, ano_avaliacao
order by ano_avaliacao, nota

--- QUESTÃO 5 ------------------------------------------------------------------
-- Menor nota: Drama
select min(a.nota) as nota_minima, count(a.nota) as frequencia, f.genero
from public.avaliacoes a
inner join
public.filmes f
on a.filme_id = f.filme_id
where f.ano_lancamento in (2011, 2012)
group by f.genero
order by nota_minima asc, frequencia desc
limit 1

-- Ranking geral: Drama
select f.genero, RANK () OVER ( 
		order by avg(a.nota) desc) rank_maior_nota_media
from public.avaliacoes a
inner join
public.filmes f
on a.filme_id = f.filme_id
group by f.genero
order by rank_maior_nota_media asc	


--- QUESTÃO 6 ------------------------------------------------------------------
select avg(a.nota) as nota_media
from public.avaliacoes a
inner join
public.filmes f
on a.filme_id = f.filme_id
inner join
public.usuarios u
on a.usuario_id = u.usuario_id
where f.genero = 'Acao'
and u.sexo = 'F'

