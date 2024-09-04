create database redes_sociais;
use redes_sociais;






-- criando tabela usuarios
create table usuarios(id int not null auto_increment primary key unique, 
nome varchar(100) not null, 
email varchar(100) not null unique , 
data_criacao date not null);

-- criando tabela postagem
create table postagens(id int not null auto_increment primary key,
usuario varchar(100) not null unique,
usuario_id int not null,
texto varchar(255) not null,
data_publicacao date not null, 
imagem varchar(100));


-- criando tabela comentarios
create table comentarios(id int not null auto_increment primary key,
postagens_id int not null,
usuarios_id int not null,
texto varchar(255) not null,
data_criacao date not null,
foreign key (postagens_id) references postagens(id),
foreign key (usuarios_id) references usuarios(id)
);

-- criando tabela curtidas
 create table curtidas( usuario_id int not null,
 postagens_id int not null,
 usuarios_id int not null,
 quantidade_curtidas int not null,
 foreign key (postagens_id) references postagens(id),
 foreign key (usuarios_id) references usuarios(id));
 
 
 
 -- insertando a tabela ususarios
 insert into usuarios(nome, email, data_criacao)
 values('Eduarda', 'eduarda@senai.com', 2023-03-02);
 
 insert into usuarios(nome, email, data_criacao)
 values('Ana Clara', 'ana@senai.com', '2023-02-01');
 

 insert into usuarios(nome, email, data_criacao)
 values('Eduardo', 'edu@senai.com', '2022-10-01');

insert into usuarios(nome, email, data_criacao)
 values('Nicole', 'nicole@senai.com', '2022-08-10');
 
 insert into usuarios(nome, email, data_criacao)
 values('Marina', 'mari@senai.com', '2024-10-12');
 
 
 
insert into postagens(usuario, usuario_id, texto, data_publicacao, imagem)
values('Eduarda', 7, 'Quero as férias novamente', '2024-09-04', '--');



select * from postagens;


