CREATE TABLE cliente (
    cod_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100),
    data_nasc DATE,
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(60),
    estado CHAR(2),
    cep VARCHAR(9)
);

CREATE TABLE telefone_cliente (
    cod_telefone SERIAL PRIMARY KEY,
    cod_cliente INT NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    CONSTRAINT fk_telefone_cliente
        FOREIGN KEY (cod_cliente)
        REFERENCES cliente(cod_cliente)
);

CREATE TABLE categoria (
    cod_cat SERIAL PRIMARY KEY,
    nome_cat VARCHAR(50) NOT NULL
);

CREATE TABLE produto (
    cod_prod SERIAL PRIMARY KEY,
    cod_cat INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (cod_cat)
        REFERENCES categoria(cod_cat)
);

CREATE TABLE pedido (
    cod_pedido SERIAL PRIMARY KEY,
    cod_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    status_pedido VARCHAR(20) NOT NULL,
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (cod_cliente)
        REFERENCES cliente(cod_cliente)
);

CREATE TABLE pagamento (
    cod_pgto SERIAL PRIMARY KEY,
    cod_pedido INT UNIQUE NOT NULL,
    forma_pgto VARCHAR(30) NOT NULL,
    data_pgto DATE NOT NULL,
    valor_pg DECIMAL(10,2) NOT NULL,
    status_pgto VARCHAR(20) NOT NULL,
    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (cod_pedido)
        REFERENCES pedido(cod_pedido)
);

CREATE TABLE item_pedido (
    cod_item SERIAL PRIMARY KEY,
    cod_pedido INT NOT NULL,
    cod_prod INT NOT NULL,
    qtd_item INT NOT NULL,
    valor_uni DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_item_pedido
        FOREIGN KEY (cod_pedido)
        REFERENCES pedido(cod_pedido),
    CONSTRAINT fk_item_produto
        FOREIGN KEY (cod_prod)
        REFERENCES produto(cod_prod)
);
