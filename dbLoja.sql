-- apagar o banco de dados
drop database dbLoja;

-- criar o banco de dados
create database dbLoja;

-- acessar o banco de dados
use dbLoja;

-- criando as tabelas do banco de dados
create table tbFuncionarios (
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char (14) not null unique,
telCel char(10),
dataNasc date,
sexo char (1),
salario decimal(9,2),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado varchar(100),
siglaEst varchar(2),
complemento varchar(100),
primary key(codFunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(50) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn)
);

create table tbClientes(
CodCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
TelCel char(9),
cpf char(14) not null unique,
primary key(CodCli)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(30) not null unique,
senha varchar(12) not null,
codFunc int not null,
primary key (codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
nome varchar(100),
valor decimal(9,2),
quantidade int,
dataEnt date,
validade date,
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn)
);

create table tbVendas(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
valorTotal decimal(9,2),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key(codVenda),
foreign key(codProd)references tbProdutos(codProd),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli)
);

-- visualizando a estrutura da tabela 
desc tbFuncionarios;
desc tbUsuarios;
desc tbFornecedores;
desc tbProdutos; 
desc tbClientes;
desc tbVendas;

-- inserindo registro nas tabelas

insert into tbFuncionarios
	(nome,email,cpf,telCel,dataNasc,sexo,salario,logradouro,
		numero,cep,bairro,cidade,estado,siglaEst,
		complemento)
	values('Lucas dos Santos Pereira','lucas.sap@gmail.com',
		'696.696+696-69','98424-1040','2001/07/04',
		'L',4500.55,'Rua das Piranhas','69A','69696-69',
		'Piranhas da Sul','Sao Paulo','Sao Paulo','SP',
		'fundo das primas');

	-- visualizando os registros das tabelas

	select * from tbFuncionarios;
