/*
This will be executed during the post-deployment phase.
Use it to apply scripts which are supposed to modify the 
data after the schema update took place.

!!!Make sure your scripts are idempotent(repeatable)!!!

Example invocation:
EXEC sp_execute_script @sql = 'UPDATE Table....', @author = 'Your Name'
*/




----SCRIPTS EXTRAIDO DO IDENTITY------------------------------------------------------------------------------------------------------------------------------------------
--INICIO---------------------------------------------------------------------------------------------------------------------------

GO
-- Create index [IX_UserId] on table [dbo].[TB_UsuariosAfirmacoes]
--
PRINT (N'Create index [IX_UserId] on table [dbo].[TB_UsuariosAfirmacoes]')
GO
CREATE INDEX IX_UserId
  ON dbo.TB_UsuariosAfirmacoes (UserId)
  ON [PRIMARY]


CREATE UNIQUE INDEX UserNameIndex
  ON dbo.TB_Usuarios (UserName)
  ON [PRIMARY]


GO


CREATE INDEX IX_UserId
  ON dbo.TB_UsuarioLogin (UserId)
  ON [PRIMARY]

GO
--
-- Create index [RoleNameIndex] on table [dbo].[TB_Perfil]
--
PRINT (N'Create index [RoleNameIndex] on table [dbo].[TB_Perfil]')
GO
CREATE UNIQUE INDEX RoleNameIndex
  ON dbo.TB_Perfil (Name)
  ON [PRIMARY]


GO

-- Create index [IX_RoleId] on table [dbo].[TB_Permissoes]
--
PRINT (N'Create index [IX_RoleId] on table [dbo].[TB_Permissoes]')
GO
CREATE INDEX IX_RoleId
  ON dbo.TB_Permissoes (RoleId)
  ON [PRIMARY]
GO

--
-- Create index [IX_UserId] on table [dbo].[TB_Permissoes]
--
PRINT (N'Create index [IX_UserId] on table [dbo].[TB_Permissoes]')
GO
CREATE INDEX IX_UserId
  ON dbo.TB_Permissoes (UserId)
  ON [PRIMARY]
