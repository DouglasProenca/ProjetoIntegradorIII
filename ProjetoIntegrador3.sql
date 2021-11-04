-- criação da database
create database if not exists ProjetoIntegrador3;
 
-- comando para usar a tabela
use ProjetoIntegrador3;

-- criação da tabelas
create table if not exists RC_FILIAL(
	empr_id bigInt(20) primary key auto_increment,
	rua varChar(250) not null,
	numero varChar(10) not null,
	bairro varChar(250) not null,
	cidade varChar(250) not null,
	CEP char(10) not null,
	UF char(2) not null,
	id_colaborador bigInt(20) not null,
    data_lançamento date
);

create table if not exists RC_CARGO(
	id bigint(20) primary key auto_increment,
    id_filial bigint(20) not null,
	Nome varchar(250) not null,
    categoria varchar(250) not null,
    cargo varchar(250) not null,
	salario float(20) not null,
	id_colaborador bigInt(20) not null,
	data_ingresso date not null
);

create table if not exists RC_ALUNO(
	id bigint(20) primary key auto_increment,
	id_filial bigint(20) not null,
	nome varchar(250) not null,
	sexo char(10) not null,
	email varchar(250) not null,
	cpf char(14) unique not null, 
	celular varchar(20) not null,
	tel_residencial varchar(20) not null,
	id_colaborador bigint(20) not null
);

create table if not exists RC_TURMA(
	id bigint(20) primary key auto_increment,
	empr_id  bigint(20) not null,
	nome varchar(250) not null,
	id_colaborador bigint(20) not null,
	data_inicio date not null,
	data_fim date not null,
	valor float not null
);

create table if not exists RC_MATRICULA(
	id bigint(20) primary key auto_increment,
	id_turma bigint(20) not null,
	id_pessoa bigInt(20) not null,
	matricula varchar (50) not null,
	ativo char(3) not null,
	dia_venc_mensalidade int not null,
	dt_matricula date not null,
	id_colaborador bigint(20) not null
);

create table if not exists RC_USUARIO(
	id bigInt(20) primary key auto_increment,
	id_cargo bigInt(20) not null unique,
	senha varchar (250) not null,
	id_colaborador bigInt(20) not null
);

create table if not exists RC_PAGAMENTO(
	id bigInt(20) primary key auto_increment,
	id_matricula bigInt(20) not null,
	ano_ref char(4) not null,
	mes_ref char(2) not null,
	data_pagamento date not null,
	juros float,
	forma_pagamento varchar(30) not null,
	valor_pago float not null,
	id_colaborador bigInt(20) not null
);

-- inserts na tabelas 

insert into RC_FILIAL values(null, 'Rua Claudinho Peixoto', '356', 'Vila Mascote', 'São Paulo', '05501-041', 'SP', 1, (select curDate())),
							(null, 'Rua do Bom Jesus', '167', 'Jardim Casa Forte', 'Campina Grande', '60882-193', 'PB', 1, (select curdate())),
                            (null, 'Rua Uruguai', '832', 'Bairro Itajaí', 'Joinville', '13422-246', 'SC', 1, (select curdate())),
                            (null, 'Rua Alvim Dias de Arruda', '27', 'Planalto','Brasília', '09413-100', 'DF', 1, (select curdate())),
                            (null, 'Rua Fenelon Müller.', '1003', 'Chácara dos Pinheiros', 'Belo Horizonte', '14285-220', 'MG', 1, (select curdate())),
                            (null, 'Rua Mário Quintana', '1003', 'Paraiso', 'Recife', '14285-220', 'PE', 1, (select curdate()));


