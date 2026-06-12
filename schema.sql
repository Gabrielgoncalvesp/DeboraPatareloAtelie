CREATE SCHEMA IF NOT EXISTS ateliedb;

CREATE TABLE ateliedb.cliente (
    cod_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100),
    data_nasc DATE NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL
);

CREATE TABLE ateliedb.telefone_cliente (
    cod_telefone SERIAL PRIMARY KEY,
    cod_cliente INT NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    FOREIGN KEY (cod_cliente)
        REFERENCES ateliedb.cliente(cod_cliente)
);

CREATE TABLE ateliedb.categoria (
    cod_cat SERIAL PRIMARY KEY,
    nome_cat VARCHAR(50) NOT NULL
);

CREATE TABLE ateliedb.produto (
    cod_prod SERIAL PRIMARY KEY,
    cod_cat INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('DISPONIVEL', 'ESGOTADO', 'SOB_ENCOMENDA')),
    FOREIGN KEY (cod_cat)
        REFERENCES ateliedb.categoria(cod_cat)
);

CREATE TABLE ateliedb.pedido (
    cod_pedido SERIAL PRIMARY KEY,
    cod_cliente INT NOT NULL,
    data_pedido DATE DEFAULT CURRENT_DATE,
    status_pedido VARCHAR(20) NOT NULL
        CHECK (status_pedido IN ('EM_PRODUCAO', 'FINALIZADO', 'ENTREGUE', 'CANCELADO')),
    FOREIGN KEY (cod_cliente)
        REFERENCES ateliedb.cliente(cod_cliente)
);

CREATE TABLE ateliedb.pagamento (
    cod_pgto SERIAL PRIMARY KEY,
    cod_pedido INT UNIQUE NOT NULL,
    forma_pgto VARCHAR(20) NOT NULL
        CHECK (forma_pgto IN ('PIX', 'DINHEIRO', 'CARTAO', 'TRANSFERENCIA')),
    data_pgto DATE DEFAULT CURRENT_DATE,
    valor_pg DECIMAL(10,2) NOT NULL,
    status_pgto VARCHAR(20) NOT NULL
        CHECK (status_pgto IN ('PENDENTE', 'PAGO', 'CANCELADO')),
    FOREIGN KEY (cod_pedido)
        REFERENCES ateliedb.pedido(cod_pedido)
);

CREATE TABLE ateliedb.item_pedido (
    cod_item SERIAL PRIMARY KEY,
    cod_pedido INT NOT NULL,
    cod_prod INT NOT NULL,
    qtd_item INT NOT NULL,
    valor_uni DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cod_pedido)
        REFERENCES ateliedb.pedido(cod_pedido),
    FOREIGN KEY (cod_prod)
        REFERENCES ateliedb.produto(cod_prod)
);
