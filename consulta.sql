--- Fazendo consulta entre as tabelas e evidenciando seus relacioanementos
--- usando SELECT, WHERE e ORDER BY ---


-- Primeiro relacionamento tabela cliente e pedidos
-- Um cliente possui vários pedidos, mas um pedido é possuido por apenas um ateliedb.cliente

SELECT c.nome, c.email, p.cod_pedido, p.data_pedido, p.status_pedido
FROM ateliedb.cliente c
JOIN ateliedb.pedido p ON c.cod_cliente = p.cod_cliente
WHERE p.status_pedido = 'FINALIZADO'
ORDER BY p.data_pedido;

-- Relacionamento tabela produto e categoria
-- Um produto esta alocada a apenas uma categoria e uma categoria aloca vários produtos

SELECT pr.nome, pr.preco, pr.estoque, pr.status, cat.nome_cat
FROM ateliedb.produto pr
JOIN ateliedb.categoria cat ON pr.cod_cat = cat.cod_cat
WHERE pr.status = 'DISPONIVEL'
ORDER BY cat.nome_cat, pr.nome;
