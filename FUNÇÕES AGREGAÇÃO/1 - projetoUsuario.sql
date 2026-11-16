USE projetoUsuario

/*
Quantos projetos não tem usuários associados a ele. A coluna deve chamar
qty_projects_no_users
*/
SELECT COUNT(p.id) AS qty_projects_no_users
FROM projects p LEFT OUTER JOIN users_has_projects uhp
ON p.id = uhp.projects_id
WHERE uhp.users_id IS NULL

/*
Id do projeto, nome do projeto, qty_users_project (quantidade de usuários por
projeto) em ordem alfabética crescente pelo nome do projeto
*/
SELECT p.id, p.name, COUNT(u.id) AS qty_users_project
FROM projects p INNER JOIN users_has_projects uhp
ON p.id = uhp.projects_id
INNER JOIN users u
ON uhp.users_id = u.id
GROUP BY p.id, p.name
ORDER BY p.name ASC