insert into RC_CARGO values (null,1,'Gabriel Machado','EX','Gerente Regional',5000.00,1,(select curdate())),
							(null,2,'Douglas Proença','EX','Gerente Regional',5000.00,1, (select curdate())),
                            (null,3,'Rafael Camilo','EX','Gerente Regional',5000.00,1,(select curdate())),
                            (null,4,'Vinicius Lopes','EX','Gerente Regional',5000.00,1,(select curdate())),
                            (null,1,'Heron Ramos','TI','Suporte Tecnico',2500.00, 1, (select curdate())),
							(null,2,'Gabriel Berloffa','TI','Suporte Tecnico',2500.00, 1, (select curdate())),
                            (null,3,'Ester Alves','TI','Suporte Tecnico',2500.00, 1, (select curdate())),
                            (null,4,'Willians Proença Santos','TI','Suporte Tecnico',2500.00, 1, (select curdate())),
                            (null,1,'Pietra Cirilo','Vendas','Vendedor Regional',1500.00,1, (select curdate())),
							(null,2,'Jaelton Mendes','Vendas','Vendedor Regional',1500.00,1, (select curdate())),
                            (null,3,'Lucas Togni','Vendas','Vendedor Regional',1500.00,1, (select curdate())),
                            (null,4,'Marcelo Gimenez','Vendas','Vendedor Regional',1500.00,1, (select curdate())),
                            (null,1,'Guilherme Pinheiro Campos','Produtos/Serviços/Marketing','Audio Visual',4100.00, 1, (select curdate())),
							(null,2,'Vinicius Ramos','Produtos/Serviços/Marketing','Coordenador',4100.00, 1, (select curdate())),
                            (null,3,'Antonio Silveira','Produtos/Serviços/Marketing','Coordenador',4100.00, 1, (select curdate())),
                            (null,4,'Paulo Tarso','Produtos/Serviços/Marketing','Audio Visual',4100.00, 1, (select curdate())),
                            (null,1,'Amanda Flor','Produtos/Serviços/Marketing','Edição',4100.00, 1, (select curdate())),
                            (null,2,'João Lubarino de Carvalho','Administrativo','Assistente Administrativo',2500.00, 1, (select curdate())),
							(null,3,'Yghor Cardoso da Silva','Administrativo','Assistente Administrativo',2500.00, 1, (select curdate())),
                            (null,4,'William Homem Igrejas','Administrativo','Assistente Administrativo',2500.00, 1, (select curdate())),
                            (null,1,'Stéfane Timote','Administrativo','Assistente Administrativo',2500.00, 1, (select curdate())),
                            (null,2,'Mateus Silva','Administrativo','Assistente Administrativo',2500.00,1, (select curdate()));

insert into RC_TURMA values (null, 1, 'A', 1,'2021-02-21', '2021-11-25', 1500),
							(null, 2, 'C', 2,'2020-07-01', '2021-05-14', 1900),
							(null, 3, 'A', 3, '2018-02-18', '2019-12-10', 2300),
							(null, 4, 'B', 4, '2021-02-12', '2021-09-28', 1150),
							(null, 5, 'D', 5, '2021-05-11', '2022-06-05', 1350);
						
insert into RC_MATRICULA values (null, 1, 1, 'PA1','Sim', 10,'2019-01-14',5),
								(null, 2, 2, 'PC1','Não', 5,'2020-01-02',5),
								(null, 1, 3, 'PA1','Sim', 15,'2019-02-03',5),
								(null, 4, 4, 'PB1','Sim', 10,'2017-02-08',5),
								(null, 2, 5, 'PC2','Não', 5,'2020-01-14',5);
                                
                                
insert into RC_ALUNO values (null, 1,'Carla Moreira','Feminino', 'moreiracarla@hotmail.com', '449.563.201-20', '(11) 98714-2390', '(11) 5615-1900',1),
							 (null, 2,'Anita Dutra Ferraz','Feminino', 'dutraferraz@outlook.com', '309.274.029-71', '(45) 97150-2774', '(45) 1680-8896',2),
                             (null, 4,'Bernardo Azambuja Lima','Masculino', 'limabernar@gmail.com', '757.735.641-73', '(61) 95286-0776', '(61) 6157-1800',4),
                             (null, 5,'Vanessa Mariz Durão','Feminino', 'marizvanessa@gmail.com', '949.851.794-00', '(28) 95286-0776', '(28) 4787-0665', 5),
							 (null, 1,'Amanda Gavioli','Feminino','mandsGavi@terra.com.br','404.936.540-54','(11) 98714-2390','(11) 5615-1900', 1),
							 (null, 3,'Weskley Oliveira','Masculino','weskleysantos@outlook.com','395.054.350-37','(14) 90113-7133', '(14) 4051-6467',3),
							 (null, 4,'Abnoel Andrade','Masculino','abandrade@gmail.com','226.526.880-14','(61) 95286-0776', '(61) 6157-1800',4),
							 (null, 5,'Nathasa Caldeirão','Feminino','natashacald@terra.com.br','386.164.430-45','(28) 95286-0776', '(28) 4787-0665', 5),
                             (null, 5,'Beatriz Malara','Feminino', 'marizvanessa@gmail.com', '722.139.480-62', '(28) 95286-0776', '(28) 4787-0665', 5),
							 (null, 1,'Maria do Carmo de Almeida Russo','Feminino','mandsGavi@terra.com.br','279.288.770-23','(11) 98714-2390','(11) 5615-1900', 1),
							 (null, 2,'Antonio Silveira','Masculino','mat1998@gmail.com','202.709.210-28','(45) 97150-2774', '(45) 1680-8896',  2),
							 (null, 4,'Marcio Silva Santos','Masculino','abandrade@gmail.com','463.096.620-07','(61) 95286-0776', '(61) 6157-1800', 4),
							 (null, 5,'Aline Campos da Cruz','Feminino','natashacald@terra.com.br','202.744.120-47','(28) 95286-0776', '(28) 4787-0665', 5);


