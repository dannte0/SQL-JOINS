USE Locadora

/*
1) Consultar, num_cadastro do cliente, nome do cliente, titulo do filme, data_fabricação
do dvd, valor da locação, dos dvds que tem a maior data de fabricação dentre todos os
cadastrados.
*/
SELECT c.num_cadastro, c.nome, f.titulo, MAX(d.data_fabricacao) AS data_fabricacao, l.valor
FROM cliente c 
INNER JOIN Locacao l
ON c.num_cadastro = l.Clientenum_cadastro
INNER JOIN DVD d
ON l.DVDnum = d.num
INNER JOIN Filme f
ON d.Filmeid = f.id
GROUP BY c.num_cadastro, c.nome, f.titulo, l.valor

/*
2) Consultar Consultar, num_cadastro do cliente, nome do cliente, data de locação
(Formato DD/MM/AAAA) e a quantidade de DVD ́s alugados por cliente (Chamar essa
coluna de qtd), por data de locação
*/


/*
3) Consultar Consultar, num_cadastro do cliente, nome do cliente, data de locação
(Formato DD/MM/AAAA) e a valor total de todos os dvd ́s alugados (Chamar essa
coluna de valor_total), por data de locação
*/


/*
4) Consultar Consultar, num_cadastro do cliente, nome do cliente, Endereço
concatenado de logradouro e numero como Endereco, data de locação (Formato
DD/MM/AAAA) dos clientes que alugaram mais de 2 filmes simultaneamente
*/