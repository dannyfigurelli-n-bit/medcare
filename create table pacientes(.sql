create table pacientes(
id serial primary key,
nome varchar(150) not null,
email varchar(150) not null unique,
cpf varchar (11) not null unique,
data_nascimento varchar(20) not null,
data_cadastro timestamp default current_timestamp
);

create table especialidades(
id serial primary key,
nome varchar(150) not null unique
);

create table medicos(
id serial primary key,
especialidade_id int,
nome varchar(100) not null,
crn varchar(20) not null unique,
valor_consulta numeric(10, 2) default 0.00,
foreign key(especialidade_id) references especialidades(id) 
);

create table consultas(
id serial primary key,
medico_id int,
paciente_id int,
data_hora varchar(20) not null,
status varchar(15) default 'agendada' check(status in ('agendada', 'realizada','cancelada')),
foreign key(medico_id) references medicos(id),
foreign key(paciente_id) references pacientes(id)

);

create table exame_consulta(
id serial primary key,
consulta_id int not null,
nome_exame varchar(100) not null,
valor_exame numeric(10, 2) not null check (valor_exame >= 0),
foreign key(consulta_id) references consultas(id)
);