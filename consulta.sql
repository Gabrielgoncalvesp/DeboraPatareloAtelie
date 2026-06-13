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
