create table paciente (
cod_usuario int not null primary key,
cpf char(11) not null,
telefone varchar(15) not null,
nome varchar(100) not null,
dt_nascimento date,
cep char(8)
);

create table documentos (
id_doc int not null primary key,
carteira_vaci varchar(50),
cpf_doc char(11)
);

create table aviso(
consulta_not varchar(200),
id_aviso int not null auto_increment,
aviso_medicamentos varchar(200)
);

create table hospital(
id_hospital int not null auto_increment,
cep_hos char(8) not null,
fila_hos varchar(50) not null,
consulta_med varchar(50),
local varchar(100) not null,
registro_med varchar(50)
);

create table caderneta_vacina(
id_caderneta int not null auto_increment,
vacinas varchar(100)
);

create table vacina(
id_vacina int not null auto_increment,
tipo_vac varchar(100),
disponibilidade_vac boolean not null,
quantidade_vac boolean,
vencimento_vac date,
lote_vac varchar(50)
);

create table medicamento(
id_medicamento int not null auto_increment,
tipo_medicamento varchar(100),
lote_medicamento varchar(50),
quantidade_medicamento int,
disponibilidade_medicamento boolean
);

create table medico(
id_medico int not null auto_increment,
nome_med varchar(100) not null,
telefone_med varchar(15) not null,
ch_med varchar(50),
num_crm varchar(20) not null
);

create table atendimentos(
    id_atendimentos int not null primary key,
    horario_entrada varchar(50) not null,
    horario_saida varchar(50) not null,
    tipo_agendamento varchar(50) not null,
    medico_agendamento varchar (100) not null,
    atendimentos_marcados int,
    foreign key(id_hospital) references hospital(id_hospital) on delete no action on update no action,
    data_atendimento date not null,
    local_atendimento varchar (100),
    foreign key(cod_usuario) references paciente(cod_usuario) on delete no action on update no action,
    foreign key(id_medico) references medico(id_medico) on delete no action on update no action
);

create table fluxograma(
    id_fluxo int not null primary key,
    entrada_paciente varchar(100),
    saida_paciente varchar(100),
    horario_pico char(50)
);

create table controla(
    foreign key(id_fluxo) references fluxograma(id_fluxo) on delete no action on update no action,
foreign key(id_atendimentos) references atendimentos(id_atendimentos) on delete no action on update no action
);