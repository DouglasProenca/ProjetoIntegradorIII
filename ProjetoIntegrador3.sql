-- criação da database
create database if not exists ProjetoIntegrador3;

-- comando para usar a tabela
use ProjetoIntegrador3;

-- criação da tabelas
create table if not exists RC_FILIAL(
	empr_id bigInt(20) primary key auto_increment,
	nome varChar(250) not null,
	rua varChar(250) not null,
	numero varChar(10) not null,
	bairro varChar(250) not null,
	cidade varChar(250) not null,
	CEP char(10) not null,
	UF char(2) not null,
	id_colaborador bigInt(20) not null,
	data_ date not null,
	obs text
);

create table if not exists RC_FORMA_PAGAMENTO(
	id bigint(20) primary key auto_increment,
	descricao varchar(250),
	nome varchar(250) not null unique,
	id_colaborador bigInt(20) not null,
	data_ date not null
);

create table if not exists RC_CATEGORIA(
	id bigint(20) primary key auto_increment,
	categoria varChar(250) not null,
	id_colaborador bigInt(20) not null,
	data_inclusao date not null,
	obs text
);

create table if not exists RC_PESSOA(
	id bigint(20) primary key auto_increment,
	id_filial bigint(20) not null,
	id_categoria bigint(20) not null,
	nome varchar(250) not null,
	sexo bit not null,
	email varchar(250) not null,
	cpf char(14) unique not null, -- xxx.xxx.xxx-xx
	celular varchar(20) not null,
	tel_residencial varchar(20) not null,
	tel_comercial varchar(20) not null,
	data_nasc date,
	estado_civil varchar(250) not null,
	data_ date,
	id_colaborador bigint(20) not null,
	obs text
);

create table if not exists RC_ENDERECO_PESSOA(
	id bigint(20) primary key auto_increment not null,
	id_pessoa bigint(20) not null unique,
	rua varChar(250) not null,
	numero varChar(10) not null,
	bairro varChar(250) not null,
	cidade varChar(250) not null,
	CEP char(10) not null,
	UF char(2) not null,
	id_colaborador bigInt(20) not null,
	data_ date not null,
	obs text
);


create table if not exists RC_CARGO(
	id bigint(20) primary key auto_increment,
	id_pessoa bigint(20) not null unique,
    id_categoria bigint(20) not null,
    cargo varchar(250) not null,
	salario float(20) not null,
    salario_base float(20) not null,
	id_colaborador bigInt(20) not null,
	data_ date not null,
	obs text
);

create table if not exists RC_USUARIO(
id_rule bigInt(20) primary key auto_increment,
id_pessoa bigInt(20) not null unique,
senha varchar (250) not null,
id_colaborador bigInt(20) not null,
data_ date not null
);

create table if not exists RC_TURMA(
	id bigint(20) primary key auto_increment,
	empr_id  bigint(20) not null,
	nome varchar(250) not null,
	id_colaborador bigint(20) not null,
	data_ date not null,
	data_inicio date not null,
	data_fim date not null,
	valor float not null,
	obs text
);

create table if not exists RC_MATRICULA(
	id bigint(20) primary key auto_increment,
	id_turma bigint(20) not null,
	id_pessoa bigInt(20) not null,
	matricula varchar (50) not null,
	ativo bit not null,
	dia_venc_mensalidade date not null,
	dt_matricula date not null,
	id_colaborador bigint(20) not null,
	data_ date not null,
	obs text
);

create table if not exists RC_PAGAMENTO(
	id bigInt(20) primary key auto_increment,
	id_matricula bigInt(20) not null,
	ano_ref char(4) not null,
	mes_ref char(2) not null,
	data_pagamento date not null,
	juros float,
	id_forma_pagamento bigInt(20) not null,
	valor_pago float,
	id_colaborador bigInt(20)
	not null,
	data_ date not null,
	obs text
);

-- inserts na tabelas 