GO
-- 
-- Dumping data for table __MigrationHistory
--
PRINT (N'Dumping data for table __MigrationHistory')
EXEC(N'INSERT dbo.__MigrationHistory VALUES (N''202007120710585_initialize'', N''Infra.Migrations.Configuration'', 0x1F8B0800000000000400ED5CDD6EE33616BE2FB0EF20E86AB748A324832EBA81DD22E324DBA0931F8C9362EF0246A21DA212E98A549A60D127EB451FA9AF505222658A22654956E404180C3088499EEF1C92873C87E467FFF5C79F931F9E93D87B822945044FFDC3FD03DF83382411C2CBA99FB1C537DFF93F7CFF8FAF266751F2ECFDACDA7D10EDB824A653FF91B1D57110D0F0112680EE27284C09250BB61F92240011098E0E0EFE131C1E069043F81CCBF3269F33CC5002F30FFCE38CE010AE5806E24B12C198CA725E33CF51BD2B9040BA02219CFA17789182FD53C080EF9DC408700BE6305EF81EC09830C0B87DC77714CE594AF072BEE20520BE7D5941DE6E01620AA5DDC7EBE66DBB707024BA10AC051554985146928E80871FE49804A678AF91F5CB31E3A376C64797BD885EE72337F53F939877DC54743C8B53D168EA9F92046144F68560042248F76F60BA40F1BE10DCF364F55EE900DC4FC4BF3D6F96C52C4BE114C38CA520DEF36EB28718853FC1975BF20BC4539CC5B16E1A378ED7550A78D14D4A5630652F9FE1421A7C11F95E50950B4CC1524C9329BA7381D98723DFBBE2CAC1430CCB99D7BA3E672485FF8518A680C1E8063006532C30603E7635ED86AE33CAF804287D1F091F26802D1A9B51C4FF0A833B2C5F73BE77099E3F41BC648F53FFE8DB7FFBDE397A86912A91A87718F125CA85589AC1CD5AAFC0135AE6DD36F4F3759252DFFB0CE3BC963EA255B19AF279BF97D5E72949C4E7C28D8AD2FB39C9D250184F6A55B7205D4256B56212AC7DB2D1530544776FBDA31948798992DE85CB0ADD75B7B5361526F6F170A5A2D9CB9B7D4EE96E8FD169EEFACFDB976DE6B5B699B304A078807DA685161EC917284D60B4ADCD3780D2DF481AFD08E86383E9FCCF014C9FC3304BF974CC194856AFAEEDE691607895250F62B58CA76BB0A9B9FD8D9C83903BF61916525BE37D22E12F24636738E2591DBC63A102141F6F51D21E6010734EC210527ACE9D194633C213D5EDF65BB1B5ED3ACECF6280127BA017E6DDABFA75A4D78A6BA15EAFB3C5FA264B3E9125C20D96A87AC392A2D86E89ACEB6A8940683044561B76E4A576338AAAAD739F7C5CFB07D15CFC4B247D9DD4291F5C01F0EADB76AEE967106743ABEAE48BF9CAEAEF8BB9F82E7C3157CC8B9F5024426C8B845C35E6F0ADDADB73FDCD1E6F58E69CDAC3A3EF0689086636A077736CE543ACC04D99EC50E9207E04232DBC134A4988F275A5052679F4AE5AC91324CF7D0E2F8C5567776E2F5F5C68C5971357CAE7D4379DFA1A9FC21832E89D84C59DD50CD090AFE1BA5373BD2D0C51914F33647D96AF1AF3754D075F5930151B39102708CA770384597D19221CA215889DA36048B40C54A28F25B659730A57108B18E3EC711BA5F603BF505CE21B83BE69442681E639CD0EA5A778AE89B4E67BD5991CC9A56CD9A56189CC915EC5A92C03318257593ADD46ABF3CA6934B792F97AE3649AC9FBEEDCCA382A1896C874E7F5DCAA3A1063B955B5D3EFC3AD8AD357E35C1A47B1DD3955F5E0375EF8AB8FC2581E55E9F11B73A822CBE2328C4BC054DDE9ACC4E8E78D45157C6696630DB7529E6CA8CCE0CC7917D073C8AA3708EBBCAE927F05CDC2CA396C006BC76901E2026825AC2E7EAC0832CCB68051B7365618B9AD1A30DAF4554754BD3A690DEA6F52A61F35A6C6A5C5E594D5FCB031A3D5E4B55933B7896A875A74B672F356EFAD336BDB98B719F636F7D7966E1900CAC6617AAC7CC5D1635B42B131A5E8DE6323133000948DC3F4583A8CA3C39650B729D875EF6E35466DE9D0EA285B6EB265DD2428F81AB2601238881D934BB05AF153B546F49025DEBC6079CCBE9977A74124054610520B1BA2B4B6D4C4480A96D0A8E5AAB9A5E728A54C704C1E8038D7CFA2A4D6CC12521C1BA552A8478DFA7CA99D53B5167FCB905D325E8AD0528FB852E69CF72711B13ABF2B35B6BDBA9827E8352006A9E55A7646E22CC1EE94C12DAD9E2C750455D61EA57831D1318A923AC224307A5FCB316A635B4BF0AA13D56A1AD70BA7E7549641BEFB74BA455DC3A912307D405D49991B45DD62E828AE9B8D9D4ECC5693D27342DED7FA9217A91590A2A82386F6AA5C03D3EADAA3561FFE75CC6A4D7B44E3755F8734AA3A58A9BFE1578CD42B7AE13946D4DEA2BD86FAABBD8E5EAF6D8F6C79BFD7A12DD53DB02D369B75ED512D4FFC3AB0A5BA3DF6FABDDFDC6CDF6004739E2F5AEF96C521B1DF96E9907D9D7D739810A83D01EB405A71472CF9C85B0393E56FCA5B9C67B3D6DE52DC05F4F31687AC7BE7A83CB556378EC6F7613766E5FDB4B23937BD1FBBF186F1C92162B97CF2ACC6C6BC68640FAC1D2ECD26A5F6F290691C2627F260B7F9AB04B5935ED1C4F7D474F24178A10C268503CF7F8D673182221CA8069700A305A4ACE02BF847078747C6B712DECE3704024AA3D8723036BF26509DAB11C83F488CE8467A4F57A6408539FB80D856E47CFC04D2F011D8D8CD173882CF53FFFFB9D4717EE922FECA8BF7BC0B7A87D1AF19AFB84D33E8FD5EE7FD0D47BD76D0E64B037F7F17ACF6DC1B368DF2C5FFEE0BA93DEF3AE5EBF0D83B1063BB1515BEADE242AA83E26EFCF92FCBCF42F559AF3FF7F2E9CF51EF639E8D9FAEACFC67029EFFD5D5342B077D2B440BCF7C28BC4186D0C523EF83E5E49047FC23CB39E4DD3A6BE794F731CDC927CF17DE966CF2F6814949EE203059CE79'
+ N'EF7663DB59B0AA918FB75ACB75827107B84148C4DBA525EF8CE26B8D5F39CF767B06EF60D83B736D6BA8EF194435E6EE001EDD9B9DBB2B42EEFA1C302E0F772CEE516B5DEF8271BB4BDE9A64F78C4CAD1DCB4F5CD7D26F91ECD88243BB4B4791017C64B2EC588EE2BA917E8B8EB29915BB4B3F193BEC8CE925ADC3CECE99AE75F692E37947BFF27571588BFB707E887E10573945F274FBF1BEF86D98D614D746866BA30AF96DC2569A9C34588706895D27BE3979B2CD34D90D6A4EC47D0908898569E764D436136A9B158ECFBAAD116D37D2126B524EE2F30ED9B535033776ABE22CC663F71B22D176EF58C5298D77D937C395EDDEAD21DCB00327B6FE3CC98380F67B683C0051B45C43885F47C330AC6CFF659B0BBC202A0A1916A926C611F9123210F1D8709232B40021E3D5E27E32FF8E6B7E2124CEE30F30BAC0D7195B658C7719260F71E5D24444B326FD39F1B76AF3E47A95FFCCC2105DE0662271AF7B8D3F66288E4ABBCF2DF7940E081126E5ADA0984B266E07972F25D215C12D81E4F095D1FD1626AB9883D16B3C074FB08F6DDCFD3EC125085FD6B7482E90CD13511DF6C92902CB14245462ACE5F947EEC351F2FCFDDF1D4EB69A16500000, N''6.4.4'')')
GO
-- 
-- Dumping data for table TB_Perfil
--
PRINT (N'Dumping data for table TB_Perfil')
-- Table SiGMunDB.dbo.TB_Perfil does not contain any data (it is empty)
-- 
-- Dumping data for table TB_Permissoes
--
PRINT (N'Dumping data for table TB_Permissoes')
-- Table SiGMunDB.dbo.TB_Permissoes does not contain any data (it is empty)
-- 
-- Dumping data for table TB_UsuarioLogin
--
PRINT (N'Dumping data for table TB_UsuarioLogin')
-- Table SiGMunDB.dbo.TB_UsuarioLogin does not contain any data (it is empty)
-- 
-- Dumping data for table TB_Usuarios
--
PRINT (N'Dumping data for table TB_Usuarios')
-- Table SiGMunDB.dbo.TB_Usuarios does not contain any data (it is empty)
-- 
-- Dumping data for table TB_UsuariosAfirmacoes
--
PRINT (N'Dumping data for table TB_UsuariosAfirmacoes')
-- Table SiGMunDB.dbo.TB_UsuariosAfirmacoes does not contain any data (it is empty)

