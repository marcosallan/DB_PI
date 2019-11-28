create database projeto_integrador;

create table pessoa(
	pes_iden varchar PRIMARY Key,
	pes_funcao varchar,
	pes_nome varchar,
	pes_logradouro varchar,
	pes_cep varchar,
	pes_numero varchar,
	pes_complemento varchar,
	pes_bairro varchar,
	pes_cidade varchar,
	pes_uf varchar,
	pes_telcelular varchar,
	pes_telresidencial varchar,
	pes_situacao varchar
		
);

create table coordenador (
	coord_pes_iden varchar primary key,
	foreign key (coord_pes_iden) references pessoa (pes_iden)
);

create table professor (
	prof_pes_iden varchar primary key,
	prof_titulacao varchar,
	prof_cursos varchar,
	foreign key (prof_pes_iden) references pessoa (pes_iden)
);

create table curso(
	curs_iden integer PRIMARY KEY,
	curs_descricao varchar,
	curs_coord_iden varchar,
	
	foreign key (curs_coord_iden) references coordenador (coord_pes_iden)
	
);

create table aluno (
	alun_pes_iden varchar primary key,
	alun_curs_iden integer,

	foreign key (alun_pes_iden) references pessoa (pes_iden),
	foreign key (alun_curs_iden) references curso (curs_iden)
);

create table disciplina (
	disc_iden integer primary key,
	disc_curs_iden integer,
	disc_descricao varchar,
	disc_prerequisito integer,
	disc_cargahoraria integer,
	disc_bibliografia varchar,
	disc_ementa varchar,
	disc_prof_iden varchar,
	
	foreign key (disc_curs_iden) references curso (curs_iden),
	foreign key (disc_prof_iden) references professor (prof_pes_iden)
);

create table turma (
	turm_iden integer primary key,
	turm_ano integer,
	turm_semestre integer,
	turm_horario varchar,
	turm_diasemana varchar,
	turm_disc_iden integer,

	foreign key (turm_disc_iden) references disciplina(disc_iden)
);


create table avaliacao (
	aval_disc_iden integer,
	aval_prof_iden varchar,
	aval_alun_iden varchar,
	aval_frequencia varchar,
	aval_nota1 numeric,
	aval_nota2 numeric,
	aval_notafinal numeric,
	aval_situacao varchar,
	
	foreign key (aval_disc_iden) references disciplina (disc_iden),
	foreign key (aval_prof_iden) references professor (prof_pes_iden),
	foreign key (aval_alun_iden) references aluno (alun_pes_iden)
);

create table diario(
	diar_pes_iden varchar,
	diar_turm_iden integer,
	diar_presenca integer,
	diar_falta integer,
	diar_frequencia integer,
	diar_data Date,
	foreign key (diar_pes_iden) references pessoa (pes_iden),
	foreign key (diar_turm_iden) references turma (turm_iden)
);

create table matricula(
	matr_pes_iden varchar,
	matr_turm_iden integer,
	matr_situacao varchar,
	
	foreign key (matr_pes_iden) references pessoa (pes_iden),
	foreign key (matr_turm_iden) references turma (turm_iden)
);