insert into RC_FILIAL values(null, 'Instituto São Paulo', 'Rua Claudinho Peixoto', '356', 'Vila Mascote', 'São Paulo', '05501-041', 'SP', 1, (select curDate()), null),
							(null, 'Colégio Cornelius', 'Rua do Bom Jesus', '167', 'Jardim Casa Forte', 'Recife', '60882-193', 'PE', 1, (select curdate()), null),
                            (null, 'Escola Conexão', 'Rua Uruguai', '832', 'Bairro Itajaí', 'Santa Catarina', '13422-246', 'SC', 1, (select curdate()), null),
                            (null, 'Instituição Edukar', 'Rua Alvim Dias de Arruda', '27', 'Bairro Boa vista', 'Tocantins', '09413-100', 'TO', 1, (select curdate()), null),
                            (null, 'Centro Educacional Formar', 'Rua Fenelon Müller.', '1003', 'Chácara dos Pinheiros', 'Mato Grosso', '14285-220', 'MT', 1, (select curdate()), null);

insert into rc_forma_pagamento VALUES (null,null,'Dinheiro',1,(select curdate())),
								   (null,null,'Cartão de Débito',1,(select curdate())),
                                   (null,null,'Cartão de Crédito',1,(select curdate())),
                                   (null,null,'Boleto Bancário',1,(select curdate())),
                                   (null,null,'Nota Promissória',1,(select curdate())),
                                   (null,null,'Cheque',1,(select curdate())),
                                   (null,null,'Transf. eletrônica',1,(select curdate()));

insert into RC_CATEGORIA values (null,'alunos',1, (select curdate()),null),
								(null,'TI',1, (select curdate()),null),
                                (null,'Administrativo',1, (select curdate()),null),
                                (null,'Vendas',1, (select curdate()),null),
                                (null,'Produtos/Serviços/Marketing',1, (select curdate()),null);
				