USE SiGMunDB
GO

IF DB_NAME() <> N'SiGMunDB' SET NOEXEC ON
GO

--
-- Create foreign key [FK_dbo.TB_UsuarioLogin_dbo.TB_Usuarios_UserId] on table [dbo].[TB_UsuarioLogin]
--
PRINT (N'Create foreign key [FK_dbo.TB_UsuarioLogin_dbo.TB_Usuarios_UserId] on table [dbo].[TB_UsuarioLogin]')
GO
ALTER TABLE dbo.TB_UsuarioLogin
  ADD CONSTRAINT [FK_dbo.TB_UsuarioLogin_dbo.TB_Usuarios_UserId] FOREIGN KEY (UserId) REFERENCES dbo.TB_Usuarios (Id) ON DELETE CASCADE
GO

--
-- Create foreign key [FK_dbo.TB_UsuariosAfirmacoes_dbo.TB_Usuarios_UserId] on table [dbo].[TB_UsuariosAfirmacoes]
--
PRINT (N'Create foreign key [FK_dbo.TB_UsuariosAfirmacoes_dbo.TB_Usuarios_UserId] on table [dbo].[TB_UsuariosAfirmacoes]')
GO
ALTER TABLE dbo.TB_UsuariosAfirmacoes
  ADD CONSTRAINT [FK_dbo.TB_UsuariosAfirmacoes_dbo.TB_Usuarios_UserId] FOREIGN KEY (UserId) REFERENCES dbo.TB_Usuarios (Id) ON DELETE CASCADE