insert into pessoa values ('001873678-50', 'Professor',  'Beth Cláudia Peixoto',  'Avenida Maria de Oliveira Colares',  '68928-325', 822, 'Quadra 29, Lote 65',  'Fonte Nova',  'Santana',  'AP',  '(96) 2878-9351',  '(96) 98381-8279', 'Ativo');
insert into pessoa values ( '045748243-52', 'Professor',  'Eugenio Renato Luiz Viana',  'Rua Secundino Campos',  '68901-750', 405, 'Quadra 30, Lote 66',  'Nova Esperança',  'Macapá',  'AP',  '(96) 3892-7617',  '(96) 98649-3211', 'Ativo');
insert into pessoa values ( '066060251-25', 'Professor',  'Kátia Fernanda Yasmin de Paula',  'Rua Cristalina',  '79901-398', 475, 'Quadra 31, Lote 67',  'Residencial Manoel Padial Urel',  'Ponta Porã',  'MS',  '(67) 3836-3969',  '(67) 99613-9757', 'Ativo');
insert into pessoa values ( '104326426-41', 'Professor',  'Norma Tânia Cardoso',  'Rua Marrocos',  '28905-125', 517, 'Quadra 32, Lote 68',  'Parque Central',  'Cabo Frio',  'RJ',  '(22) 3979-5638',  '(22) 98871-7946', 'Ativo');
insert into pessoa values ( '116435196-62', 'Professor',  'José Luís Bernardo Monteiro',  'Rua Tenente Edilson',  '69400-668', 654, 'Quadra 33, Lote 69',  'São José',  'Manacapuru',  'AM',  '(92) 2786-4435',  '(92) 98109-7420', 'Ativo');
insert into pessoa values ( '140724125-70', 'Professor',  'Halley Davi Geraldo da Mota',  'Rua Argemiro de Hungria Machado',  '21670-290', 732, 'Quadra 34, Lote 70',  'Guadalupe',  'Rio de Janeiro',  'RJ',  '(21) 3854-4431',  '(21) 98271-7632', 'Ativo');
insert into pessoa values ( '177192260-54', 'Professor',  'Thomas Cauã Murilo Barros',  'Rua F',  '77826-476', 376, 'Quadra 35, Lote 71',  'Morada do Sol 2',  'Araguaína',  'TO',  '(63) 2844-7127',  '(63) 98373-4703', 'Ativo');
insert into pessoa values ( '194906304-62', 'Professor',  'Ujeverson Ruan Jesus',  'Rua Tubiacanga',  '25585-210', 594, 'Quadra 36, Lote 72',  'Parque Novo Rio',  'São João de Meriti',  'RJ',  '(21) 3574-6698',  '(21) 99319-7618', 'Ativo');
insert into pessoa values ( '287571160-16', 'Professor',  'Daniel Gustavo Lima',  'Rodovia BR 316',  '57608-345', 183, 'Quadra 38, Lote 74',  'Palmeira de Fora',  'Palmeira dos Índios',  'AL',  '(82) 2559-1398',  '(82) 99601-8379', 'Ativo');
insert into pessoa values ( '288605586-70', 'Professor',  'Jean Arthur Carvalho',  'Rua Santa Terezinha',  '65090-830', 861, 'Quadra 39, Lote 75',  'Maracanã',  'São Luís',  'MA',  '(98) 3958-7220',  '(98) 98643-4462', 'Ativo');
insert into pessoa values ( '298772616-34', 'Professor',  'Vilarin Henrique Cardoso',  'Avenida dos Franceses',  '65036-281', 756, 'Quadra 40, Lote 76',  'Alemanha',  'São Luís',  'MA',  '(98) 3680-8328',  '(98) 98937-8505', 'Ativo');
insert into pessoa values ( '301507952-20', 'Professor',  'Wilian Eduardo Drumond',  'Avenida Deputado Raimundo de Sá Urtiga',  '64601-385', 517, 'Quadra 41, Lote 77',  'Bomba',  'Picos',  'PI',  '(89) 2576-8182',  '(89) 98583-9348', 'Ativo');
insert into pessoa values ( '256493705-59', 'Aluno',  'Sara Lorena Márcia Duarte',  'Quadra 1003 Sul Alameda 31',  '77018-454', 748, 'Quadra 37, Lote 73',  'Plano Diretor Sul',  'Palmas',  'TO',  '(63) 2976-1122',  '(63) 99961-5276', 'Ativo');
insert into pessoa values ( '316738031-48', 'Aluno',  'Sérgio Thales Luan Assis',  'Quadra Raimundo Portela',  '64027-040', 782, 'Quadra 42, Lote 78',  'Promorar',  'Teresina',  'PI',  '(86) 2794-9586',  '(86) 98793-5042', 'Ativo');
insert into pessoa values ( '362912334-10', 'Aluno',  'Pietro Bruno Lopes',  'Rua Paraíso do Calabetão',  '41227-188', 988, 'Quadra 43, Lote 79',  'Calabetão',  'Salvador',  'BA',  '(71) 3598-7248',  '(71) 99925-1670', 'Ativo');
insert into pessoa values ( '366078815-56', 'Aluno',  'Filipe Kauê Ruan Gomes',  'Rua Votorantin',  '59124-110', 138, 'Quadra 44, Lote 80',  'Potengi',  'Natal',  'RN',  '(84) 2559-3095',  '(84) 98586-1700', 'Ativo');
insert into pessoa values ( '381277181-06', 'Aluno',  'Luan Sérgio Fernando Rocha',  'Travessa Libra',  '29117-250', 720, 'Quadra 45, Lote 81',  'Alvorada',  'Vila Velha',  'ES',  '(27) 3652-6626',  '(27) 98139-7814', 'Ativo');
insert into pessoa values ( '387565508-71', 'Aluno',  'Gabrielly Lara Araújo',  'Rua Pedro Celestino',  '79904-566', 463, 'Quadra 46, Lote 82',  'Centro',  'Ponta Porã',  'MS',  '(67) 3768-2898',  '(67) 98906-1118', 'Ativo');
insert into pessoa values ( '427437279-00', 'Aluno',  'Davi Osvaldo Figueiredo',  'Rua Jequitinhonha',  '59088-210', 311, 'Quadra 47, Lote 83',  'Neópolis',  'Natal',  'RN',  '(84) 2589-6091',  '(84) 98637-8386', 'Ativo');
insert into pessoa values ( '431540089-00', 'Aluno',  'Pedro Miguel Castro',  'Rua Horizonte',  '45606-150', 105, 'Quadra 48, Lote 84',  'São Pedro',  'Itabuna',  'BA',  '(73) 3984-7830',  '(73) 99328-0509', 'Ativo');
insert into pessoa values ( '445485276-64', 'Aluno',  'Filipe Ryan Edson de Paula',  'Rua Idalina Santos de Souza',  '13181-150', 350, 'Quadra 49, Lote 85',  'Parque das Nações (Nova Veneza)',  'Sumaré',  'SP',  '(19) 3598-8723',  '(19) 99257-3391', 'Ativo');
insert into pessoa values ( '453184217-09', 'Aluno',  'Stella Camila Ferreira',  'Rua Doutor Manoel de Barros Lima',  '53030-240', 163, 'Quadra 50, Lote 86',  'Bairro Novo',  'Olinda',  'PE',  '(81) 3831-3779',  '(81) 98482-7240', 'Ativo');
insert into pessoa values ( '461803800-40', 'Aluno',  'Renato João Nogueira',  'Rua Sete',  '68551-758', 226, 'Quadra 51, Lote 87',  'Viviane',  'Redenção',  'PA',  '(94) 3891-4321',  '(94) 98305-3459', 'Ativo');
insert into pessoa values ( '465393253-04', 'Aluno',  'Samuel Diogo Alves',  'Rua da Baveima',  '41350-460', 454, 'Quadra 52, Lote 88',  'Nova Brasília',  'Salvador',  'BA',  '(71) 3644-6262',  '(71) 98264-0858');
insert into pessoa values ( '478115944-39', 'Aluno',  'Bernardo Thales Drumond',  'Quadra 106 Norte Avenida LO 4',  '77006-050', 330, 'Quadra 53, Lote 89',  'Plano Diretor Norte',  'Palmas',  'TO',  '(63) 2556-4040',  '(63) 99442-9977', 'Ativo');
insert into pessoa values ( '510874492-78', 'Aluno',  'Mariah Stella Ayla da Rosa',  'Rua Sucuba',  '69307-242', 605, 'Quadra 54, Lote 90',  'Paraviana',  'Boa Vista',  'RR',  '(95) 3692-4981',  '(95) 99287-0332', 'Ativo');
insert into pessoa values ( '592310952-26', 'Aluno',  'Gael Pedro Henrique Mendes',  'Travessa Riozinho do Rola',  '69901-151', 942, 'Quadra 55, Lote 91',  'Morada do Sol',  'Rio Branco',  'AC',  '(68) 2707-3368',  '(68) 99318-3920', 'Ativo');
insert into pessoa values ( '614365114-02', 'Aluno',  'Carlos Bento Marcos Campos',  'Rua do Melro',  '59068-010', 596, 'Quadra 56, Lote 92',  'Pitimbu',  'Natal',  'RN',  '(84) 3916-5439',  '(84) 99417-9816', 'Ativo');
insert into pessoa values ( '616788807-87', 'Aluno',  'Isadora Rebeca Adriana Viana',  'Rua Honduras',  '37010-700', 669, 'Quadra 57, Lote 93',  'Vila Pinto',  'Varginha',  'MG',  '(35) 3721-8691',  '(35) 99222-0007', 'Ativo');
insert into pessoa values ( '650246316-92', 'Aluno',  'Kaique Carlos Eduardo Geraldo Barros',  'Rua Coronel Spyer',  '39400-111', 589, 'Quadra 58, Lote 94',  'Centro',  'Montes Claros',  'MG',  '(38) 3798-9892',  '(38) 98542-2292', 'Ativo');
insert into pessoa values ( '651126426-29', 'Aluno',  'Maitê Emily Pires',  'Rua das Aroeiras',  '59625-460', 321, 'Quadra 59, Lote 95',  'Presidnte Costa e Silva',  'Mossoró',  'RN',  '(84) 2766-9852',  '(84) 99481-9926', 'Ativo');
insert into pessoa values ( '718362708-01', 'Aluno',  'Fábio Diogo Caldeira',  'Rua Santa Rosa de Lima',  '89035-195', 127, 'Quadra 60, Lote 96',  'Vila Nova',  'Blumenau',  'SC',  '(47) 2741-5423',  '(47) 98697-0021', 'Ativo');
insert into pessoa values ( '724347313-09', 'Aluno',  'Isabelly Aparecida Isis Lopes',  'Avenida Noronha Almeida',  '64045-200', 524, 'Quadra 61, Lote 97',  'Noivos',  'Teresina',  'PI',  '(86) 3803-2784',  '(86) 98108-0992', 'Ativo');
insert into pessoa values ( '733726830-05', 'Aluno',  'Lorena Cláudia Vieira',  'Quadra 208 Norte Avenida NS 8',  '77006-254', 401, 'Quadra 62, Lote 98',  'Plano Diretor Norte',  'Palmas',  'TO',  '(63) 2845-9912',  '(63) 99621-1338', 'Ativo');
insert into pessoa values ( '766168866-20', 'Aluno',  'Mateus Alexandre Teixeira',  'Rua Alvino Batista',  '65607-713', 875, 'Quadra 63, Lote 99',  'Luiza Queiroz',  'Caxias',  'MA',  '(99) 3787-2031',  '(99) 98389-6903', 'Ativo');
insert into pessoa values ( '853612737-67', 'Aluno',  'Clarice Sebastiana da Costa',  'Rua CJ-10',  '69313-188', 333, 'Quadra 64, Lote 100',  'Jóquei Clube',  'Boa Vista',  'RR',  '(95) 2857-1358',  '(95) 99574-2903', 'Ativo');
insert into pessoa values ( '858710337-76', 'Aluno',  'Julia Elaine Luzia Baptista',  'Rua Um',  '24919-350', 604, 'Quadra 65, Lote 101',  'Pindobal (Ponta Negra)',  'Maricá',  'RJ',  '(21) 2634-4578',  '(21) 98194-1904', 'Ativo');
insert into pessoa values ( '914197667-32', 'Aluno',  'Anderson Hugo José Nunes',  'Rua Salustiano José dos Santos',  '57306-590', 269, 'Quadra 66, Lote 102',  'Cavaco',  'Arapiraca',  'AL',  '(82) 2509-7097',  '(82) 98811-3077', 'Ativo');
insert into pessoa values ( '928208707-75', 'Aluno',  'Matheus Luiz Samuel Gomes',  'Avenida Padre Anchieta',  '69314-146', 450, 'Quadra 67, Lote 103',  'Santa Tereza',  'Boa Vista',  'RR',  '(95) 3833-3436',  '(95) 99340-1698', 'Ativo');
insert into pessoa values ( '934215143-48', 'Aluno',  'Melissa Flávia Carolina dos Santos',  'Rua Abisayão Meireles',  '23897-450', 372, 'Quadra 68, Lote 104',  'Parque Jacimar',  'Seropédica',  'RJ',  '(21) 3921-4965',  '(21) 98246-3014', 'Ativo');
insert into pessoa values ( '953344337-59', 'Aluno',  'Bárbara Allana Antonella da Cruz',  'Rua São José',  '85909-160', 613, 'Quadra 69, Lote 105',  'Vila Pioneiro',  'Toledo',  'PR',  '(45) 3882-4943',  '(45) 99353-6289', 'Ativo');
insert into pessoa values ( '972669672-01', 'Aluno',  'Marcos Mateus Heitor Santos',  'Avenida Castelo Branco',  '77427-008', 872, 'Quadra 70, Lote 106',  'Residencial Jardim América',  'Gurupi',  'TO',  '(63) 3918-1624',  '(63) 98119-5382', 'Ativo');
insert into pessoa values ('003381965-87', 'Coordenador', 'Pedro Álvares Cabral', 'Avenida do contorno', '75.251-888', 's/n', 'Quadra 16, Lote 29', 'Jardim Tropical', 'Goiânia', 'GO', '(62) 9925441254', '(64) 989542547', 'Ativo');
insert into pessoa values ('985514698-98', 'Coordenador', 'Cristovão Colombo', 'Alameda dos Buritis', '85.547-147', '4.254', 'Quadra 29, Lote 65', 'Residencial Norte', 'Goiânia', 'GO', '(62) 9896574521', '(62) 3254-6587', 'Ativo');						   
insert into pessoa values ('445514110-01', 'Coordenador', 'Januário Bleing Cool', 'Alameda sete', '12.555-147', '4.254', 'Quadra 29, Lote 65', 'Bairro Sul', 'Goiânia', 'GO', '(62) 9896574521', '(62) 3254-6587', 'Ativo');						   