insert into RC_USUARIO values(null,1,'0bqE',1),
							 (null,2,'6OdG',1),
                             (null,3,'ejEl',1),
                             (null,4,'PGAL',1),
                             (null,5,'sblf',1),
                             (null,6,'kRW4',1),
                             (null,7,'UtoK',1),
                             (null,8,'ryN8',1),
                             (null,9,'uKwQ',1),
                             (null,10,'Swk1',1),
                             (null,11,'QX4Q',1),
                             (null,12,'q1gu',1),
                             (null,13,'TCab',1),
                             (null,14,'qqC6',1),
                             (null,15,'GBRD',1),
                             (null,16,'WHaf',1),
                             (null,17,'An2C',1),
                             (null,18,'8jkx',1),
                             (null,19,'bEE0',1),
                             (null,20,'AiY5',1),
                             (null,21,'DBmI',1),
                             (null,22,'eGRF',1),
                             (null,23,'wUxP',1),
                             (null,24,'5hCa',1),
                             (null,35,'pS8F',1);
							

insert into rc_pagamento values (null,1, '2020', '04', '2020-04-12', 5, 'Dinheiro', '2500', 1),
								(null,2, '2019', '09', '2021-03-10', 2.5,'Cartão de Débito', '900', 2),
								(null,3,'2020', '11', '2020-12-15', 3,'Cartão de Crédito', '1500', 3),
								(null,4,'2017', '02', '2017-03-20', 2.25,'Boleto Bancário', '800', 4),
								(null,5,'2018', '10', '2018-11-05', 3.5, 'Cheque', '1900', 5);

-- Regras das tabelas

-- alter table RC_FILIAL add constraint FILIAL_USER check (ID_COLABORADOR = (select id from rc_cargo where categoria = 'TI'));
alter table RC_FILIAL add constraint FK_FILIAL_USUARIO foreign key (ID_COLABORADOR) references RC_CARGO (ID);

-- alter table RC_ALUNO add constraint PESSOA_USER check (ID_COLABORADOR = (select id from rc_cargo where categoria = 'Vendas')); 
alter table RC_ALUNO add constraint FK_ALUNO_FILIAL foreign key (ID_FILIAL) references RC_FILIAL (EMPR_ID);    
alter table RC_ALUNO add constraint FK_ALUNO_COLABORADOR foreign key (ID_COLABORADOR) references RC_CARGO (ID);

-- alter table RC_CARGO add constraint CARGO_USER check (ID_COLABORADOR <= 10); -- testar
alter table RC_CARGO add constraint CARGO_FILIAL foreign key (ID_FILIAL) references RC_FILIAL (EMPR_ID);

-- alter table RC_PAGAMENTO add constraint pagamentos_user check (user_ = 4); -- testar
alter table RC_PAGAMENTO add constraint fk_matricula_id foreign key (id_matricula) references RC_MATRICULA (id);
alter table RC_PAGAMENTO add constraint FK_PAGAMENTO_COLABORADOR foreign key (ID_COLABORADOR) references RC_CARGO (ID);

alter table RC_MATRICULA add constraint fk_turma_id foreign key (id_turma) references rc_turma (id); 
alter table RC_MATRICULA add constraint fk_id_aluno foreign key (id_pessoa) references rc_aluno (id);
alter table RC_MATRICULA add constraint FK_MATRICULA_COLABORADOR foreign key (ID_COLABORADOR) references RC_CARGO (ID);
-- alter table RC_MATRICULA add constraint matricula_user check (user_ = 3 or user_ = 8); -- testar
   

-- site para gerar informações:
-- https://www.4devs.com.br/

