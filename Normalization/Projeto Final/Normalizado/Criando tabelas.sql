CREATE TABLE CLIENTES(
    COD_CLIENTE VARCHAR(10) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	RUA VARCHAR(50) NOT NULL,
	BAIRRO VARCHAR(50) NOT NULL,
	CIDADE VARCHAR(50) NOT NULL,
	ESTADO VARCHAR(50) NOT NULL,
PRIMARY KEY (COD_CLIENTE)
);

CREATE TABLE TELEFONES_CLIENTES (
    COD_TELEFONE VARCHAR(10) NOT NULL,
    COD_CLIENTE VARCHAR(10) NOT NULL,
    TELEFONES VARCHAR(15) NOT NULL,
PRIMARY KEY (COD_TELEFONE),
CONSTRAINT FK_TELEFONESCLIENTES_CLIENTES FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTES(COD_CLIENTE)
);

CREATE TABLE EDITORAS(
	COD_EDITORA VARCHAR(10) NOT NULL,
    TELEFONE VARCHAR(50),
    EMAIL VARCHAR(50),
    NOME_CONTATO VARCHAR(50) NOT NULL,
PRIMARY KEY (COD_EDITORA)
);


CREATE TABLE AUTORES(
    COD_AUTOR VARCHAR(10) NOT NULL,
    AUTOR VARCHAR(25) NOT NULL,
    EMAIL VARCHAR(50),
PRIMARY KEY (COD_AUTOR)
);

CREATE TABLE LIVROS(
    COD_LIVRO VARCHAR(10) NOT NULL,
	VALOR DECIMAL(5,2) NOT NULL,
	ANO_PUBLICACAO INT NOT NULL,
    CATEGORIA VARCHAR(25) NOT NULL,
    TITULO VARCHAR(50) NOT NULL,
    ISBN INT NOT NULL,
    COD_AUTOR VARCHAR(10) NOT NULL,
	COD_EDITORA VARCHAR(10) NOT NULL,
	QTD_ESTOQUE INT NOT NULL,
PRIMARY KEY (COD_LIVRO),
CONSTRAINT FK_LIVROS_EDITORAS FOREIGN KEY (COD_EDITORA) REFERENCES EDITORAS(COD_EDITORA),
CONSTRAINT FK_LIVROS_AUTORES FOREIGN KEY (COD_AUTOR) REFERENCES AUTORES(COD_AUTOR)
);

CREATE TABLE LOJAS(
    COD_LOJA VARCHAR(10) NOT NULL,
    LOJA VARCHAR(50),
PRIMARY KEY (COD_LOJA)
);


CREATE TABLE PEDIDOS(
    COD_PEDIDO VARCHAR(10) NOT NULL,
    COD_CLIENTE VARCHAR(20) NOT NULL,
    COD_LOJA VARCHAR(20) NOT NULL,
    DATA DATE NOT NULL,
	VALOR_PEDIDO DECIMAL(5,2) NOT NULL,
PRIMARY KEY (COD_PEDIDO),
CONSTRAINT FK_PEDIDOS_CLIENTE FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTES(COD_CLIENTE)
CONSTRAINT FK_PEDIDOS_LOJA FOREIGN KEY (COD_LOJA) REFERENCES LOJAS(COD_LOJA)
);

CREATE TABLE ITENS_PEDIDOS(
    COD_PEDIDO VARCHAR(10) NOT NULL,
	COD_LIVRO VARCHAR(10) NOT NULL,
	QTD_PEDIDO INT NOT NULL,
	VALOR_ITENS DECIMAL(5,2) NOT NULL,
PRIMARY KEY (COD_PEDIDO,COD_LIVRO),
CONSTRAINT FK_ITENSPEDIDOS_LIVRO FOREIGN KEY (COD_LIVRO) REFERENCES LIVROS(COD_LIVRO),
CONSTRAINT FK_ITENSPEDIDOS_PEDIDOS FOREIGN KEY (COD_PEDIDO) REFERENCES COD_PEDIDO(COD_PEDIDO)
);