insert into professor values ( '001873678-50', 'Doutor', 'Inglês');
insert into professor values ( '045748243-52', 'Doutor', 'Inglês');
insert into professor values ( '066060251-25', 'Doutor', 'Inglês');
insert into professor values ( '104326426-41', 'Doutor', 'Inglês');
insert into professor values ( '116435196-62', 'Doutor', 'Inglês');
insert into professor values ( '140724125-70', 'Doutor', 'Inglês');
insert into professor values ( '177192260-54', 'Doutor', 'Inglês');
insert into professor values ( '194906304-62', 'Doutor', 'Inglês');
insert into professor values ( '287571160-16', 'Doutor', 'Inglês');
insert into professor values ( '288605586-70', 'Doutor', 'Inglês');
insert into professor values ( '298772616-34', 'Doutor', 'Inglês');
insert into professor values ( '301507952-20', 'Doutor', 'Inglês');

insert into coordenador values('003381965-87');
insert into coordenador values('985514698-98');
insert into coordenador values('445514110-01');

insert into curso values (1, 'Análise e Desenvolvimento de Sistemas', '003381965-87');
insert into curso values (2, 'Redes', '985514698-98');
insert into curso values (3, 'Logistica', '445514110-01');

insert into disciplina values (1, 1,'Algoritmo', 0, 80, null, null, '104326426-41');
insert into disciplina values (2, 1,'Comunicação Metodologia e Pesquisa', 0, 20, null, null, '104326426-41');
insert into disciplina values (3, 1,'Engenharia de Software', 0, 40, null, null, '001873678-50');
insert into disciplina values (4, 2,'Fundamento de Arquitetura de Computadores', 0, 40, null, null, '301507952-20');
insert into disciplina values (5, 1,'Lógica Matemática', 0, 40, null, null, '194906304-62');
insert into disciplina values (6, 2,'Matemática e Estatística', 0, 40, null, null, '194906304-62');
insert into disciplina values (7, 1,'Laboratório de Linguagem e Programação', 0, 40, null, null, '001873678-50');