GO

--
-- Create foreign key [FK_dbo.TB_Permissoes_dbo.TB_Perfil_RoleId] on table [dbo].[TB_Permissoes]
--
PRINT (N'Create foreign key [FK_dbo.TB_Permissoes_dbo.TB_Perfil_RoleId] on table [dbo].[TB_Permissoes]')
GO
ALTER TABLE dbo.TB_Permissoes
  ADD CONSTRAINT [FK_dbo.TB_Permissoes_dbo.TB_Perfil_RoleId] FOREIGN KEY (RoleId) REFERENCES dbo.TB_Perfil (Id) ON DELETE CASCADE
GO

--
-- Create foreign key [FK_dbo.TB_Permissoes_dbo.TB_Usuarios_UserId] on table [dbo].[TB_Permissoes]
--
PRINT (N'Create foreign key [FK_dbo.TB_Permissoes_dbo.TB_Usuarios_UserId] on table [dbo].[TB_Permissoes]')
GO
ALTER TABLE dbo.TB_Permissoes
  ADD CONSTRAINT [FK_dbo.TB_Permissoes_dbo.TB_Usuarios_UserId] FOREIGN KEY (UserId) REFERENCES dbo.TB_Usuarios (Id) ON DELETE CASCADE
GO
SET NOEXEC OFF
GO
------------------------------------------------fim---------------------------------------------------------------------------------------------------------------------------



-------------------------Inserir Perfil------------------------------------
EXEC SP_Perfil_Inserir @Name = 'ADMINISTRADOR',@Estado = 1,@DataCadastro = '2020-10-20' ,@Idcadastrador = 1
GO
EXEC SP_Perfil_Inserir @Name = 'CHEFE DE DEPARTAMENTO',@Estado = 1,@DataCadastro = '2020-10-20' ,@Idcadastrador = 1
GO
EXEC SP_Perfil_Inserir @Name = 'FUNCIONARIO',@Estado = 1,@DataCadastro = '2020-10-20' ,@Idcadastrador = 1
GO
INSERT INTO TB_TipoDocIdentificacao (Nome)
  VALUES ('B.I'),('OUTRO')
  go
