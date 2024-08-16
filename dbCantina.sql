-- apagando banco de dados
drop database dbcantina;

--criando banco de dados
create database dbcantina;

--acessando banco de dados
use dbcantina;

--criando as tabelas
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) unique,
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
nascimento date,
telCelular char(10),
primary key(codFunc));

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cnpj char(18) not null unique,
primary key(codForn));

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(10),
primary key(codCli));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(25) not null unique,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc));

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar (100),
quantidade int,
valor decimal(9,2),
validade date,
dataEntrada date,
horaEntrada time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn));

create table tbVendas(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
codUsu int not null,
codCli int not null,
codProd int not null,
primary key(codVenda),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli),
foreign key(codProd)references tbProdutos(codProd));


--visualizando a estrutura das tabelas
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserindo registros nas tabelas

insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Jose Firmino','jfirmino@gmail.com','157.171.157-17','M',2740.68,'1990/07/31','93628-0669');
insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Maria Estela','estelinha@gmail.com','254.987.158-23','F',3532.76,'1993/12/15','95588-2500');

insert into tbFornecedores(nome,email,cnpj)values('Kalunga','kalunga@gmail.com','71.123.456/0001-88');
insert into tbFornecedores(nome,email,cnpj)values('Ferrarez','ferrarez@gmail.com','19.573.489/0001-17');

insert into tbClientes(nome,email,telCelular)values('Manoel Pereira','manoelpereira@gmail.com','95574-1827');
insert into tbClientes(nome,email,telCelular)values('Ubiraci Ramos','ubiramos@gmail.com','93351-1957');
insert into tbClientes(nome,email,telCelular)values('Cecilia Maria','cecimaria@gmail.com','95971-5312');

insert into tbUsuarios(nome,senha,codFunc)values('jose.firmino','123456',1);
insert into tbUsuarios(nome,senha,codFunc)values('maria.estela','121212',2);

insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Caderno Brochura',500,1000.00,'2050/12/18','2024/08/16','19:50:00',1);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Caneta Bic',800,800.00,'2027/10/07','2024/08/16','19:53:00',2);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Lapis Preto',2000,500.00,'2070/01/01','2024/08/16','19:54:00',2);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Borracha Branca',700,200.00,'2030/05/08','2024/08/16','19:55:00',1);	

insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','19:57:00',10,1,2,4);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','19:58:00',2,2,3,1);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','19:59:00',1,2,3,2);

-- visualizando os registros das tabelas

select * from tbFuncionarios;
select * from tbFornecedores;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;

-- alterando os registros das tabelas

update tbProdutos set descricao = "Coxinha", valor = 7.00 where codProd =1; 

-- visualizando depois das alterações

select * from tbProdutos;