insert into disciplina values (8, 1,' Programação Orientada a Objeto', 1, 80, null, null, '045748243-52');
insert into disciplina values (9, 1,'Engenharia de Requisitos', 3, 20, null, null, '116435196-62');
insert into disciplina values (10, 2,'Sistemas Operacionais', 0, 40, null, null, '287571160-16');
insert into disciplina values (11, 2,'Redes de Computadores', 0, 40, null, null, '287571160-16');
insert into disciplina values (12, 2,'Empreendedorismo', 0, 40, null, null, '066060251-25');
insert into disciplina values (13, 1,'Ética e Legislação', 0, 40, null, null, '288605586-70');
insert into disciplina values (14, 1,'Processos de Negócios', 0, 40, null, null, '298772616-34');

insert into disciplina values (15, 1,'Gestão de Projetos', 9, 80, null, null, '001873678-50');
insert into disciplina values (16, 2,'Estrutura de Dados', 0, 20, null, null, '116435196-62');
insert into disciplina values (17, 1,'Modelagem de Banco de Dados', 0, 40, null, null, '140724125-70');
insert into disciplina values (18, 1,'Arquitetura de Projeto de Software', 0, 40, null, null, '301507952-20');
insert into disciplina values (19, 1,'Padrões de Projetos', 0, 40, null, null, '045748243-52');
insert into disciplina values (20, 2,'Relações Humanas no Trabalho', 0, 40, null, null, '066060251-25');


