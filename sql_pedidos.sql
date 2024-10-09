drop database if exists pizzaria;

create database if not exists pizzaria;

use pizzaria;

CREATE TABLE Clientes (
	id INt not null AUTO_INCREMENT primary key,
	telefone VARCHAR(14),
	nome VARCHAR(30),
	logradouro VARCHAR(30),
	numero DECIMAL(5,0),
	complemento VARCHAR(30),
	bairro VARCHAR(30),
	referencia VARCHAR(30)
 );

 CREATE TABLE pizzas (
    id INTEGER not null AUTO_INCREMENT primary key,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(15 , 2 )
 );
 
 CREATE TABLE pedidos (
    id INTEGER AUTO_INCREMENT primary key,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(15 , 2 )
 );
 
 alter table pedidos add FOREIGN KEY (cliente_id) REFERENCES Clientes (id);
 
 
 CREATE TABLE itens_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade int,
    valor DECIMAL(15 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizzas (id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedidos (id)
 );
 


INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizzas (nome, valor) VALUES ('Portuguesa', 15),
('Provolone', 17),
('4 Queijos', 20),
('Calabresa', 17);
INSERT INTO pizzas (nome) VALUES ('Escarola');


alter table pizzas modify valor decimal(15,2) default 99;

INSERT INTO pizzas (nome) VALUES ('Moda da Casa');

INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedidos (id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);


INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);


-- Funções de agregação 
-- AVG(coluna) Média dos valores da coluna 
-- COUNT(coluna) Número de linhas
-- MAX(coluna) Maior Valor Da Coluna 
-- MIN(coluna) Menor Valor Da Coluna 
-- SUM(coluna) Soma Dos Valores Da Coluna

describe clientes;

select count(nome) from pizzas;

select avg(valor) as media from pizzas;
select avg(valor) as media from pizzas where nome like "%esa";

-- Qual é o valor da pizza mais cara do cardapio?
	select max(valor) as "maior valor" from pizzas;

-- Qual é o valor da pizza mais barat do cardápio?
	select MIN(valor) as "menor valor" from pizzas;
    
    
-- Qual é o valor total do pedido número 7?
 select sum(valor) from itens_pedido where pedido_id = 7;
 
 select pedido_id as pedido, sum(valor) as "valor pedido" from itens_pedido group by pedido_id;
 
 select pedido_id as pedido, 
 sum(valor) as  "valor pedido",
 sum(quantidade) as "quant pizzas",
 avg(valor) as media,
 sum(valor)/sum(quantidade) as "valor medio"
 from itens_pedido
 group by pedido_id;
 
 -- INNER JOIN: Retorna registros quando há pelo menos uma correspondência em ambas as tabelas 
 select * from clientes as c
 inner join pedidos as p on p.cliente_id = c.id;

-- LEFT JOIN é necessário que o registro tenha pelo menos na primeira tabela
 select * from clientes as c
 left join pedidos as p on p.cliente_id = c.id;
 
 select * from clientes as c
 right join pedidos as p on p.cliente_id = c.id;
 
 insert into pedidos(id, data, valor) values(9, '2024-10-02', 0);
 
-- quantos pedidos cada cliente fez no total?
select nome, telefone, count(pedidos.id) from clientes
left join pedidos on clientes.id = pedidos.cliente_id
group by nome, telefone;



-- Quantos pedidos foram feitos no total?
select count(id) as 'total pedidos' from pedidos;

-- Quantos pedidos foram feitos pelo cliente com o nome Alexandre Santos
select count(pedidos.id) as 'total pedidos' from pedidos where cliente_id = 1
;

-- Qual o valor total de todos os pedidos feitos até agora?
select sum(valor) as 'valor total'from pedidos;

 