CREATE TABLE COLABORADORES (
    COD_COLAB VARCHAR(10) NOT NULL,
    NOME VARCHAR(100) NOT NULL,
PRIMARY KEY (COD_COLAB)
);

CREATE TABLE SALARIOSCARGOS (
    COD_SAL_CAR VARCHAR(10) NOT NULL,
    DEPARTAMENTO VARCHAR(50) NOT NULL,
    CARGO VARCHAR(50) NOT NULL,
    SALARIO_BASE DECIMAL(10, 2) NOT NULL,
PRIMARY KEY (COD_SAL_CAR)
);

CREATE TABLE COLABORADORES_CARGOS(
    COD_COLAB VARCHAR(10) NOT NULL,
    COD_SAL_CAR VARCHAR(10) NOT NULL,
PRIMARY KEY (COD_COLAB, COD_SAL_CAR)
CONSTRAINT FK_COLABORADORESCARGOS_COLABORADORES FOREIGN KEY (COD_COLAB) REFERENCES COLABORADORES(COD_COLAB),
CONSTRAINT FK_COLABORADORESCARGOS_SALARIOSCARGOS FOREIGN KEY (COD_SAL_CAR) REFERENCES SALARIOSCARGOS(COD_SAL_CAR)
);


CREATE TABLE DEPENDENTES (
    COD_DEP VARCHAR(10) NOT NULL,
    COD_COLAB  VARCHAR(10) NOT NULL,
    DEPENDENTES VARCHAR(50) NOT NULL,
PRIMARY KEY (COD_DEP),
CONSTRAINT FK_DEPENDENTES_COLABORADORES FOREIGN KEY (COD_COLAB) REFERENCES COLABORADORES(COD_COLAB)
);

CREATE TABLE FORNECEDORES(
    COD_FORN VARCHAR(10) NOT NULL,
    FORNECEDOR VARCHAR(50),
PRIMARY KEY (COD_FORN)
);    

CREATE TABLE FORNECEDOR_LOJA(
    COD_FORN VARCHAR(10) NOT NULL,
    COD_LOJA VARCHAR(10) NOT NULL,
PRIMARY KEY (COD_FORN,COD_LOJA),
CONSTRAINT FK_FORNECEDORLOJA_FORNECEDORES FOREIGN KEY (COD_FORN) REFERENCES FORNECEDORES(COD_FORN),
CONSTRAINT FK_FORNECEDORLOJA_LOJAS FOREIGN KEY (COD_LOJA) REFERENCES LOJAS(COD_LOJA)
);   

CREATE TABLE FORNECEDOR_EDITORA(
    COD_FORN VARCHAR(10) NOT NULL,
    COD_EDITORA VARCHAR(50) NOT NULL,
PRIMARY KEY (COD_FORN,COD_EDITORA),
CONSTRAINT FK_FORNECEDOREDITORA_FORNECEDORES FOREIGN KEY (COD_FORN) REFERENCES FORNECEDORES(COD_FORN),
CONSTRAINT FK_FORNECEDOREDITORA_EDITORAS FOREIGN KEY (COD_EDITORA) REFERENCES EDITORAS(COD_EDITORA)
);   

CREATE TABLE LOJA_EDITORA(
    COD_LOJA VARCHAR(10) NOT NULL,
    COD_EDITORA VARCHAR(10) NOT NULL,
PRIMARY KEY (COD_LOJA,COD_EDITORA),
CONSTRAINT FK_LOJAEDITORA_LOJAS FOREIGN KEY (COD_LOJA) REFERENCES LOJAS(COD_LOJA),
CONSTRAINT FK_LOJAEDITORA_EDITORAS FOREIGN KEY (COD_EDITORA) REFERENCES EDITORAS(COD_EDITORA)
);   