insert into turma values ('1', 2018, 1, 'noite', 'segunda a sexta', 1);
insert into turma values ('2', 2018, 2, 'noite', 'segunda a sexta', 1);
insert into turma values ('3', 2019, 1, 'noite', 'segunda a sexta', 1);
insert into turma values ('4', 2019, 1, 'noite', 'segunda a sexta', 1);


insert into aluno values ('256493705-59', 1);
insert into aluno values ('316738031-48', 1);
insert into aluno values ('362912334-10', 1);
insert into aluno values ('366078815-56', 1);
insert into aluno values ('381277181-06', 1);
insert into aluno values ('387565508-71', 1);
insert into aluno values ('427437279-00', 1);
insert into aluno values ('431540089-00', 1);
insert into aluno values ('445485276-64', 1);
insert into aluno values ('453184217-09', 1);
insert into aluno values ('461803800-40', 1);
insert into aluno values ('465393253-04', 1);
insert into aluno values ('478115944-39', 1);
insert into aluno values ('510874492-78', 1);
insert into aluno values ('592310952-26', 1);
insert into aluno values ('614365114-02', 1);
insert into aluno values ('616788807-87', 1);
insert into aluno values ('650246316-92', 1);
insert into aluno values ('651126426-29', 1);
insert into aluno values ('718362708-01', 1);
insert into aluno values ('724347313-09', 2);
insert into aluno values ('733726830-05', 2);
insert into aluno values ('766168866-20', 2);
insert into aluno values ('853612737-67', 2);
insert into aluno values ('858710337-76', 2);
insert into aluno values ('914197667-32', 2);
insert into aluno values ('928208707-75', 2);
insert into aluno values ('934215143-48', 2);
insert into aluno values ('953344337-59', 2);
insert into aluno values ('972669672-01', 2);

insert into matricula values ('256493705-59', 1, 'Ativa');
insert into matricula values ('316738031-48', 1, 'Ativa');
insert into matricula values ('362912334-10', 1, 'Ativa');
insert into matricula values ('366078815-56', 2, 'Ativa');
insert into matricula values ('381277181-06', 2, 'Ativa');
insert into matricula values ('387565508-71', 3, 'Ativa');
insert into matricula values ('427437279-00', 4, 'Ativa');


insert into diario values ('316738031-48', 1, 10, 0, 100, '01/08/2019');
insert into diario values ('256493705-59', 1, 7, 3, 75, '01/08/2019');