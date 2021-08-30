-- Comentário.

create database ProjetoIntegrador3;
use ProjetoIntegrador3;

create table RC_FILIAL(
id bigInt(20)
primary key auto_increment,
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

insert into RC_FILIAL values(null, 'Instituto São Paulo', 'Rua Claudinho Peixoto', '356', 'Vila Mascote', 'São Paulo', '05501-041', 'SP', 1, (select curDate()), null);

-- select * from RC_FILIAL where id=1; 
select * from RC_FILIAL;

create table RC_PERFIL_COLABORADOR(
id bigInt(20)
primary key auto_increment,
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

create table RC_COLABORADORES(
id bigInt(20)
primary key auto_increment,
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

