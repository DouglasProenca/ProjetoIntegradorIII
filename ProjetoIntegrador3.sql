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
                             (null, 5,1,'Vanessa Mariz Durão',1, 'marizvanessa@gmail.com', '949.851.794-00', '(28) 95286-0776', '(28) 4787-0665', '(28) 95286-0776', '1999-12-16','Solteiro', (select curdate()), 5, null);

insert into RC_ENDERECO_PESSOA values (null,1, 'Rua Amador Bueno', '590', 'Santo Amaro', 'São Paulo', '05887-310', 'SP', 1, (select curdate()), null),
									  (null,2, 'Rua Abelardo Costa Filho', '22', 'Itajaí', 'Santa Catarina', '88512-627', 'SC', 2, (select curdate()), null),
									  (null,3, 'Rua Deise Maria Pinto', '327', 'Boa vista', 'Tocantins', '77827-210', 'TO', 3, (select curdate()), null),
									  (null,4, 'Rua Alexandre de Barros', '2901', 'Chácara dos Pinheiros', 'Mato Grosso', '78088-806', 'MT', 4, (select curdate()), null),
									  (null,5, 'Rua Comendador Bernardino Costa', '3', 'Jardim Casa Forte', 'Recife', '54705-384', 'PE', 5, (select curdate()), null);
-- 

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
                            (null,16,2,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
							(null,17,2,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
                            (null,18,2,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
                            (null,19,2,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null),
                            (null,20,2,'Vendedor Regional',1500.00, 1200.00, 1, (select curdate()),null);

insert into RC_PERFIL_COLABORADOR values (null, 'Analista de dados', 'T.I', 'R$ 3.094,00', 1, '2020-10-13', null),
										 (null, 'Diretor de arte', 'Marketing', 'R$ 3.350,00', 1, '2019-06-03', null),
										 (null, 'Gestora de operação', 'Vendas', 'R$ 4.000,00', 1, '2020-07-29', null),
										 (null, 'Analista contábil', 'Financeiro', 'R$ 3.000,00', 1, '2021-02-16', null),
										 (null, 'Designer', 'Marketing', 'R$ 2.050,00', 1, '2021-09-21', null);
                                         
insert into rc_colaboradores values (null,1,'Gabriel Machado','1234',1,5000.00,1,(select curdate()),'estágiario'),
									(null,2,'Douglas Proença','1452',2,20000.00,1,(select curdate()), 'Funcionário do Mês'),
                                    (null,3,'Rafael Camilo','9874',3,10000.00,1,(select curdate()),'Promovido'),
                                    (null,4,'Vinicius Lopes','7894',4,7800.00,1,(select curdate()),null),
                                    (null,5,'Stéane Timote','2324',4,3200.00,1,(select curdate()),null),
                                    (null,1,'Amanda Gavioli','2017',1,3089.00,1,(select curdate()),null),
									(null,2,'Mateus Silva','0214',2,3418.00,1,(select curdate()),null),
									(null,3,'Weskley Oliveira','9918',3,2890.00,1,(select curdate()),null),
									(null,4,'Abnoel Andrade','7122',4,2900.00,1,(select curdate()),null),
									(null,5,'Nathasa Caldeirão','2005',5,2640.00,1,(select curdate()),null);

insert into RC_TURMA values (null, 1, 'A', 1, (select curdate()), '2021-02-21', '2021-11-25', 1500, null),
							(null, 2, 'C', 2, (select curdate()), '2020-07-01', '2021-05-14', 1900, null),
							(null, 3, 'A', 3, (select curdate()), '2018-02-18', '2019-12-10', 2300, null),
							(null, 4, 'B', 4, (select curdate()), '2021-02-12', '2021-09-28', 1150, null),
							(null, 5, 'D', 5, (select curdate()), '2021-05-11', '2022-06-05', 1350, null);
						



-- Regras das tabelas

alter table rc_filial add constraint filial_user check (user_ = 1);
alter table rc_filial add constraint fk_Colaborador foreign key (user_) references rc_colaboradores (id);

alter table RC_PERFIL_COLABORADOR add constraint perfil_colaborador_user check (user_ = 1);
alter table RC_PERFIL_COLABORADOR add constraint fk_perfil_colaborador foreign key (user_) references rc_colaboradores (id);   

alter table rc_colaboradores add constraint fk_Colaboradores foreign key (categoria) references RC_PERFIL_COLABORADOR (id);

alter table rc_forma_pagamento add constraint forma_pagamento_user check (user_ = 1);

alter table RC_PAGAMENTO add constraint pagamentos_user check (user_ = 4);
alter table RC_PAGAMENTO add constraint fk_matricula_id foreign key (id_matricula) references RC_MATRICULA (id);
alter table RC_PAGAMENTO add constraint fk_forma_pagamento foreign key (id_forma_pagamento) references RC_FORMA_PAGAMENTO (id);

alter table RC_MATRICULA add constraint fk_turma_id foreign key (id_turma) references rc_turma (id);
alter table RC_MATRICULA add constraint fk_id_aluno foreign key (id_aluno) references rc_aluno (id);
alter table RC_MATRICULA add constraint matricula_user check (user_ = 3 or user_ = 8);

-- comando para apagar a database 
-- drop database ProjetoIntegrador3;    

-- FALTAM -- insert do pagamento, forma de pagamento e matricula.
-- Verificar todas as foreign keys.
-- Verificar todos os check.
-- Verificar como colocar em um servidor.