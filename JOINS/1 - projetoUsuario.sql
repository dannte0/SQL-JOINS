USE projetoUsuario

INSERT INTO users (name, username, password, email) VALUES
('Joao', 'Ti_joao', '123mudar', 'joao@empresa.com')

INSERT INTO projects(name, description, date) VALUES
('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PC`s', '2014-09-12')

/*
1) Id, Name e Email de Users, Id, Name, Description e Data de Projects, dos usuários que
participaram do projeto Name Re-folha
*/

SELECT u.id, u.name, u.email, p.id, p.name AS project_name, p.description, p.date
FROM users u INNER JOIN users_has_projects uhp
ON u.id = uhp.users_id
INNER JOIN projects p 
ON p.id = uhp.projects_id
WHERE p.name = 'Re-folha'

--2) Name dos Projects que não tem Users

SELECT p.name FROM projects p
LEFT OUTER JOIN users_has_projects uhp
ON p.id = uhp.projects_id
WHERE uhp.users_id IS NULL

--3) Name dos Users que não tem Projects

SELECT u.name FROM users u
LEFT OUTER JOIN users_has_projects uhp	
ON u.id = uhp.users_id
WHERE uhp.projects_id IS NULL