---------------------------Inserir Usuario------------------------------------
EXEC SP_Usuario_Inserir 
 @NomeCompleto = 'Administrador do Sistema'
,@Estado = 1
,@DataCadastro = '2020-07-29'
,@Email = 'admin@sigmun.co.ao'
,@EmailConfirmed = 0
,@PasswordHash = 'tmn9qEShotvDvtwMD8fJ2Q=='
,@SecurityStamp = '0'
,@PhoneNumber = '00000000'
,@PhoneNumberConfirmed =0
,@TwoFactorEnabled = 0
,@LockoutEndDateUtc = '2020-07-29'
,@LockoutEnabled = 0
,@AccessFailedCount = 0
,@UserName = 'Admin'
,@PerfilId = 1
,@IdCadastrador=1
GO
------------------Estado Civil----------------------------
INSERT dbo.TB_EstadoCivil(EstadoCivilId,EstadoCivilNome)VALUES(1,'SOLTEIRO(A)'),(2,'CASADO(A)'),(3,'DIVORCIADO(A)'),(4,'VIÚVO(A)')
GO
-----------------------------INSERIR PERMISSAO--------------------------------------
--EXEC SP_Permissao_Inserir @UserId = 1,@RoleId = 1
go
---------------------------------Generos-----------------------------------------
INSERT dbo.TB_Generos(GeneroId,GeneroNome)VALUES(1,'MASCULINO'),(2,'FEMENINO')
go
------------------------------Grau Parentesco-------------------------
INSERT dbo.TB_GrauParentesco(GrauParentescoId,GrauParentescoIdNome)
VALUES
(1,'AVÓS(MATERNO)'),
(2,'AVÓS(PATERNO)'),
(3,'MÃE'),
(4,'PAI'),
(5,'FILHO(A)'),
(7,'NETO(A)'),
(8,'BISNETO(A)'),
(9,'TIO(A)'),
(10,'PRIMO(A)'),
(11,'IRMÃO(Ã)'),
(12,'ESPOSO(A)'),
(13,'SOGRO(A)'),
(14,'CUNHADO(A)'),
(15,'CONCUNHADO(A)'),
(16,'PRÓPRIO')
go
---------------------------Provibncias--------------------------------
INSERT INTO dbo.TB_Provincias(ProvinciaId,ProvinciaNome)VALUES
(1, 'BENGO'),
(2, 'BENGUELA'),
(3, 'BIÉ'),
(4, 'CABINDA'),
(5, 'CUANDO-CUBANCO'),
(6, 'CUNENE'),
(7, 'HUAMBO'),
(8, 'HUÍLA'),
(9, 'KWANZA NORTE'),
(10,'KWANZA SUL'),
(11,'LUANDA'),
(12,'LUNDA NORTE'),
(13,'LUNDA SUL'),
(14,'MALANJE'),
(15,'MOXICO'),
(16,'NAMIBE'),
(17,'UÍGE'),
(18,'ZAIRE')

go
-----------------------------inserir Municipios--------------------------------------------
INSERT dbo.TB_Municipios(MunicipioNome,MunicipioProvinciaId)VALUES

----BENGO
('AMBRIZ', 1),('BULA ATUMBA', 1),('DANDE', 1),('DEMBOS', 1),('NAMBUANGONGO', 1),('PANGO ALUQUÉM', 1),