insert into RC_PESSOA values (null, 1,1,'Carla Moreira',1, 'moreiracarla@hotmail.com', '449.563.201-20', '(11) 98714-2390', '(11) 5615-1900', '(11) 98714-2390', '1997-08-07','Solteiro', (select curdate()), 1, null),
							 (null, 2,1,'Anita Dutra Ferraz',1, 'dutraferraz@outlook.com', '309.274.029-71', '(45) 97150-2774', '(45) 1680-8896', '(45) 97150-2774', '2000-03-14','Viuvo', (select curdate()), 2, null),
							 (null, 3,1,'William Homem Igrejas',0, 'whigrejas@hotmail.com', '733.756.951-36', '(14) 90113-7133', '(14) 4051-6467', '(14) 90113-7133', '1994-11-20','Solteiro', (select curdate()), 3, null),
                             (null, 4,1,'Bernardo Azambuja Lima',0, 'limabernar@gmail.com', '757.735.641-73', '(61) 95286-0776', '(61) 6157-1800', '(61) 95286-0776', '2002-08-24','Casado', (select curdate()), 4, null),
                             (null, 5,1,'Vanessa Mariz Durão',1, 'marizvanessa@gmail.com', '949.851.794-00', '(28) 95286-0776', '(28) 4787-0665', '(28) 95286-0776', '1999-12-16','Solteiro', (select curdate()), 5, null),
						     (null, 1,2,'Gabriel Machado',0,'GabsMach@gmail.com','552.288.080-51','(11) 98714-2390','(11) 5615-1900', '(11) 98714-2390', '1997-08-07','Solteiro', (select curdate()), 1, null),
							 (null, 2,2,'Douglas Proença',0,'dprz1606@gmail.com','926.894.450-26','(45) 97150-2774', '(45) 1680-8896', '(45) 97150-2774', '2000-03-14','Solteiro', (select curdate()), 2, null),
							 (null, 3,2,'Rafael Camilo',0,'camilorafa@gmail.com','760.686.930-82','(14) 90113-7133', '(14) 4051-6467', '(14) 90113-7133', '1994-11-20','Casado', (select curdate()), 3, null),
							 (null, 4,2,'Vinicius Lopes',0,'ViniLopes@outlok.com','895.567.160-17','(61) 95286-0776', '(61) 6157-1800', '(61) 95286-0776', '2002-08-24','Casado', (select curdate()), 4, null),
							 (null, 5,2,'Stéfane Timote',1,'timoste@yahoo.com.br','930.971.660-68','(28) 95286-0776', '(28) 4787-0665', '(28) 95286-0776', '1999-12-16','Solteiro', (select curdate()), 5, null),
							 (null, 1,2,'Amanda Gavioli',1,'mandsGavi@terra.com.br','404.936.540-54','(11) 98714-2390','(11) 5615-1900', '(11) 98714-2390', '1997-08-07','Solteiro', (select curdate()), 1, null),
							 (null, 2,2,'Mateus Silva',0,'mat1998@gmail.com','919.707.560-47','(45) 97150-2774', '(45) 1680-8896', '(45) 97150-2774', '2000-03-14','Viuvo', (select curdate()), 2, null),
							 (null, 3,2,'Weskley Oliveira',0,'weskleysantos@outlook.com','395.054.350-37','(14) 90113-7133', '(14) 4051-6467', '(14) 90113-7133', '1994-11-20','Solteiro', (select curdate()), 3, null),
							 (null, 4,2,'Abnoel Andrade',0,'abandrade@gmail.com','226.526.880-14','(61) 95286-0776', '(61) 6157-1800', '(61) 95286-0776', '2002-08-24','Casado', (select curdate()), 4, null),
							 (null, 5,2,'Nathasa Caldeirão',1,'natashacald@terra.com.br','386.164.430-45','(28) 95286-0776', '(28) 4787-0665', '(28) 95286-0776', '1999-12-16','Solteiro', (select curdate()), 5, null),
                             (null, 1,1,'Pietra Cirilo',1, 'moreiracarla@hotmail.com', '415.917.500-75', '(11) 98714-2390', '(11) 5615-1900', '(11) 98714-2390', '1997-08-07','Solteiro', (select curdate()), 1, null),
							 (null, 2,1,'Amanda Flor',1, 'dutraferraz@outlook.com', '816.181.460-09', '(45) 97150-2774', '(45) 1680-8896', '(45) 97150-2774', '2000-03-14','Viuvo', (select curdate()), 2, null),
							 (null, 3,1,'Yghor Cardoso da Silva',0, 'whigrejas@hotmail.com', '331.152.930-89', '(14) 90113-7133', '(14) 4051-6467', '(14) 90113-7133', '1994-11-20','Solteiro', (select curdate()), 3, null),
                             (null, 4,1,'João Lubarino de Carvalho',0, 'limabernar@gmail.com', '802.540.020-48', '(61) 95286-0776', '(61) 6157-1800', '(61) 95286-0776', '2002-08-24','Casado', (select curdate()), 4, null),
                             (null, 5,1,'Beatriz Malara',1, 'marizvanessa@gmail.com', '722.139.480-62', '(28) 95286-0776', '(28) 4787-0665', '(28) 95286-0776', '1999-12-16','Solteiro', (select curdate()), 5, null),
						     (null, 1,2,'Heron Ramos',0,'GabsMach@gmail.com','748.752.840-55','(11) 98714-2390','(11) 5615-1900', '(11) 98714-2390', '1997-08-07','Solteiro', (select curdate()), 1, null),
							 (null, 2,2,'Vinicius Ramos',0,'dprz1606@gmail.com','046.611.800-70','(45) 97150-2774', '(45) 1680-8896', '(45) 97150-2774', '2000-03-14','Solteiro', (select curdate()), 2, null),
							 (null, 3,2,'Gabriel Berloffa',0,'camilorafa@gmail.com','063.483.490-80','(14) 90113-7133', '(14) 4051-6467', '(14) 90113-7133', '1994-11-20','Casado', (select curdate()), 3, null),
							 (null, 4,2,'Guilherme Pinheiro Campos',0,'ViniLopes@outlok.com','641.572.990-00','(61) 95286-0776', '(61) 6157-1800', '(61) 95286-0776', '2002-08-24','Casado', (select curdate()), 4, null),
							 (null, 5,2,'Ester Alves',1,'timoste@yahoo.com.br','054.387.870-85','(28) 95286-0776', '(28) 4787-0665', '(28) 95286-0776', '1999-12-16','Solteiro', (select curdate()), 5, null),
							 (null, 1,2,'Maria do Carmo de Almeida Russo',1,'mandsGavi@terra.com.br','279.288.770-23','(11) 98714-2390','(11) 5615-1900', '(11) 98714-2390', '1997-08-07','Solteiro', (select curdate()), 1, null),
							 (null, 2,2,'Antonio Silveira',0,'mat1998@gmail.com','202.709.210-28','(45) 97150-2774', '(45) 1680-8896', '(45) 97150-2774', '2000-03-14','Viuvo', (select curdate()), 2, null),
							 (null, 3,2,'Willians Proença Santos',0,'weskleysantos@outlook.com','664.267.580-00','(14) 90113-7133', '(14) 4051-6467', '(14) 90113-7133', '1994-11-20','Solteiro', (select curdate()), 3, null),
							 (null, 4,2,'Marcio Silva Santos',0,'abandrade@gmail.com','463.096.620-07','(61) 95286-0776', '(61) 6157-1800', '(61) 95286-0776', '2002-08-24','Casado', (select curdate()), 4, null),
							 (null, 5,2,'Aline Campos da Cruz',1,'natashacald@terra.com.br','202.744.120-47','(28) 95286-0776', '(28) 4787-0665', '(28) 95286-0776', '1999-12-16','Solteiro', (select curdate()), 5, null);

