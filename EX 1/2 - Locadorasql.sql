USE Locadora

/*
1) Consultar num_cadastro do cliente, nome do cliente, data_locacao (Formato
dd/mm/aaaa), Qtd_dias_alugado (total de dias que o filme ficou alugado), titulo do
filme, ano do filme da locação do cliente cujo nome inicia com Matilde
*/
SELECT c.num_cadastro, c.nome, CONVERT(CHAR(10), loc.data_locacao, 103) AS data_loc, CONVERT(CHAR(10), loc.data_devolucao, 103) AS data_dev,
CAST(CAST(CONVERT(CHAR(2), loc.data_devolucao, 103) AS INT) - CAST(CONVERT(CHAR(2), loc.data_locacao, 103) AS INT) AS INT) AS Qtd_dias_alugado,
f.titulo, f.ano
FROM Cliente c
INNER JOIN Locacao loc
ON c.num_cadastro = loc.Clientenum_cadastro
INNER JOIN DVD d
ON loc.DVDnum = d.num
INNER JOIN Filme f
ON d.Filmeid = f.id
WHERE c.nome LIKE 'Matilde%'

/*
2) Consultar nome da estrela, nome_real da estrela, título do filme dos filmes
cadastrados do ano de 2015
*/

SELECT e.nome, e.nome_real, f.titulo
FROM Estrela e
INNER JOIN Filme_Estrela fe
ON e.id = fe.Estrelaid
INNER JOIN Filme f
ON fe.Filmeid = f.id
WHERE f.ano = 2015

/*
3) Consultar título do filme, data_fabricação do dvd (formato dd/mm/aaaa), caso a
diferença do ano do filme com o ano atual seja maior que 6, deve aparecer a diferença
do ano com o ano atual concatenado com a palavra anos (Exemplo: 7 anos), caso
contrário só a diferença (Exemplo: 4).
*/

SELECT f.titulo, CONVERT(CHAR(10), d.data_fabricacao, 103) AS data_fabricacao_dvd,
		CASE WHEN (CAST( CONVERT( CHAR(4), GETDATE(), 112 ) - f.ano AS INT) > 6)
			THEN CAST(CAST(CONVERT(CHAR(4), GETDATE(), 112) AS INT) - f.ano AS VARCHAR) + ' anos'
			ELSE CAST(CAST(CONVERT(CHAR(4), GETDATE(), 112) AS INT) - f.ano AS VARCHAR)
		END AS diff_anos
FROM Filme f
INNER JOIN DVD d
ON f.id = d.Filmeid
