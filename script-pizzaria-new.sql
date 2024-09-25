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





	-- adicionar uma coluna 
	alter table pizzas add column custo decimal(15,2);

	-- alterar o tipo de dados de uma coluna 
	alter table clientes modify tel varchar(14);
    
    -- alterar o nome E tipo de dados de uma coluna 
	alter table clientes change  tel telefone varchar(14);

	-- odernar 
	select * from clientes order by bairro;

	delete  from clientes where id = 2;


	-- apagar coluna da tabela 
	alter table clientes drop desconto;

	-- exibir tabelas
	show tables;

	-- exibir a estrutura da tabela 
	describe clientes;

	-- deletar tabela
	drop table if exists pizzas;

	-- alterar tabela adicionar 
	alter table pedidos add foreign key (cliente_id) references clientes (id); 

	-- alterar  a FORMA DE EXIBIÇÃO 
	select id as codigo, nome, valor as 'Valor R$' from pizzas;

	-- adicionar coluna 
	alter table clientes add columndesconto decimal(15,2);

	select *,((valor*10)/100) + valor as '+10%' from pizzas;


	-- operações aritméticas 
	select 10 + 3, 10 - 3, 10 * 3;

	select 10 + 3 as SOMA, 10 - 3 as SUBTRAÇÃO;
    
    -- atualizar de forma automática o custo
    update pizzas set custo = valor * 0.60;
    select * from pizzas;
    
		-- condição where
		-- selecione as pizzas com o valor maior que $17
		select * from pizzas where valor > 17;
        
        -- selecione as pizzas com o valor maior ou igual a $17
		select * from pizzas where valor >= 17;
        
        -- selecione as pizzas com o valor menor que $17
		select * from pizzas where valor < 17;
        
        -- selecione as pizzas com o valor menor ou igual a $17
		select * from pizzas where valor <= 17;
        
        -- selecione as pizzas com o valor igual a $17
		select * from pizzas where valor = 17;
        
		-- selecione as pizzas com o valor diferentes de $17
        select * from pizzas where valor != 17;
        
        -- selecione as pizzas com o valor nulo
        select * from pizzas where valor is null;
        
        -- selecione as pizzaas com o valor entre 15 e 20| ou qualquer valor 
        select * from pizzas where valor  > 15 and valor < 20;
        select * from pizzas where valor between 16 and 19;
        
        
        
         -- selecione as pizzas com o valor maior ou menor que 17
         select * from pizzas where valor <17 or valor > 17;
         
         -- selecione as pizzas com o valor nem maiores nem menores que 17
         select * from pizzas where not (valor <17 or valor >17);
         
          -- selecione as pizzaas onde o valor não está entre 15 e 20| ou qualquer valor 
			select * from pizzas where not  (valor  >= 17 and valor <= 20);
			select * from pizzas where valor between 17 and 20;
          
          -- selecione as pizzaas onde os valores são iguais  a 15 e 20
			select * from pizzas where valor = 15 or valor = 20;
            select * from pizzas where valor in (15,20,99);
            
		-- selecione as pizzaas onde os valores são diferentes de 15 e 20
			select * from pizzas where valor != 15 and valor !=20;
            select * from pizzas where valor not in (15,20);
            
		-- selecione as pizzaas com os valores não nulos
         select * from pizzas where valor is not null;
         select * from pizzas where valor > 0;
         
         -- selecione as pizzas que começam coma letra E 
         select * from pizzas where nome like 'E%';
         
          -- selecione as pizzas que terminam com a letra a
		select * from pizzas where nome like '%a';
        
         -- selecione as pizzas que tenham as letras "eza"
         	select * from pizzas where nome like '%esa%';
            
              
        -- ordernar por ordem alfabética
        select * from pizzas order by nome;
        
          
        -- ordernar por nome valor das pizzas em ordem dercrescente de valor e o nome em ordem alfabética
        select * from pizzas order by valor desc, nome;
        
        -- limitar a quantidade de exibições 
        select * from pizzas order by valor desc limit 2;
         
		-- selecionar apenas os valores distintos 
        select distinct valor from pizzas order by valor; 
            
            
        
        
        
        
    
   
    
    