insert into RC_ENDERECO_PESSOA values (null,1, 'Rua Amador Bueno', '590', 'Santo Amaro', 'São Paulo', '05887-310', 'SP', 1, (select curdate()), null),
									  (null,2, 'Rua Abelardo Costa Filho', '22', 'Itajaí', 'Santa Catarina', '88512-627', 'SC', 2, (select curdate()), null),
									  (null,3, 'Rua Deise Maria Pinto', '327', 'Boa vista', 'Tocantins', '77827-210', 'TO', 3, (select curdate()), null),
									  (null,4, 'Rua Alexandre de Barros', '2901', 'Chácara dos Pinheiros', 'Mato Grosso', '78088-806', 'MT', 4, (select curdate()), null),
									  (null,5, 'Rua Comendador Bernardino Costa', '3', 'Jardim Casa Forte', 'Recife', '54705-384', 'PE', 5, (select curdate()), null),
                                      (null,6, 'Rua Amador Bueno', '590', 'Santo Amaro', 'São Paulo', '05887-310', 'SP', 1, (select curdate()), null),
									  (null,7, 'Rua Abelardo Costa Filho', '22', 'Itajaí', 'Santa Catarina', '88512-627', 'SC', 2, (select curdate()), null),
									  (null,8, 'Rua Deise Maria Pinto', '327', 'Boa vista', 'Tocantins', '77827-210', 'TO', 3, (select curdate()), null),
									  (null,9, 'Rua Alexandre de Barros', '2901', 'Chácara dos Pinheiros', 'Mato Grosso', '78088-806', 'MT', 4, (select curdate()), null),
									  (null,10, 'Rua Comendador Bernardino Costa', '3', 'Jardim Casa Forte', 'Recife', '54705-384', 'PE', 5, (select curdate()), null),
									  (null,11, 'Rua Amador Bueno', '590', 'Santo Amaro', 'São Paulo', '05887-310', 'SP', 1, (select curdate()), null),
									  (null,12, 'Rua Abelardo Costa Filho', '22', 'Itajaí', 'Santa Catarina', '88512-627', 'SC', 2, (select curdate()), null),
									  (null,13, 'Rua Deise Maria Pinto', '327', 'Boa vista', 'Tocantins', '77827-210', 'TO', 3, (select curdate()), null),
									  (null,14, 'Rua Alexandre de Barros', '2901', 'Chácara dos Pinheiros', 'Mato Grosso', '78088-806', 'MT', 4, (select curdate()), null),
									  (null,15, 'Rua Comendador Bernardino Costa', '3', 'Jardim Casa Forte', 'Recife', '54705-384', 'PE', 5, (select curdate()), null),
                                      (null,16, 'Rua Amador Bueno', '590', 'Santo Amaro', 'São Paulo', '05887-310', 'SP', 1, (select curdate()), null),
									  (null,17, 'Rua Abelardo Costa Filho', '22', 'Itajaí', 'Santa Catarina', '88512-627', 'SC', 2, (select curdate()), null),
									  (null,18, 'Rua Deise Maria Pinto', '327', 'Boa vista', 'Tocantins', '77827-210', 'TO', 3, (select curdate()), null),
									  (null,19, 'Rua Alexandre de Barros', '2901', 'Chácara dos Pinheiros', 'Mato Grosso', '78088-806', 'MT', 4, (select curdate()), null),
									  (null,20, 'Rua Comendador Bernardino Costa', '3', 'Jardim Casa Forte', 'Recife', '54705-384', 'PE', 5, (select curdate()), null),
                                      (null,21, 'Rua Amador Bueno', '590', 'Santo Amaro', 'São Paulo', '05887-310', 'SP', 1, (select curdate()), null),
									  (null,22, 'Rua Abelardo Costa Filho', '22', 'Itajaí', 'Santa Catarina', '88512-627', 'SC', 2, (select curdate()), null),
									  (null,23, 'Rua Deise Maria Pinto', '327', 'Boa vista', 'Tocantins', '77827-210', 'TO', 3, (select curdate()), null),
									  (null,24, 'Rua Alexandre de Barros', '2901', 'Chácara dos Pinheiros', 'Mato Grosso', '78088-806', 'MT', 4, (select curdate()), null),
									  (null,25, 'Rua Comendador Bernardino Costa', '3', 'Jardim Casa Forte', 'Recife', '54705-384', 'PE', 5, (select curdate()), null),
									  (null,26, 'Rua Amador Bueno', '590', 'Santo Amaro', 'São Paulo', '05887-310', 'SP', 1, (select curdate()), null),
									  (null,27, 'Rua Abelardo Costa Filho', '22', 'Itajaí', 'Santa Catarina', '88512-627', 'SC', 2, (select curdate()), null),
									  (null,28, 'Rua Deise Maria Pinto', '327', 'Boa vista', 'Tocantins', '77827-210', 'TO', 3, (select curdate()), null),
									  (null,29, 'Rua Alexandre de Barros', '2901', 'Chácara dos Pinheiros', 'Mato Grosso', '78088-806', 'MT', 4, (select curdate()), null),
									  (null,30, 'Rua Comendador Bernardino Costa', '3', 'Jardim Casa Forte', 'Recife', '54705-384', 'PE', 5, (select curdate()), null);									