-------BENGUELA
('BALOMBO', 2),('BAÍA FARTA', 2),('BENGUELA', 2),('BOCOIO', 2),('CAIMBAMBO', 2),('CATUMBELA', 2),('CHONGORÓI', 2),('CUBAL', 2),
('GANDA', 2),('LOBITO', 2),
------BIÉ
('ANDULO', 3),('CAMACUPA', 3),('CATABOLA', 3),('CHINGUAR', 3),('CHITEMBO', 3),('CUEMBA', 3),('CUNHINGA', 3),('KUITO', 3),('NHAREA', 3),
-----CABINDA
('BELIZE', 4),('BUCO-ZAU', 4),('CABINDA', 4),('CACONGO', 4),
----CUANDO CUBANGO
('CALAI', 5),('CUANGAR', 5),('CUCHI', 5),('CUITO CUANAVALE', 5),('DIRICO', 5),('LONGA', 5),('MAVINGA', 5),('MENONGUE', 5),
('NANCOVA', 5),('RIVUNGO', 5),
---CUNENE
('CAHAMA', 6),('CUANHAMA', 6),('CUROCA', 6),('CUVELAI', 6),('NAMACUNDE', 6),('OMBADJA', 6),
---HUAMBO
('BAILUNDO', 7),('CATCHIUNGO', 7),('CAÁLA', 7),('EKUNHA', 7),('HUAMBO', 7),('LONDUIMBALE', 7),('LONGONJO', 7),('MUNGO', 7),
('TCHICALA-TCHOLOANGA', 7),('TCHINDJENDJE', 7),('UCUMA', 7),


---HUÍLA
('CACONDA', 8),('CACULA', 8),('CALUQUEMBE', 8),('CHIANGE', 8),('CHIBIA', 8),('CHICOMBA', 8),('CHIPINDO', 8),('CUVANGO', 8),
('HUMPATA', 8),('JAMBA', 8),('LUBANGO', 8),('MATALA', 8),('QUILENGUES', 8),('QUIPUNGO', 8),

----KWANZA NORTE
('AMBACA', 9),('BANGA', 9),('BOLONGONGO', 9),('CAMBAMBE', 9),('CAZENGO', 9),('GOLUNGO ALTO', 9),('GONGUEMBO', 9),('LUCALA', 9),
('QUICULUNGO', 9),('SAMBA CAJÚ', 9),

----KWANZA SUL
('AMBOIM', 10),('CASSONGUE', 10),('CELA', 10),('CONDA', 10),('EBO', 10),('LIBOLO', 10),('MUSSENDE', 10),('PORTO AMBOIM',10),
('QUIBALA', 10),('QUILENDA', 10),('SELES', 10),('SUMBE', 10),
---LUANDA
('BELAS', 11),('CACUACO', 11),('CAZENGA', 11),('ÍCOLO E BENGO', 11),('LUANDA', 11),('QUIÇAMA', 11),('VIANA', 11),

---LUNDA NORTE
('CAMBULO', 12),('CAPENDA-CAMULEMBA', 12),('CAUNGULA', 12),('CHITATO', 12),('CUANGO', 12),('CUÍLO', 12),('LUBALO', 12),
('LUCAPA', 12),('XÁ MUTEBA', 12),

----LUNDA SUL
('CACOLO', 13),('DALA', 13),('MUCONDA', 13),('SAURIMO', 13),

----MALANJE
('CACUSO', 14),('CALANDULA', 14),('CAMBUNDI-CATEMBO', 14),('CANGANDALA', 14),('CAOMBO', 14),('CUABA N´ZOGE', 14),
('CUNDA-DIA-BASE', 14),('LUQUEMBO', 14),('MALANJE', 14),('MARIMBA', 14),('MASSANGO', 14),('MUCARI', 14),('QUELA', 14),
('QUIRIMA', 14),


-----MOXICO
('ALTO ZAMBEZE', 15),('BUNDAS', 15),('CAMANONGUE', 15),('LÉUA', 15),('LUAU', 15),('LUACANO', 15),('LUCHAZES', 15),
('LUENA', 15),('LUMEJE', 15),('MOXICO', 15),


-----NAMIBE
('BIBALA', 16),('CXAMUCUIO', 16),('MOÇÂMEDES', 16),('TÔMBUA', 16),('VIREI',16),

