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

-- Relaciomento tabela pedido e pagamento
-- Um pedido possui um tipo de pagamento
-- Mostrando pedidos com status de "PAGO"
SELECT p.cod_pedido, c.nome, pg.forma_pgto, pg.valor_pg, pg.status_pgto
FROM ateliedb.pedido p
JOIN ateliedb.cliente c ON p.cod_cliente = c.cod_cliente
JOIN ateliedb.pagamento pg ON p.cod_pedido = pg.cod_pedido
WHERE pg.status_pgto = 'PAGO'
ORDER BY pg.valor_pg DESC;

-- Relaciomento tabela item_pedido e produtos
-- Um produto pode aparecer em vários item_pedido e um item_pedido pertence a apenas um produto
SELECT ip.cod_pedido, pr.nome AS produto, ip.qtd_item, ip.valor_uni, ip.subtotal
FROM ateliedb.item_pedido ip
JOIN ateliedb.produto pr ON ip.cod_prod = pr.cod_prod
WHERE ip.qtd_item >= 2
ORDER BY ip.subtotal DESC;

-- Relaciomento tabela cliente e telefone_cliente
-- Um cliente pode ter um ou mais telefones  e um telefone so pode estar associado a um cliente
SELECT c.nome, c.email, t.telefone
FROM ateliedb.cliente c
JOIN ateliedb.telefone_cliente t ON c.cod_cliente = t.cod_cliente
WHERE c.cidade = 'Franca'
ORDER BY c.nome;

-- Relacionamento tabela cliente, pedido e pagamento
-- Um cliente pode realizar um ou mais pedidos e um pedido pertence a apenas um cliente.
-- Cada pedido possui um único pagamento e cada pagamento está associado a apenas um pedido.

SELECT p.cod_pedido, c.nome, p.status_pedido, pg.status_pgto, pg.valor_pg
FROM ateliedb.pedido p
JOIN ateliedb.cliente c ON p.cod_cliente = c.cod_cliente
JOIN ateliedb.pagamento pg ON p.cod_pedido = pg.cod_pedido
WHERE p.status_pedido <> 'CANCELADO'
ORDER BY p.cod_pedido;

-- Relacionamento tabela categoria, produto e item_pedido
-- Uma categoria pode possuir um ou mais produtos e um produto pertence a apenas uma categoria.
-- Um produto pode aparecer em um ou mais itens de pedido e cada item de pedido está associado a apenas um produto.

SELECT cat.nome_cat, pr.nome AS produto, ip.qtd_item, ip.subtotal
FROM ateliedb.item_pedido ip
JOIN ateliedb.produto pr ON ip.cod_prod = pr.cod_prod
JOIN ateliedb.categoria cat ON pr.cod_cat = cat.cod_cat
WHERE ip.subtotal > 100
ORDER BY cat.nome_cat, ip.subtotal DESC;

-- Relacionamento tabela cliente e pedido
-- Um cliente pode realizar um ou mais pedidos e cada pedido pertence a apenas um cliente.
-- Mostrando pedidos de clientes que moram em outras cidades além de Franca.

SELECT c.nome, c.cidade, p.cod_pedido, p.data_pedido, p.status_pedido
FROM ateliedb.cliente c
JOIN ateliedb.pedido p ON c.cod_cliente = p.cod_cliente
WHERE c.cidade <> 'Franca'
ORDER BY c.cidade, p.data_pedido;

-- Relacionamento tabela categoria e produto
-- Uma categoria pode possuir um ou mais produtos e cada produto pertence a apenas uma categoria.
-- Mostrando quais produtos estão com estoque baixo e podem precisar de reposição.

SELECT cat.nome_cat, pr.nome, pr.estoque, pr.status
FROM ateliedb.produto pr
JOIN ateliedb.categoria cat ON pr.cod_cat = cat.cod_cat
WHERE pr.estoque <= 5
ORDER BY pr.estoque ASC;