insert into RC_CARGO values (null,6,2,'Gerente Regional',5000.00, 4800.00, 1, (select curdate()),null),
							(null,7,2,'Gerente Regional',5000.00, 4800.00, 1, (select curdate()),null),
                            (null,8,2,'Gerente Regional',5000.00, 4800.00, 1, (select curdate()),null),
                            (null,9,2,'Gerente Regional',5000.00, 4800.00, 1, (select curdate()),null),
                            (null,10,2,'Gerente Regional',5000.00, 4800.00, 1, (select curdate()),null),
                            (null,11,2,'Suporte Tecnico',2500.00, 2200.00, 1, (select curdate()),null),
							(null,12,2,'Suporte Tecnico',2500.00, 2200.00, 1, (select curdate()),null),
                            (null,13,2,'Suporte Tecnico',2500.00, 2200.00, 1, (select curdate()),null),
                            (null,14,2,'Suporte Tecnico',2500.00, 2200.00, 1, (select curdate()),null),
                            (null,15,2,'Suporte Tecnico',2500.00, 2200.00, 1, (select curdate()),null),
                            (null,16,4,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
							(null,17,4,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
                            (null,18,4,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
                            (null,19,4,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
                            (null,20,4,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
                            (null,21,3,'RH',4100.00, 3800.00, 1, (select curdate()),null),
							(null,22,3,'RH',4100.00, 3800.00, 1, (select curdate()),null),
                            (null,23,3,'RH',4100.00, 3800.00, 1, (select curdate()),null),
                            (null,24,3,'RH',4100.00, 3800.00, 1, (select curdate()),null),
                            (null,25,3,'RH',4100.00, 3800.00, 1, (select curdate()),null),
                            (null,26,3,'Administrativo',2500.00, 2000.00, 1, (select curdate()),null),
							(null,27,3,'Administrativo',2500.00, 2000.00, 1, (select curdate()),null),
                            (null,28,3,'Administrativo',2500.00, 2000.00, 1, (select curdate()),null),
                            (null,29,3,'Administrativo',2500.00, 2000.00, 1, (select curdate()),null),
                            (null,30,3,'Administrativo',2500.00, 2000.00, 1, (select curdate()),null);

insert into RC_USUARIO values(null,6,'0bqE',1,(select curdate())),
							 (null,7,'6OdG',1,(select curdate())),
                             (null,8,'ejEl',1,(select curdate())),
                             (null,9,'PGAL',1,(select curdate())),
                             (null,10,'sblf',1,(select curdate())),
                             (null,11,'kRW4',1,(select curdate())),
                             (null,12,'UtoK',1,(select curdate())),
                             (null,13,'ryN8',1,(select curdate())),
                             (null,14,'uKwQ',1,(select curdate())),
                             (null,15,'Swk1',1,(select curdate())),
                             (null,16,'QX4Q',1,(select curdate())),
                             (null,17,'q1gu',1,(select curdate())),
                             (null,18,'TCab',1,(select curdate())),
                             (null,19,'qqC6',1,(select curdate())),
                             (null,20,'GBRD',1,(select curdate())),
                             (null,21,'WHaf',1,(select curdate())),
                             (null,22,'An2C',1,(select curdate())),
                             (null,23,'8jkx',1,(select curdate())),
                             (null,24,'bEE0',1,(select curdate())),
                             (null,25,'AiY5',1,(select curdate())),
                             (null,26,'DBmI',1,(select curdate())),
                             (null,27,'eGRF',1,(select curdate())),
                             (null,28,'wUxP',1,(select curdate())),
                             (null,29,'5hCa',1,(select curdate())),
                             (null,30,'pS8F',1,(select curdate()));

insert into RC_TURMA values (null, 1, 'A', 1, (select curdate()), '2021-02-21', '2021-11-25', 1500, null),
							(null, 2, 'C', 2, (select curdate()), '2020-07-01', '2021-05-14', 1900, null),
							(null, 3, 'A', 3, (select curdate()), '2018-02-18', '2019-12-10', 2300, null),
							(null, 4, 'B', 4, (select curdate()), '2021-02-12', '2021-09-28', 1150, null),
							(null, 5, 'D', 5, (select curdate()), '2021-05-11', '2022-06-05', 1350, null);
						



-- Regras das tabelas

alter table RC_FILIAL add constraint FILIAL_USER check (ID_COLABORADOR <= 10);
alter table RC_FILIAL add constraint FK_FILIAL_USUARIO foreign key (ID_COLABORADOR) references RC_USUARIO (ID_RULE);

alter table RC_FORMA_PAGAMENTO add constraint FORMA_PAGAMENTO_USER check (ID_COLABORADOR <= 10);
alter table RC_FORMA_PAGAMENTO add constraint FK_FORMA_PAGAMENTO_USUARIO foreign key (ID_COLABORADOR) references RC_USUARIO (ID_RULE);

alter table RC_CATEGORIA add constraint FORMA_PAGAMENTO_USER check (ID_COLABORADOR <= 10);
alter table RC_CATEGORIA add constraint FK_CATEGORIA_USUARIO foreign key (ID_COLABORADOR) references RC_USUARIO (ID_RULE);

alter table RC_PESSOA add constraint PESSOA_USER check (ID_COLABORADOR <= 25);
alter table RC_PESSOA add constraint FK_PESSOA_FILIAL foreign key (ID_FILIAL) references RC_FILIAL (id);    
alter table RC_PESSOA add constraint FK_PESSOA_CATEGORIA foreign key (ID_CATEGORIA) references RC_CATEGORIA (id);   
alter table RC_PESSOA add constraint FK_PESSOA_USUARIO foreign key (ID_COLABORADOR) references RC_USUARIO (ID_RULE);

alter table RC_ENDERECO_PESSOA add constraint ENDERECO_PESSOA_USER check (ID_COLABORADOR <= 25);
alter table RC_ENDERECO_PESSOA add constraint FK_ENDERECO_PESSOA foreign key (ID_PESSOA) references RC_PESSOA (id);
alter table RC_ENDERECO_PESSOA add constraint FK_ENDERECO_PESSOA_USUARIO foreign key (ID_COLABORADOR) references RC_USUARIO (ID_RULE);

alter table RC_CARGO add constraint CARGO_USER check (ID_COLABORADOR <= 10);
alter table RC_CARGO add constraint FK_CARGO_PESSOA foreign key (ID_PESSOA) references RC_PESSOA (id);

--
alter table RC_PAGAMENTO add constraint pagamentos_user check (user_ = 4);
alter table RC_PAGAMENTO add constraint fk_matricula_id foreign key (id_matricula) references RC_MATRICULA (id);
alter table RC_PAGAMENTO add constraint fk_forma_pagamento foreign key (id_forma_pagamento) references RC_FORMA_PAGAMENTO (id);

alter table RC_MATRICULA add constraint fk_turma_id foreign key (id_turma) references rc_turma (id);
alter table RC_MATRICULA add constraint fk_id_aluno foreign key (id_aluno) references rc_aluno (id);
alter table RC_MATRICULA add constraint matricula_user check (user_ = 3 or user_ = 8);

-- comando para apagar a database 
-- drop database ProjetoIntegrador3;    

-- FALTAM -- insert do pagamento e matricula.
-- Verificar todas as foreign keys.
-- Verificar todos os check.
-- Verificar como colocar em um servidor.