-----UIGE
('ALTO CAUALE', 17),('AMBUÍLA', 17),('BEMBE', 17),('BUENGAS', 17),('BUNGO', 17),('DAMBA', 17),('MACOCOLA', 17),
('MILUNGA', 17),('MUCABA', 17),('NEGAGE', 17),('PURI', 17),('QUIMBELE', 17),('QUITEXE', 17),('SANZA POMBO', 17),
('SONGO', 17),('UÍGE', 17),('ZOMBO', 17),

-----ZAIRE
('CUIMBA', 18),('M´BANZA KONGO', 18),('NOQUI', 18),('N´ZETO', 18),('SOYO',18),('TOMBOCO',18)

GO

--**************************************PROVINCIA DO MALANJE************************************
------------------COMUNA DE CACUSO-------------------------------
INSERT TB_Comunas (ComunaNome, ComunaMunicipioId)VALUES
   ('CACUSO', 113),('LOMBE', 113),('QUIZENGA', 113),('PUNGU A NDONGO', 113),('SOQUECO', 113),
  ------------------COMUNA DE CALANDULA-------------------------------
  ('CALANDULA', 114),('CATECO CANGOLA', 114),('COTA', 114),('CUALE', 114),('QUINJE', 114),
  ------------------COMUNA DE CAMBUNDI CATEMBO-------------------------------
  ('TALAMUNGONGO', 115),('CAMBUNDI CATEMBO', 115),('QUITAPA', 115),('DUMBA CAMBANGO', 115),
  ------------------COMUNA DE CANGANDALA-------------------------------
   ('CANGANDALA', 116),('BEMBO', 116),('CULAMAGIA', 116),('CARIBO', 116),
  ------------------COMUNA DE CAHOMBO-------------------------------
  ('MBANJI YA NGOLA', 117),('CAHOMBO', 117),('CAMBO SUINGINGE', 117),('MICANDA', 117),
  ------------------COMUNA DE CUABA N´ZOGE-------------------------------
  ('KIWABA NZOJI',118 ),('MUFUMA', 118),
  ------------------COMUNA DE CUNDA-DIA-BASE-------------------------------
  ('KUNDA DYA BAZE', 119),('MILANDO', 119),('LEMBA', 119),
  ------------------COMUNA DE LUQUEMBO-------------------------------
  ('QUIMBANGO', 120),('CAPUNDA', 120),('DOMBO WA ZANGA', 120),('LUQUEMBO', 120),('CUNGA PALANGA', 120),('RIMBA', 120),
  ------------------COMUNA DE MALANJE-------------------------------
  ('MALANJE', 121),('NGOLA LUIJI', 121),('CAMBAXE', 121),
  ------------------COMUNA DE MARIMBA-------------------------------
  ('MARIMBA', 122),('CAMBOMBO', 122),('TEMBO ALUMA', 122),
  ------------------COMUNA DE MASSANGO-------------------------------
  ('MASSANGO', 123),('QUIHUHU', 123),('QUINGUENGUE', 123),
  ------------------COMUNA DE MUCARI-------------------------------
  ('CATALA', 124)
  ,('CACULAMA', 124),('CAXINGA', 124),('MUQUIXE', 124),
  ------------------COMUNA DE QUELA-------------------------------
  ('QUELA', 125),('XANDEL', 125),('MOMA', 125),('BÂNGALAS', 125),
  ------------------COMUNA DE QUIRIMA-------------------------------
