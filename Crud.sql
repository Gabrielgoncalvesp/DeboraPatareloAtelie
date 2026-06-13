--Utilizando todas as operações do CRUD
-- CREATE
INSERT INTO ateliedb.cliente
(nome, cpf, email, data_nasc, rua, numero, bairro, cidade, estado, cep)
VALUES
('Marcos Vinicius Almeida', '222.222.222-22', 'marcos.almeida@email.com', '1998-04-15', 'Rua São Paulo', '150', 'Centro', 'Franca', 'SP', '14400-100');

-- READ
SELECT *
FROM ateliedb.cliente
WHERE cpf = '222.222.222-22';

-- UPDATE
UPDATE ateliedb.cliente
SET email = 'marcos.v.almeida@email.com'
WHERE cpf = '222.222.222-22';

-- READ (para mostrar a alteração)
SELECT *
FROM ateliedb.cliente
WHERE cpf = '222.222.222-22';

-- DELETE
DELETE FROM ateliedb.cliente
WHERE cpf = '222.222.222-22';

-- READ (para mostrar que foi removido)
SELECT *
FROM ateliedb.cliente
WHERE cpf = '222.222.222-22';
