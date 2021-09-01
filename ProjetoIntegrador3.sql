-- criação da database
create database if not exists ProjetoIntegrador3;

-- comando para usar a tabela
use ProjetoIntegrador3;

-- criação da tabelas
create table if not exists RC_FILIAL(
empr_id bigInt(20) primary key
auto_increment,
nome varChar(250) 
not null,
rua varChar(250) 
not null,
numero varChar(10) 
not null,
bairro varChar(250) 
not null,
cidade varChar(250) 
not null,
CEP char(10) 
not null,
UF char(2) 
not null,
user_ bigInt(20) 
not null,
data_ date 
not null,
obs text
);


create table if not exists RC_PERFIL_COLABORADOR(
id bigInt(20) primary key auto_increment,
cargo varChar(250)
not null,
categoria varChar(250)
not null,
salario_base varChar(250)
not null,
user_ bigInt(20)
not null,
data_inclusao date
not null,
obs text
);


create table if not exists RC_COLABORADORES(
id bigInt(20) primary key
auto_increment,
empr_id bigint(20) 
not null,
nome varChar(250)
not null,
senha varChar(250)
not null,
categoria bigInt(20)
not null,
salario float(20)
not null,
user_ bigInt(20)
not null,
data_ date
not null,
obs text
);

create table if not exists rc_turma(
id bigint(20) primary key auto_increment,
empr_id  bigint(20) not null,
nome varchar(250) not null,
user_ bigint(20) not null,
data_ date not null,
data_inicio date not null,
data_fim date not null,
valor float not null,
obs text
);

create table if not exists rc_alunos(
id bigint(20) 
primary key auto_increment,
empr_id bigint(20) 
not null,
ende bigint(20) 
not null,
nome varchar(250) 
not null,
sexo bit 
not null,
email varchar(250) 
not null,
cpf char(14) unique 
not null, -- xxx.xxx.xxx-xx
celular varchar(20) 
not null,
tel_residencial varchar(20) 
not null,
tel_comercial varchar(20) 
not null,
data_nasc date,
estado_civil varchar(250) 
not null,
data_ date,
user_ bigint(20) 
not null,
obs text
);

create table if not exists rc_endereco_alunos(
id bigint(20) 
primary key auto_increment not null,
rua varChar(250) 
not null,
numero varChar(10) 
not null,
bairro varChar(250) 
not null,
cidade varChar(250) 
not null,
CEP char(10) 
not null,
UF char(2) 
not null,
user_ bigInt(20) 
not null,
data_ date 
not null,
obs text
);

create table if not exists rc_forma_pagamento(
id bigint(20) 
primary key auto_increment not null,
descricao varchar(250) not null,
nome varchar(250) not null,
user_ bigInt(20)  
not null,
data_ date 
not null
);

-- inserts na tabelas 

insert into RC_FILIAL values(null, 'Instituto São Paulo', 'Rua Claudinho Peixoto', '356', 'Vila Mascote', 'São Paulo', '05501-041', 'SP', 1, (select curDate()), null),
							(null, 'Colégio Cornelius', 'Rua do Bom Jesus', '167', 'Jardim Casa Forte', 'Recife', '60882-193', 'PE', 1, (select curdate()), null),
                            (null, 'Escola Conexão', 'Rua Uruguai', '832', 'Bairro Itajaí', 'Santa Catarina', '13422-246', 'SC', 1, (select curdate()), null),
                            (null, 'Instituição Edukar', 'Rua Alvim Dias de Arruda', '27', 'Bairro Boa vista', 'Tocantins', '09413-100', 'TO', 1, (select curdate()), null),
                            (null, 'Centro Educacional Formar', 'Rua Fenelon Müller.', '1003', 'Chácara dos Pinheiros', 'Mato Grosso', '14285-220', 'MT', 1, (select curdate()), null);

insert into RC_PERFIL_COLABORADOR values (null, 'Analista de dados', 'T.I', 'R$ 3.094,00', 1, '2020-10-13', null),
										 (null, 'Diretor de arte', 'Marketing', 'R$ 3.350,00', 1, '2019-06-03', null),
										 (null, 'Gestora de operação', 'Vendas', 'R$ 4.000,00', 1, '2020-07-29', null),
										 (null, 'Analista contábil', 'Financeiro', 'R$ 3.000,00', 1, '2021-02-16', null),
										 (null, 'Designer', 'Marketing', 'R$ 2.050,00', 1, '2021-09-21', null);
                                         
insert into rc_colaboradores values (null,1,'Gabriel Machado','1234',1,989.10,1,(select curdate()),'estágiario'),
									(null,2,'Douglas Proença','1452',2,20000.00,1,(select curdate()), 'Funcionário do Mês'),
                                    (null,3,'Rafael Camilo','9874',3,10000.00,1,(select curdate()),'Promovido'),
                                    (null,4,'Vinicius Lopes','7894',4,7800.00,1,(select curdate()),null),
                                    (null,5,'Stefane Timote','7863',5,15000.00,1,(select curdate()),null),
                                    (null,6,'Amanda Gavioli','2017',1,5200.00,1,(select curdate()),null),
									(null,7,'Mateus Silva','0214',2,13000.00,1,(select curdate()),null),
									(null,8,'Weskley Oliveira','9918',3,2890.00,1,(select curdate()),null),
									(null,9,'Abnoel Andrade','7122',4,1500.00,1,(select curdate()),null),
									(null,10,'Nathasa Caldeirão','2005',5,27000.00,1,(select curdate()),null);

insert into rc_turma values (null, 1, 'A', 1, (select curdate()), '2021-02-21', '2022-11-25', 1500, null);

insert into rc_forma_pagamento VALUES (null,null,'Dinheiro'),
								   (null,null,'Cartão de Débito'),
                                   (null,null,'Cartão de Crédito'),
                                   (null,null,'Boleto Bancário'),
                                   (null,null,'Nota Promissória'),
                                   (null,null,'Cheque'),
                                   (null,null,'Transf. eletrônica');
							

-- Regras das tabelas

alter table rc_filial add constraint filial_user check (user_ = 1);
alter table rc_filial add constraint fk_Colaborador foreign key (user_) references rc_colaboradores (id);

alter table RC_PERFIL_COLABORADOR add constraint perfil_colaborador_user check (user_ = 1);
alter table RC_PERFIL_COLABORADOR add constraint fk_perfil_colaborador foreign key (user_) references rc_colaboradores (id);   

alter table rc_colaboradores add constraint fk_Colaboradores foreign key (categoria) references RC_PERFIL_COLABORADOR (id);

alter table rc_forma_pagamento add constraint forma_pagamento_user check (user_ = 1);

-- comando para apagar a database 
-- drop database ProjetoIntegrador3;    