('SAUTAR', 126),('QUIRIMA', 126);
GO
--EXECUTE SP_Municipe_Inserir @MunicipeNomeCompleto = 'Aleksei Justino Mateus Dondo da Silva'
--                           ,@MunicipeDataNascimento = '1988-10-15'
--                           ,@MunicipeNDocIdent = '003013895ME035'
--                           ,@MunicipeTipoDocIdentificacao = 1
--                           ,@MunicipeDocDataEmissao = '2018-05-09'
--                           ,@MunicipeDocDataValidade = '2022-05-08'
--                           ,@MunicipeNIF = '003013895ME035'
--                           ,@MunicipeGenero = 1
--                           ,@MunicipeEstadoCivil = 2
--                           ,@MunicipeTelefone1 = '927060073'
--                           ,@MunicipeTelefone2 = '998515561'
--                           ,@MunicipeEmail = 'alekseidasilva@gmail.com'
--                           ,@MunicipeFoto = 'sem imagem'
--                           ,@MoradaCasaNumero = 'S/N'
--                           ,@MoradaZona = '4'
--                           ,@MoradaRuaId = 4
--                           ,@IdCadastrador = 1
go
--EXECUTE SP_Municipe_Inserir @MunicipeNomeCompleto = 'Telma Maria Damião da Costa  Silva'
--                           ,@MunicipeDataNascimento = '1994-04-24'
--                           ,@MunicipeNDocIdent = '0045LA045'
--                           ,@MunicipeTipoDocIdentificacao = 1
--                           ,@MunicipeDocDataEmissao = '2018-05-09'
--                           ,@MunicipeDocDataValidade = '2022-05-08'
--                           ,@MunicipeNIF = '0045LA045'
--                           ,@MunicipeGenero = 2
--                           ,@MunicipeEstadoCivil = 2
--                           ,@MunicipeTelefone1 = '984628288'
--                           ,@MunicipeTelefone2 = '998515561'
--                           ,@MunicipeEmail = 'duniaxp@hotmail.com'
--                           ,@MunicipeFoto = 'sem imagem'
--                           ,@MoradaCasaNumero = 'S/N'
--                           ,@MoradaZona = '4'
--                           ,@MoradaRuaId = 4
--                           ,@IdCadastrador = 1



 --INSERT INTO TB_Municipes (MunicipeId,MunicipeNM, MunicipeNomeCompleto, MunicipeDataNascimento,
 --MunicipeNDocIdent, MunicipeTipoDocIdentificacao, MunicipeDocDataEmissao, MunicipeDocDataValidade, 
 --MunicipeNIF, MunicipeGenero, MunicipeEstadoCivil, MunicipeTelefone1, MunicipeTelefone2, MunicipeEmail,
 --MunicipeEstado, MunicipeDataCadastro,MunicipeParenteNM,MunicipeGrauParentescoId,MunicipeFoto, IdCadastrador)
	--VALUES (1,123456789, 'Aleksei Justino Mateus Dondo da Silva', '1988-10-15', '003013895ME035',
	--1, GETDATE(), GETDATE(), '0047845LA045', 2, 2, '924628288', '998515561', 'telmasilva@gmail.com',
	--1, GETDATE(), 123456789,16,'Sem foto',1),
	--(2,987654321, 'Telma Maria Damião da Costa da Silva', '1994-04-24', '0047845LA045',
	--1, GETDATE(), GETDATE(), '003013895ME035', 1, 1, '927060073', '998515561', 'alekseidasilva@gmail.com',
	--1, GETDATE(), 123456789,12,'Sem foto',1);

	GO
	
	GO
	INSERT INTO TB_Bairros (BairroId, BairroNome, BairroComunaId)
  VALUES
  (1, 'AZUL', 34),
  (2, 'MAXINDE', 34),
  (3, 'RITONDO', 34),
  (4, 'NGOLA LUIJI 1', 35),
  (5, 'NGOLA LUIJI 2', 35),
  (6, 'NGOLA LUIJI 3', 35),
  (7, 'CAMBAXE 1', 36),
  (8, 'CAMBAXE 2', 36),
  (9, 'CAMBAXE 3', 36),
  (10, 'CANAMBUA', 34);
  GO
  INSERT INTO TB_Ruas (RuaId, RuaNome, RuaBairroId, IdCadastrador)
	VALUES (1, 'Antonio José de Almeida', 1, 1),
	(2, 'Ultra Machado', 1, 1),
	(3, 'Rua Principal da Maxinde', 2, 1),
	(4, 'Estrada direita da Guiné', 3, 1);
	
	